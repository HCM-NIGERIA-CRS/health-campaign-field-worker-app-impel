import 'package:auto_route/auto_route.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/input_wrapper.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/blocs/record_stock.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/models/entities/transaction_reason.dart';
import 'package:inventory_management/models/entities/transaction_type.dart';
import 'package:inventory_management/utils/i18_key_constants.dart' as i18;
import 'package:inventory_management/utils/utils.dart';
import 'package:registration_delivery/widgets/localized.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/auth/auth.dart';
import '../../router/app_router.dart';
import '../../utils/constants.dart';
import '../../utils/extensions/extensions.dart';
import 'package:collection/collection.dart';

import '../../widgets/custom_back_navigation.dart';
import '../../utils/i18_key_constants.dart' as i18_local;

@RoutePage()
class ViewStockRecordsLGAPage extends LocalizedStatefulWidget {
  final String mrnNumber;
  final List<StockModel> stockRecords;

  const ViewStockRecordsLGAPage({
    super.key,
    super.appLocalizations,
    required this.mrnNumber,
    required this.stockRecords,
  });

  @override
  State<ViewStockRecordsLGAPage> createState() =>
      _ViewStockRecordsLGAPageState();
}

class _ViewStockRecordsLGAPageState
    extends LocalizedState<ViewStockRecordsLGAPage> {
  late final FormGroup _form;

  int receiveQuantity = 0;
  int sentQuantity = 0;

  @override
  void initState() {
    super.initState();
    _form = FormGroup({
      'quantityReceived': FormControl<int>(
        validators: [
          Validators.required,
          Validators.min(1),
        ],
      ),
      'comments': FormControl<String>(),
    });
    final recordStockBloc = BlocProvider.of<RecordStockBloc>(context);
  }

  @override
  void dispose() {
    _form.dispose();
    super.dispose();
  }

  Future<void> _handleSubmission() async {
    if (_form.valid) {
      if (receiveQuantity > sentQuantity) {
        await DigitToast.show(
          context,
          options: DigitToastOptions(
              localizations.translate(context.isCDD
                  ? i18_local.beneficiaryDetails.validationForExcessStockReturn
                  : i18_local
                      .beneficiaryDetails.validationForExcessStockDispatch),
              true,
              Theme.of(context)),
        );
        return;
      }

      final updatedStocks = widget.stockRecords.map((stock) {
        final additionalFields = stock.additionalFields?.fields ?? [];

        final newFields = [
          ...additionalFields.where((field) =>
              field.key != 'quantityReceived' && field.key != 'comments'),
          AdditionalField('quantityReceived',
              _form.control('quantityReceived').value.toString()),
          if (_form.control('comments').value != null)
            AdditionalField('comments', _form.control('comments').value),
        ];

        return stock.copyWith(
          id: null,
          rowVersion: 1,
          clientReferenceId: IdGen.i.identifier,
          transactionType: TransactionType.received.toValue(),
          transactionReason: TransactionReason.received.toValue(),
          quantity: _form.control('quantityReceived').value.toString(),
          additionalFields: stock.additionalFields?.copyWith(
            fields: newFields,
          ),
          auditDetails: AuditDetails(
            createdBy: InventorySingleton().loggedInUserUuid,
            createdTime: context.millisecondsSinceEpoch(),
            lastModifiedBy: InventorySingleton().loggedInUserUuid,
            lastModifiedTime: context.millisecondsSinceEpoch(),
          ),
          clientAuditDetails: ClientAuditDetails(
            createdBy: InventorySingleton().loggedInUserUuid,
            createdTime: context.millisecondsSinceEpoch(),
            lastModifiedBy: InventorySingleton().loggedInUserUuid,
            lastModifiedTime: context.millisecondsSinceEpoch(),
          ),
        );
      }).toList();

      for (final stock in updatedStocks) {
        context.read<RecordStockBloc>().add(
              RecordStockSaveStockDetailsEvent(
                stockModel: stock,
              ),
            );
        context.read<RecordStockBloc>().add(
              const RecordStockCreateStockEntryEvent(),
            );

        final totalQty =
            int.parse(_form.control('quantityReceived').value.toString());

        int currentSpaq1Count = 0;
        int currentSpaq2Count = 0;

        String productName = stock.additionalFields?.fields
            .firstWhereOrNull((element) => element.key == "productName")
            ?.value;
        // Accumulate quantities based on product
        if (productName == Constants.spaq1) {
          currentSpaq1Count += totalQty;
        } else if (productName == Constants.spaq2) {
          currentSpaq2Count += totalQty;
        }
        context.read<AuthBloc>().add(
              AuthAddSpaqCountsEvent(
                spaq1Count: currentSpaq1Count,
                spaq2Count: currentSpaq2Count,
                blueVasCount: 0,
                redVasCount: 0,
              ),
            );
        // _tabController.animateTo(_tabController.index + 1);

        context.read<RecordStockBloc>().add(
              const RecordStockCreateStockEntryEvent(),
            );
      }

      context.router.push(
        CustomAcknowledgementRoute(
            mrnNumber: widget.mrnNumber,
            stockRecords: updatedStocks,
            entryType: StockRecordEntryType.receipt),
      );
    } else {
      _form.markAllAsTouched();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Assumption sender receiver Id not changed ,
    //using the same as downloaded stock data
    // and this flow is for stock receipt for LGA
    final senderIdToShowOnTab = widget.stockRecords.first.senderId;

    return Scaffold(
      body: ScrollableContent(
        header: const Column(
          children: [
            CustomBackNavigationHelpHeaderWidget(),
          ],
        ),
        children: [
          ReactiveForm(
            formGroup: _form,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  DigitCard(
                    padding: const EdgeInsets.all(16),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Stock Receipt Details',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const Expanded(child: Text('MIN Number')),
                              Expanded(child: Text(widget.mrnNumber)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Expanded(child: Text('Received from')),
                              // TODO : verify this , showing senderId here
                              Expanded(
                                child: Text(localizations
                                    .translate('FAC_$senderIdToShowOnTab')),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ...widget.stockRecords.map((stock) {
                    final productName = stock.additionalFields?.fields
                            .firstWhere(
                              (field) => field.key == 'productName',
                              orElse: () =>
                                  const AdditionalField('productName', ''),
                            )
                            .value
                            ?.toString() ??
                        '';

                    return Column(
                      children: [
                        DigitCard(
                          padding: const EdgeInsets.all(16),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productName,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: productName == 'SPAQ 1' ||
                                            productName == 'SPAQ 2'
                                        ? Colors.orange
                                        : productName == 'Red VAS'
                                            ? Colors.red
                                            : productName == 'Blue VAS'
                                                ? Colors.blue
                                                : Theme.of(context)
                                                    .primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                InputField(
                                  type: InputType.text,
                                  label: 'Waybill Number *',
                                  initialValue: stock.wayBillNumber ?? '',
                                  isDisabled: true,
                                  readOnly: true,
                                ),
                                const SizedBox(height: 12),
                                InputField(
                                  type: InputType.text,
                                  label: 'Batch Number',
                                  initialValue: stock.additionalFields?.fields
                                          .firstWhere(
                                            (field) =>
                                                field.key == 'batchNumber',
                                            orElse: () => const AdditionalField(
                                                'batchNumber', ''),
                                          )
                                          .value
                                          ?.toString() ??
                                      '',
                                  isDisabled: true,
                                  readOnly: true,
                                ),
                                const SizedBox(height: 12),
                                InputField(
                                  type: InputType.text,
                                  label: 'Quantity Sent by Warehouse *',
                                  initialValue: stock.quantity ?? '',
                                  isDisabled: true,
                                  readOnly: true,
                                ),
                                const SizedBox(height: 12),
                                ReactiveWrapperField(
                                  formControlName: 'quantityReceived',
                                  builder: (field) => InputField(
                                    type: InputType.text,
                                    label: 'Actual Quantity Received *',
                                    errorMessage: field.errorText,
                                    keyboardType: TextInputType.number,
                                    onChange: (value) async {
                                      if (value != null && value.isNotEmpty) {
                                        receiveQuantity =
                                            int.tryParse(value) ?? 0;
                                        sentQuantity = int.tryParse(
                                                stock.quantity ?? '0') ??
                                            0;
                                        field.control.value = receiveQuantity;
                                      } else {
                                        field.control.value = null;
                                      }
                                    },
                                  ),
                                  validationMessages: {
                                    'required': (_) => 'Quantity is required',
                                    'min': (_) => 'Must be at least 1',
                                    'number': (_) => 'Must be a valid number',
                                  },
                                ),
                                const SizedBox(height: 12),
                                ReactiveWrapperField(
                                  formControlName: 'comments',
                                  builder: (field) => InputField(
                                    type: InputType.textArea,
                                    label: 'Comments',
                                    errorMessage: field.errorText,
                                    onChange: (value) =>
                                        field.control.value = value,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                      ],
                    );
                  }).toList(),
                  const SizedBox(height: 24),
                  DigitButton(
                    label: localizations.translate(i18.common.coreCommonSubmit),
                    onPressed: _handleSubmission,
                    type: DigitButtonType.primary,
                    size: DigitButtonSize.large,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
