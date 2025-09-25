import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:flutter/services.dart';

import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/widgets/atoms/input_wrapper.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/blocs/record_stock.dart';
import 'package:inventory_management/models/entities/inventory_transport_type.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/models/entities/transaction_reason.dart';
import 'package:inventory_management/models/entities/transaction_type.dart';
import 'package:inventory_management/utils/utils.dart';
import 'package:inventory_management/widgets/localized.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:inventory_management/utils/i18_key_constants.dart' as i18;
import '../../blocs/app_initialization/app_initialization.dart';
import '../../blocs/auth/auth.dart';
import '../../blocs/inventory_management/stock_bloc.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18_local;
import '../../utils/constants.dart';
import '../../utils/extensions/extensions.dart';
import '../../utils/registration_delivery/registration_delivery_utils.dart';

class DynamicTabsPage extends LocalizedStatefulWidget {
  const DynamicTabsPage({super.key});

  @override
  LocalizedState<DynamicTabsPage> createState() => _DynamicTabsPageState();
}

class _DynamicTabsPageState extends LocalizedState<DynamicTabsPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  late final Map<String, FormGroup> _forms = {};
  late List<ProductVariantModel> products;
  late String receivedFrom;
  late String secondaryPartyType;
  late List<dynamic> _formkeys;
  final Map<String, StockModel> _tabStocks = {};
  String _sharedMRN = '';
  bool _isInitializing = true;
  String? senderIdToShowOnTab = '';

// fields to capture stock metadata
  String? senderId;
  String? senderType;
  String? receiverId;
  String? receiverType;
  String? transactionType;
  String? transactionReason;

  static const _transactionReasonKey = 'transactionReason';
  static const _transactionQuantityKey = 'quantity';
  static const _voucherSerialNumberKey = 'voucherSerialNumber';
  static const _statusVvmKey = 'statusVvm';
  static const _manufacturerKey = ' manufacturer';
  static const _expireDateKey = 'expireDate';
  static const _stockDamageKey = 'damageQuantity';
  static const _emptyVialsKey = 'emptyVialsQuantity';
  static const _unusableVVMFirst = 'unusableVvmFirst';
  static const _unusableVVMSecond = 'unusableVvmSecond';
  static const _batchNumberKey = 'batchNumberKey';
  static const _commentsKey = 'comments';
  static const _materialNoteNumberKey = 'materialNoteNumber';
  List<InventoryTransportTypes> transportTypes = [];
  List<String> skuList = [];

  @override
  void initState() {
    transportTypes = InventorySingleton().transportType;
    context
        .read<AuthBloc>()
        .add(const AuthUpdateProductSKUCountsEvent(skuCountUpdates: {}));
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    try {
      // Generate unique MRN first
      final mrnNumbers = await UniqueIdGeneration()
          .generateUniqueMaterialNoteNumber(
            loggedInUserId: context.loggedInUserUuid,
            returnCombinedIds: true,
          )
          .timeout(const Duration(seconds: 5));

      if (mrnNumbers.isEmpty) {
        throw Exception('Failed to generate MRN number');
      }

      _sharedMRN = mrnNumbers.first;

      transportTypes = InventorySingleton().transportType;
      context.read<LocationBloc>().add(const LoadLocationEvent());

      final state = context.read<StockBloc>().state;
      if (state is StockSelectedState) {
        products = state.selectedProducts;
        receivedFrom = state.receivedFrom;
        secondaryPartyType = state.secondaryPartyType;
        _tabController = TabController(length: products.length, vsync: this);
        _formkeys =
            List.generate(products.length, (_) => GlobalKey<FormState>());

        _initializeForms();
        await _initializeStocks();
      }
    } on TimeoutException {
      _sharedMRN = 'MRN-${DateTime.now().millisecondsSinceEpoch}';
      debugPrint('MRN generation timed out, using fallback');
    } catch (e) {
      _sharedMRN = 'MRN-${DateTime.now().millisecondsSinceEpoch}';
      debugPrint('Error generating MRN: $e');
    } finally {
      setState(() => _isInitializing = false);
    }
  }

  void _initializeForms() {
    final selectedProducts =
        products.map((variant) => variant.sku).whereType<String>().toList();

    final state = context.read<RecordStockBloc>().state;
    StockRecordEntryType entryType = state.entryType;

    _forms.addAll({
      for (final product in selectedProducts)
        product: FormGroup({
          _materialNoteNumberKey: FormControl<String>(value: _sharedMRN),
          _transactionReasonKey: FormControl<String>(),
          _voucherSerialNumberKey: FormControl<String>(
            validators: (InventorySingleton().isWareHouseMgr &&
                    entryType != StockRecordEntryType.returned)
                ? [
                    Validators.minLength(2),
                    Validators.maxLength(200),
                    Validators.required
                  ]
                : [],
          ),
          _statusVvmKey: FormControl<String>(),
          _manufacturerKey: FormControl<String>(),
          _stockDamageKey: FormControl<int>(
              validators: ((InventorySingleton().isWareHouseMgr &&
                          entryType == StockRecordEntryType.returned) ||
                      context.isCommunityDistributor &&
                          entryType == StockRecordEntryType.dispatch)
                  ? [
                      Validators.number(),
                      Validators.required,
                      Validators.max(1000000),
                    ]
                  : []),
          _emptyVialsKey: FormControl<int>(
              validators: context.isWardLevel &&
                      entryType == StockRecordEntryType.returned
                  ? [
                      Validators.number(),
                      Validators.required,
                      Validators.max(1000000),
                    ]
                  : []),
          _unusableVVMFirst: FormControl<int>(
              validators: context.isWardLevel &&
                      entryType == StockRecordEntryType.returned
                  ? [
                      Validators.number(),
                      Validators.required,
                      Validators.max(1000000),
                    ]
                  : []),
          _unusableVVMSecond: FormControl<int>(
              validators: context.isWardLevel &&
                      entryType == StockRecordEntryType.returned
                  ? [
                      Validators.number(),
                      Validators.required,
                      Validators.max(1000000),
                    ]
                  : []),
          _transactionQuantityKey: FormControl<int>(
              validators: (InventorySingleton().isWareHouseMgr)
                  ? [
                      Validators.number(),
                      Validators.required,
                      Validators.min(1),
                      Validators.max(1000000),
                    ]
                  : [
                      Validators.number(),
                      Validators.required,
                      Validators.min(1),
                      Validators.max(1000000),
                    ]),
          // _waybillQuantityKey:
          //     FormControl<String>(validators: [Validators.required]),
          _batchNumberKey: FormControl<String>(),
          _expireDateKey: FormControl<String>(),
          _commentsKey: FormControl<String>(),
        }),
    });
  }

  Future<void> _initializeStocks() async {
    for (final product in products) {
      _tabStocks[product.sku ?? ''] = await _createEmptyStock(product);
    }
  }

  Future<StockModel> _createEmptyStock(ProductVariantModel product) async {
    final productSku = product.sku ?? '';
    final state = context.read<RecordStockBloc>().state;
    StockRecordEntryType entryType = state.entryType;

    // info setting the transaction related info here for the stock the model

    // setTransactionTypeAndReason(
    //   entryType,
    //   transactionType,
    //   transactionReason,
    // );

    switch (entryType) {
      case StockRecordEntryType.receipt:
        transactionType = TransactionType.received.toValue();
        transactionReason = TransactionReason.received.toValue();

        break;
      case StockRecordEntryType.dispatch:
        transactionType = TransactionType.dispatched.toValue();

        break;
      case StockRecordEntryType.returned:
        transactionType = TransactionType.received.toValue();
        transactionReason = TransactionReason.returned.toValue();

        break;
      case StockRecordEntryType.loss:
        transactionType = TransactionType.dispatched.toValue();

        break;
      case StockRecordEntryType.damaged:
        transactionType = TransactionType.dispatched.toValue();
        break;
    }

    // setSenderReceiverIdAndType(
    //     entryType, senderId, senderType, receiverId, receiverType);
    final secondartParty = receivedFrom.contains(("FAC_"))
        ? receivedFrom.replaceFirst("FAC_", "")
        : receivedFrom;

    final primaryType = BlocProvider.of<RecordStockBloc>(
      context,
    ).state.primaryType;

    final primaryId = BlocProvider.of<RecordStockBloc>(
      context,
    ).state.primaryId;

    switch (entryType) {
      case StockRecordEntryType.receipt:
      case StockRecordEntryType.loss:
      case StockRecordEntryType.damaged:
      case StockRecordEntryType.returned:
        senderId = secondaryPartyType == 'STAFF'
            ? secondartParty.split(Constants.pipeSeparator).last
            : secondartParty;
        senderType = secondaryPartyType;
        receiverId = primaryId;
        receiverType = primaryType;
        senderIdToShowOnTab = senderId;

        break;
      case StockRecordEntryType.dispatch:
        receiverId = secondaryPartyType == 'STAFF'
            ? secondartParty.split(Constants.pipeSeparator).last
            : secondartParty;
        receiverType = secondaryPartyType;
        senderId = primaryId;
        senderType = primaryType;
        senderIdToShowOnTab = senderId;
        break;
    }
    String? distributorName = secondaryPartyType == 'STAFF'
        ? secondartParty.split(Constants.pipeSeparator).first
        : null;
    return StockModel(
      id: null,
      facilityId: receivedFrom,
      productVariantId: product.id,
      quantity: _forms[productSku]
              ?.control(_transactionQuantityKey)
              ?.value
              ?.toString() ??
          '0',
      wayBillNumber: _forms[productSku]
          ?.control(_voucherSerialNumberKey)
          ?.value
          ?.toString(),
      transactionReason: transactionReason ??
          _forms[productSku]?.control(_transactionReasonKey)?.value?.toString(),
      clientReferenceId: IdGen.i.identifier,
      additionalFields: StockAdditionalFields(
        version: 1,
        fields: [
          AdditionalField('productName', product.sku),
          AdditionalField('variation', product.variation),
          AdditionalField(_materialNoteNumberKey, _sharedMRN),
          if (distributorName != null)
            AdditionalField('distributorName', distributorName),
        ],
      ),
      referenceId: context.projectId,
      referenceIdType: 'PROJECT',
      transactingPartyId: null,
      transactingPartyType: null,
      receiverId: receiverId,
      receiverType: receiverType,
      senderId: senderId,
      senderType: senderType,
      nonRecoverableError: false,
      rowVersion: null,
      transactionType: transactionType,
      auditDetails: AuditDetails(
        createdBy: InventorySingleton().loggedInUserUuid,
        createdTime: context.millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: InventorySingleton().loggedInUserUuid,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: InventorySingleton().loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
    );
  }

  void setTransactionTypeAndReason(StockRecordEntryType entryType,
      String? transactionType, String? transactionReason) {
    // todo set the reasons , for othe entryType (can capture from field once added)

    switch (entryType) {
      case StockRecordEntryType.receipt:
        transactionType = TransactionType.received.toValue();
        transactionReason = TransactionReason.received.toValue();

        break;
      case StockRecordEntryType.dispatch:
        transactionType = TransactionType.dispatched.toValue();

        break;
      case StockRecordEntryType.returned:
        transactionType = TransactionType.received.toValue();
        transactionReason = TransactionReason.returned.toValue();

        break;
      case StockRecordEntryType.loss:
        transactionType = TransactionType.dispatched.toValue();

        break;
      case StockRecordEntryType.damaged:
        transactionType = TransactionType.dispatched.toValue();
        break;
    }
  }

  void setSenderReceiverIdAndType(
    StockRecordEntryType entryType,
    String? senderId,
    String? senderType,
    String? receiverId,
    String? receiverType,
  ) {
    // info captured on the transaction details , secondaryParty
    // additionalCheck to correct this ,(TODO :correct this at stock detail page )

    final secondartParty = receivedFrom.contains(("FAC_"))
        ? receivedFrom.replaceFirst("FAC_", "")
        : receivedFrom;

    final primaryType = BlocProvider.of<RecordStockBloc>(
      context,
    ).state.primaryType;

    final primaryId = BlocProvider.of<RecordStockBloc>(
      context,
    ).state.primaryId;

    switch (entryType) {
      case StockRecordEntryType.receipt:
      case StockRecordEntryType.loss:
      case StockRecordEntryType.damaged:
      case StockRecordEntryType.returned:
        senderId = secondartParty;
        senderType = "WAREHOUSE";
        receiverId = primaryId;
        receiverType = primaryType;

        break;
      case StockRecordEntryType.dispatch:
        receiverId = secondartParty;
        receiverType = "WAREHOUSE";
        senderId = primaryId;
        senderType = primaryType;
        break;
    }
  }

  Widget _buildTabContent(BuildContext context, String productName,
      String receivedFrom, List<String> selectedProducts) {
    final stockState = context.read<RecordStockBloc>().state;
    bool isWareHouseMgr = InventorySingleton().isWareHouseMgr;
    bool isHealthFacilitySupervisor = context.isHealthFacilitySupervisor;
    bool hideVVM = false;

    final form = _forms[productName]!;

    hideVVM = productName == "IVR" || productName == "IVM" ? true : false;

    StockRecordEntryType entryType = stockState.entryType;
    bool isLastTab = _tabController.index == _tabController.length - 1;
    String quantityCountLabel;
    String quantityPartialCountLabel = "";
    String quantityWastedCountLabel = "";
    String pageTitle;

    switch (entryType) {
      case StockRecordEntryType.receipt:
        pageTitle = i18.stockDetails.receivedPageTitle;
        if (productName == Constants.spaq1 || productName == Constants.spaq2) {
          quantityCountLabel = i18.stockDetails.quantityReceivedLabel;
        } else {
          quantityCountLabel = i18.stockDetails.quantityReceivedLabel;
        }
        break;
      case StockRecordEntryType.dispatch:
        pageTitle = (isWareHouseMgr || isHealthFacilitySupervisor)
            ? i18.stockDetails.issuedPageTitle
            : i18.stockDetails.returnedPageTitle;
        if (productName == Constants.spaq1 || productName == Constants.spaq2) {
          quantityCountLabel = (isWareHouseMgr || isHealthFacilitySupervisor)
              ? i18.stockDetails.quantitySentLabel
              : i18.stockDetails.quantityReturnedLabel;
          quantityPartialCountLabel =
              i18_local.stockDetails.quantityPartialReturnedLabel;
          quantityWastedCountLabel =
              i18_local.stockDetails.quantityWastedReturnedLabel;
        } else {
          quantityCountLabel = (isWareHouseMgr || isHealthFacilitySupervisor)
              ? i18.stockDetails.quantitySentLabel
              : i18.stockDetails.quantityReturnedLabel;
        }
        break;
      case StockRecordEntryType.returned:
        pageTitle = i18.stockDetails.returnedPageTitle;
        if (productName == Constants.spaq1 || productName == Constants.spaq2) {
          quantityCountLabel =
              i18_local.stockDetails.quantityUnusedReturnedLabel;
          quantityPartialCountLabel =
              i18_local.stockDetails.quantityPartialReturnedLabel;
        } else {
          quantityCountLabel = i18.stockDetails.quantityReturnedLabel;
        }
        break;
      case StockRecordEntryType.loss:
        pageTitle = i18.stockDetails.lostPageTitle;
        quantityCountLabel = i18.stockDetails.quantityLostLabel;

        break;
      case StockRecordEntryType.damaged:
        pageTitle = i18.stockDetails.damagedPageTitle;
        quantityCountLabel = i18.stockDetails.quantityDamagedLabel;
        break;
    }

    return _KeepAliveTabContent(
      child: BlocBuilder<AppInitializationBloc, AppInitializationState>(
        builder: (context, appInitState) {
          if (appInitState is! AppInitialized) {
            return const Offstage();
          }
          final stockViabilityStatusOptions =
              appInitState.appConfiguration.statusVVM ??
                  <DeliveryCommentOptions>[];

          final stockManufacturerOptions =
              appInitState.appConfiguration.stockManufacturer ??
                  <DeliveryCommentOptions>[];
          return ReactiveForm(
            formGroup: form,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                DigitCard(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          localizations.translate(pageTitle),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                                child: Text(localizations.translate(
                                    i18_local.stockDetails.resource))),
                            Expanded(
                                child:
                                    Text(localizations.translate(productName))),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Text((context.isCommunityDistributor &&
                                      entryType ==
                                          StockRecordEntryType.dispatch)
                                  ? localizations.translate(
                                      i18_local.stockDetails.returnedTo)
                                  : localizations.translate(
                                      '${pageTitle}_${i18.stockReconciliationDetails.stockLabel}')),
                            ),
                            Expanded(
                                child: Text(
                              secondaryPartyType == 'STAFF'
                                  ? receivedFrom
                                      .split(Constants.pipeSeparator)[0]
                                  : localizations
                                      .translate('FAC_$receivedFrom'),
                            )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                DigitCard(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Stock Details',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Column(
                          children: [
                            ReactiveWrapperField(
                                formControlName: _transactionQuantityKey,
                                validationMessages: {
                                  "number": (object) => localizations.translate(
                                        '${quantityCountLabel}_ERROR',
                                      ),
                                  "max": (object) => localizations.translate(
                                        '${quantityCountLabel}_MAX_ERROR',
                                      ),
                                  "min": (object) => localizations.translate(
                                        '${quantityCountLabel}_MIN_ERROR',
                                      ),
                                },
                                showErrors: (control) =>
                                    control.invalid && control.touched,
                                builder: (field) {
                                  return LabeledField(
                                    label: localizations.translate(
                                      quantityCountLabel,
                                    ),
                                    isRequired: true,
                                    child: BaseDigitFormInput(
                                      errorMessage: field.errorText,
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                        decimal: true,
                                      ),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]'),
                                        ),
                                        LengthLimitingTextInputFormatter(9),
                                      ],
                                      onChange: (val) {
                                        field.control.markAsTouched();
                                        if (val == "") {
                                          field.control.value = null;
                                          return;
                                        }
                                        if (val != '') {
                                          field.control.value = int.parse(val);
                                        } else {
                                          field.control.value = null;
                                        }
                                      },
                                    ),
                                  );
                                }),
                            const SizedBox(height: 12),
                          ],
                        ),
                        if ((isWareHouseMgr) &&
                            entryType != StockRecordEntryType.returned &&
                            !hideVVM)
                          Column(
                            children: [
                              ReactiveWrapperField(
                                formControlName: _statusVvmKey,
                                builder: (field) {
                                  return LabeledField(
                                    label: localizations.translate(
                                      i18_local.stockDetails.statusVvmLabel,
                                    ),
                                    child: DigitDropdown(
                                      emptyItemText: localizations.translate(
                                        i18.common.noMatchFound,
                                      ),
                                      // TODO : add the mdms data for statusVVM
                                      items: stockViabilityStatusOptions
                                          .map((type) {
                                        return DropdownItem(
                                          name: localizations
                                              .translate(type.name),
                                          code: type.code,
                                        );
                                      }).toList(),
                                      selectedOption: (form
                                                  .control(_statusVvmKey)
                                                  .value !=
                                              null)
                                          ? DropdownItem(
                                              name: localizations.translate(form
                                                  .control(_statusVvmKey)
                                                  .value),
                                              code: form
                                                  .control(_statusVvmKey)
                                                  .value)
                                          : const DropdownItem(
                                              name: '', code: ''),
                                      onSelect: (value) {
                                        field.control.value = value.name;
                                        form.control(_statusVvmKey).value =
                                            value.code;
                                        form
                                            .control(_statusVvmKey)
                                            .updateValue(value.code);
                                        setState(() {});
                                      },
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        if ((isWareHouseMgr) &&
                            entryType != StockRecordEntryType.returned)
                          Column(
                            children: [
                              ReactiveWrapperField(
                                  formControlName: _voucherSerialNumberKey,
                                  builder: (field) {
                                    return InputField(
                                      type: InputType.text,
                                      label: localizations.translate(
                                        i18_local.stockDetails
                                            .voucherSerialNumberLabel,
                                      ),
                                      errorMessage: field.errorText,
                                      onChange: (val) {
                                        field.control.value = val;
                                      },
                                      isRequired: !(context
                                              .isHealthFacilitySupervisor &&
                                          entryType ==
                                              StockRecordEntryType.dispatch),
                                    );
                                  }),
                              const SizedBox(height: 16),
                            ],
                          ),
                        if ((isWareHouseMgr) &&
                            entryType != StockRecordEntryType.returned)
                          Column(
                            children: [
                              ReactiveWrapperField(
                                formControlName: _manufacturerKey,
                                builder: (field) {
                                  return LabeledField(
                                    label: localizations.translate(
                                      i18_local.stockDetails.manufacturerLabel,
                                    ),
                                    child: DigitDropdown(
                                      emptyItemText: localizations.translate(
                                        i18.common.noMatchFound,
                                      ),
                                      //TODO : Add mdms data for manufacturer
                                      items:
                                          stockManufacturerOptions.map((type) {
                                        return DropdownItem(
                                          name: localizations
                                              .translate(type.name),
                                          code: type.code,
                                        );
                                      }).toList(),
                                      selectedOption: (form
                                                  .control(_manufacturerKey)
                                                  .value !=
                                              null)
                                          ? DropdownItem(
                                              name: localizations.translate(form
                                                  .control(_manufacturerKey)
                                                  .value),
                                              code: form
                                                  .control(_manufacturerKey)
                                                  .value)
                                          : const DropdownItem(
                                              name: '', code: ''),
                                      onSelect: (value) {
                                        field.control.value = value.name;
                                        form.control(_manufacturerKey).value =
                                            value.code;
                                        form
                                            .control(_manufacturerKey)
                                            .updateValue(value.code);
                                        setState(() {});
                                      },
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        if ((isWareHouseMgr) &&
                            entryType != StockRecordEntryType.returned)
                          Column(
                            children: [
                              ReactiveWrapperField(
                                  formControlName: _batchNumberKey,
                                  builder: (field) {
                                    return InputField(
                                      type: InputType.text,
                                      label: localizations.translate(
                                        i18_local.stockDetails.batchNumberLabel,
                                      ),
                                      errorMessage: field.errorText,
                                      onChange: (val) {
                                        if (val == '') {
                                          field.control.value = '0';
                                        } else {
                                          field.control.value = val;
                                        }
                                      },
                                    );
                                  }),
                              const SizedBox(height: 16),
                            ],
                          ),
                        if ((entryType == StockRecordEntryType.returned &&
                                context.isWarehouseManager) ||
                            (entryType == StockRecordEntryType.dispatch &&
                                context.isCommunityDistributor))
                          Column(
                            children: [
                              ReactiveWrapperField(
                                  formControlName: _stockDamageKey,
                                  validationMessages: {
                                    "number": (object) =>
                                        localizations.translate(
                                          '${quantityCountLabel}_ERROR',
                                        ),
                                    "max": (object) => localizations.translate(
                                          '${quantityCountLabel}_MAX_ERROR',
                                        ),
                                    "min": (object) => localizations.translate(
                                          '${quantityCountLabel}_MIN_ERROR',
                                        ),
                                  },
                                  showErrors: (control) =>
                                      control.invalid && control.touched,
                                  builder: (field) {
                                    return LabeledField(
                                      label: localizations.translate(
                                        i18_local.stockDetails.damageStockLabel,
                                      ),
                                      isRequired: true,
                                      child: BaseDigitFormInput(
                                        errorMessage: field.errorText,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(
                                          decimal: true,
                                        ),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]'),
                                          ),
                                          LengthLimitingTextInputFormatter(9),
                                        ],
                                        onChange: (val) {
                                          field.control.markAsTouched();
                                          if (val == "") {
                                            field.control.value = null;
                                            return;
                                          }
                                          if (val != '') {
                                            field.control.value =
                                                int.parse(val);
                                          } else {
                                            field.control.value = null;
                                          }
                                        },
                                      ),
                                    );
                                  }),
                              const SizedBox(height: 16),
                            ],
                          ),
                        if (entryType == StockRecordEntryType.returned &&
                            context.isWardLevel)
                          Column(
                            children: [
                              ReactiveWrapperField(
                                  formControlName: _emptyVialsKey,
                                  validationMessages: {
                                    "number": (object) =>
                                        localizations.translate(
                                          '${quantityCountLabel}_ERROR',
                                        ),
                                    "max": (object) => localizations.translate(
                                          '${quantityCountLabel}_MAX_ERROR',
                                        ),
                                    "min": (object) => localizations.translate(
                                          '${quantityCountLabel}_MIN_ERROR',
                                        ),
                                  },
                                  showErrors: (control) =>
                                      control.invalid && control.touched,
                                  builder: (field) {
                                    return LabeledField(
                                      label: localizations.translate(
                                        i18_local.stockDetails.emptyVialsLabel,
                                      ),
                                      isRequired: true,
                                      child: BaseDigitFormInput(
                                        errorMessage: field.errorText,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(
                                          decimal: true,
                                        ),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]'),
                                          ),
                                          LengthLimitingTextInputFormatter(9),
                                        ],
                                        onChange: (val) {
                                          field.control.markAsTouched();
                                          if (val == "") {
                                            field.control.value = null;
                                            return;
                                          }
                                          if (val != '') {
                                            field.control.value =
                                                int.parse(val);
                                          } else {
                                            field.control.value = null;
                                          }
                                        },
                                      ),
                                    );
                                  }),
                              const SizedBox(height: 16),
                            ],
                          ),
                        if (entryType == StockRecordEntryType.returned &&
                            context.isWardLevel)
                          Column(
                            children: [
                              ReactiveWrapperField(
                                  formControlName: _unusableVVMFirst,
                                  validationMessages: {
                                    "number": (object) =>
                                        localizations.translate(
                                          '${quantityCountLabel}_ERROR',
                                        ),
                                    "max": (object) => localizations.translate(
                                          '${quantityCountLabel}_MAX_ERROR',
                                        ),
                                    "min": (object) => localizations.translate(
                                          '${quantityCountLabel}_MIN_ERROR',
                                        ),
                                  },
                                  showErrors: (control) =>
                                      control.invalid && control.touched,
                                  builder: (field) {
                                    return LabeledField(
                                      label: localizations.translate(
                                        i18_local.stockDetails.unusableVvmFirst,
                                      ),
                                      isRequired: true,
                                      child: BaseDigitFormInput(
                                        errorMessage: field.errorText,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(
                                          decimal: true,
                                        ),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]'),
                                          ),
                                          LengthLimitingTextInputFormatter(9),
                                        ],
                                        onChange: (val) {
                                          field.control.markAsTouched();
                                          if (val == "") {
                                            field.control.value = null;
                                            return;
                                          }
                                          if (val != '') {
                                            field.control.value =
                                                int.parse(val);
                                          } else {
                                            field.control.value = null;
                                          }
                                        },
                                      ),
                                    );
                                  }),
                              const SizedBox(height: 16),
                            ],
                          ),
                        if (entryType == StockRecordEntryType.returned &&
                            context.isWardLevel)
                          Column(
                            children: [
                              ReactiveWrapperField(
                                  formControlName: _unusableVVMSecond,
                                  validationMessages: {
                                    "number": (object) =>
                                        localizations.translate(
                                          '${quantityCountLabel}_ERROR',
                                        ),
                                    "max": (object) => localizations.translate(
                                          '${quantityCountLabel}_MAX_ERROR',
                                        ),
                                    "min": (object) => localizations.translate(
                                          '${quantityCountLabel}_MIN_ERROR',
                                        ),
                                  },
                                  showErrors: (control) =>
                                      control.invalid && control.touched,
                                  builder: (field) {
                                    return LabeledField(
                                      label: localizations.translate(
                                        i18_local
                                            .stockDetails.unusableVvmSecond,
                                      ),
                                      isRequired: true,
                                      child: BaseDigitFormInput(
                                        errorMessage: field.errorText,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(
                                          decimal: true,
                                        ),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]'),
                                          ),
                                          LengthLimitingTextInputFormatter(9),
                                        ],
                                        onChange: (val) {
                                          field.control.markAsTouched();
                                          if (val == "") {
                                            field.control.value = null;
                                            return;
                                          }
                                          if (val != '') {
                                            field.control.value =
                                                int.parse(val);
                                          } else {
                                            field.control.value = null;
                                          }
                                        },
                                      ),
                                    );
                                  }),
                              const SizedBox(height: 16),
                            ],
                          ),
                        if ((isWareHouseMgr) &&
                            entryType != StockRecordEntryType.returned)
                          Column(
                            children: [
                              ReactiveWrapperField(
                                  formControlName: _expireDateKey,
                                  builder: (field) {
                                    return LabeledField(
                                      label: localizations.translate(
                                        i18_local.stockDetails.expireDateLabel,
                                      ),
                                      child: DigitDateFormInput(
                                        onChange: (val) =>
                                            field.control.value = val,
                                        firstDate: DateTime.now(),
                                        errorMessage: field.errorText,
                                      ),
                                    );
                                  }),
                              const SizedBox(height: 16),
                            ],
                          ),
                        const SizedBox(height: 16),
                        Column(
                          children: [
                            ReactiveWrapperField(
                              formControlName: _commentsKey,
                              builder: (field) {
                                return InputField(
                                  type: InputType.textArea,
                                  label: localizations.translate(
                                    i18.stockDetails.commentsLabel,
                                  ),
                                  errorMessage: field.errorText,
                                  onChange: (val) => field.control.value = val,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DigitButton(
                      size: DigitButtonSize.large,
                      type: DigitButtonType.primary,
                      onPressed: () async {
                        if (form.valid) {
                          if (_tabController.index < products.length - 1) {
                            if (form.valid) {
                              _tabController
                                  .animateTo(_tabController.index + 1);
                            }
                          } else {
                            int index = 0;
                            for (final form in _forms.values) {
                              form.markAllAsTouched();
                              if (form.invalid) {
                                _tabController.animateTo(index);
                                return;
                              }
                              index++;
                            }
                            await _handleFinalSubmission(
                                context, entryType, selectedProducts);
                          }
                        } else {
                          form.markAllAsTouched();
                        }
                      },
                      label: isLastTab
                          ? localizations.translate(i18.common.coreCommonSubmit)
                          : localizations.translate(i18.common.coreCommonNext),
                    ),
                    const SizedBox(height: 12),
                    // DigitButton(
                    //   type: DigitButtonType.secondary,
                    //   size: DigitButtonSize.large,
                    //   onPressed: () {
                    //     // Secondary action if needed
                    //   },
                    //   label: localizations.translate(
                    //     i18.common.coreCommonCancel,
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _saveCurrentTabData(
      String productName, StockRecordEntryType entryType) async {
    final form = _forms[productName]!;
    final currentStock = _tabStocks[productName]!;

    List<AdditionalField> additionalFields =
        currentStock.additionalFields?.fields ?? [];

    final Set<String> additionalFieldKeys = {
      "batchNumber",
      "comments",
      "partialBlistersReturned",
      "wastedBlistersReturned",
      "statusVvm",
      "manufacturer",
      "expireDate"
    };

    List<AdditionalField> filteredAdditionalFields = additionalFields
        .where((e) => !additionalFieldKeys.contains(e.key))
        .toList();

    _tabStocks[productName] = currentStock.copyWith(
      quantity: form.control(_transactionQuantityKey).value?.toString(),
      wayBillNumber: form.control(_voucherSerialNumberKey).value?.toString(),
      transactionReason:
          form.control(_transactionReasonKey).value?.toString() ??
              transactionReason,
      additionalFields: currentStock.additionalFields?.copyWith(
        fields: [
          ...(filteredAdditionalFields),
          if (form.control(_batchNumberKey).value != null)
            AdditionalField('batchNumber', form.control(_batchNumberKey).value),
          if (form.control(_commentsKey).value != null)
            AdditionalField('comments', form.control(_commentsKey).value),
          if (form.control(_statusVvmKey).value != null)
            AdditionalField('statusVvm', form.control(_statusVvmKey).value),
          if (form.control(_stockDamageKey).value != null)
            AdditionalField(
                'damageQuantity', form.control(_stockDamageKey).value),
          if (form.control(_manufacturerKey).value != null)
            AdditionalField(
                'manufacturer', form.control(_manufacturerKey).value),
          if (form.control(_expireDateKey).value != null)
            AdditionalField('expireDate', form.control(_expireDateKey).value),
          if (form.control(_emptyVialsKey).value != null)
            AdditionalField(
                'emptyVialsQuantity', form.control(_emptyVialsKey).value),
          if (form.control(_unusableVVMFirst).value != null)
            AdditionalField(
                'unusableVvmfirst', form.control(_unusableVVMFirst).value),
          if (form.control(_unusableVVMSecond).value != null)
            AdditionalField(
                'unusableVvmSecond', form.control(_unusableVVMSecond).value),
        ],
      ),
    );
  }

  Future<void> _handleFinalSubmission(BuildContext context,
      StockRecordEntryType entryType, List<String> selectedProducts) async {
    final theme = Theme.of(context);
    final submit = await showCustomPopup(
      context: context,
      builder: (popupContext) => Popup(
        title: localizations.translate(i18.stockDetails.dialogTitle),
        onOutsideTap: () {
          Navigator.of(popupContext).pop(false);
        },
        description: localizations.translate(
          i18.stockDetails.dialogContent,
        ),
        type: PopUpType.simple,
        actions: [
          DigitButton(
            label: localizations.translate(
              i18.common.coreCommonSubmit,
            ),
            onPressed: () {
              Navigator.of(
                popupContext,
              ).pop(true);
            },
            type: DigitButtonType.primary,
            size: DigitButtonSize.large,
          ),
          DigitButton(
            label: localizations.translate(
              i18.common.coreCommonCancel,
            ),
            onPressed: () {
              Navigator.of(
                popupContext,
              ).pop(false);
            },
            type: DigitButtonType.secondary,
            size: DigitButtonSize.large,
          ),
        ],
      ),
    ) as bool;

    if (submit && context.mounted) {
      // Loop through all stocks and dispatch individual events

      Map<String, int> skuCounts = context
          .getAllProductSkuCounts()
          .map((key, value) => MapEntry(key, value));

      for (var productName in selectedProducts) {
        await _saveCurrentTabData(productName, entryType);
      }

      for (final stockModel in _tabStocks.values) {
        int quantity = int.parse(stockModel.quantity.toString());
        int quantityWasted = int.parse(stockModel.additionalFields?.fields
                .firstWhereOrNull(
                    (element) => element.key == 'wastedBlistersReturned')
                ?.value
                ?.toString() ??
            '0');
        final totalQty = ((entryType == StockRecordEntryType.dispatch)
                ? quantity * -1
                : quantity) -
            quantityWasted;

        String? productName = stockModel.additionalFields?.fields
            .firstWhereOrNull((element) => element.key == 'productName')
            ?.value;

        if (skuCounts.isNotEmpty) {
          skuList = skuCounts.keys.toList();
        }

        // Custom logic based on productName
        if (entryType == StockRecordEntryType.dispatch) {
          if ((skuList.contains(productName) &&
                  // ignore: unnecessary_null_comparison
                  (skuCounts[productName]! + totalQty < 0)) ||
              (skuCounts[productName] == null)) {
            await DigitToast.show(
              context,
              options: DigitToastOptions(
                  localizations.translate(context.isCommunityDistributor
                      ? i18_local
                          .beneficiaryDetails.validationForExcessStockReturn
                      : i18_local
                          .beneficiaryDetails.validationForExcessStockDispatch),
                  true,
                  theme),
            );
            return;
          }
        }
        if (skuList.contains(productName)) {
          skuCounts[productName!] = (skuCounts[productName] ?? 0) + totalQty;
        }
      }

      for (final stockModel in _tabStocks.values) {
        context.read<RecordStockBloc>().add(
              RecordStockSaveStockDetailsEvent(
                stockModel: stockModel,
              ),
            );
        context.read<RecordStockBloc>().add(
              const RecordStockCreateStockEntryEvent(),
            );
      }

      context.read<AuthBloc>().add(
            AuthUpdateProductSKUCountsEvent(
              skuCountUpdates: skuCounts,
            ),
          );

      (context.router.parent() as StackRouter).maybePop();
      context.router.push(CustomAcknowledgementRoute(
          mrnNumber: _sharedMRN,
          stockRecords: _tabStocks.values.toList(),
          entryType: entryType));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isInitializing) {
      return const Center(child: CircularProgressIndicator());
    }

    final selectedProducts =
        products.map((variant) => variant.sku).whereType<String>().toList();

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: selectedProducts
              .map((product) => Tab(text: product.toUpperCase()))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: selectedProducts
            .map((product) => _buildTabContent(
                context, product, receivedFrom, selectedProducts))
            .toList(),
      ),
    );
  }

  void _nextTab() {
    if (_tabController.index < _tabController.length - 1) {
      _tabController.animateTo(_tabController.index + 1);
    }
  }

  num _getQuantityCount(Iterable<StockModel> stocks) {
    return stocks.fold<num>(
      0.0,
      (old, e) => (num.tryParse(e.quantity ?? '') ?? 0.0) + old,
    );
  }

  void clearQRCodes() {
    context.read<DigitScannerBloc>().add(const DigitScannerEvent.handleScanner(
          barCode: [],
          qrCode: [],
        ));
  }

  bool _isCurrentTabValid() {
    return _formkeys[_tabController.index].currentState?.validate() ?? false;
  }
}

class _KeepAliveTabContent extends StatefulWidget {
  final Widget child;

  const _KeepAliveTabContent({required this.child});

  @override
  State<_KeepAliveTabContent> createState() => _KeepAliveTabContentState();
}

class _KeepAliveTabContentState extends State<_KeepAliveTabContent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
