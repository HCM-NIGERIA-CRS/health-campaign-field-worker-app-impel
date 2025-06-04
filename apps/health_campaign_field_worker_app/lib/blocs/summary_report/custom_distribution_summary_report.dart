import 'dart:async';
import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:digit_data_model/data/repositories/local/product_variant.dart';
import 'package:digit_data_model/models/entities/product_variant.dart';
import 'package:digit_data_model/utils/typedefs.dart'
    hide ProductVariantDataRepository;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/models/entities/transaction_type.dart';
import 'package:inventory_management/utils/typedefs.dart'
    hide ProductVariantDataRepository;
import 'package:registration_delivery/data/repositories/local/base/project_beneficiary_base.dart';
import 'package:registration_delivery/data/repositories/local/household.dart';
import 'package:registration_delivery/data/repositories/local/task.dart';
import 'package:registration_delivery/models/entities/household.dart';
import 'package:registration_delivery/models/entities/status.dart';
import 'package:registration_delivery/models/entities/task.dart';
import 'package:registration_delivery/models/entities/task_resource.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/utils/typedefs.dart';

import '../../models/distribution_summary_data_model.dart';
import '../../utils/constants.dart';
import '../../utils/environment_config.dart';

part 'custom_distribution_summary_report.freezed.dart';

typedef CustomDistributionSummaryReportEmitter
    = Emitter<CustomDistributionSummaryReportState>;

class CustomDistributionSummaryReportBloc extends Bloc<
    CustomDistributionSummaryReportEvent,
    CustomDistributionSummaryReportState> {
  final IndividualDataRepository individualRepository;

  final HouseholdDataRepository householdRepository;

  final TaskDataRepository taskRepository;

  final ProductVariantDataRepository productVariantRepository;

  final StockDataRepository stockDataRepository;

  final ProjectBeneficiaryDataRepository projectBeneficiaryRepository;

  CustomDistributionSummaryReportBloc({
    required this.individualRepository,
    required this.householdRepository,
    required this.taskRepository,
    required this.productVariantRepository,
    required this.stockDataRepository,
    required this.projectBeneficiaryRepository,
  }) : super(const CustomDistributionSummaryReportEmptyState()) {
    on(_handleLoadDataEvent);
    on(_handleLoadingEvent);
  }

  Future<void> _handleLoadDataEvent(
    CustomDistributionSummaryReportLoadDataEvent event,
    CustomDistributionSummaryReportEmitter emit,
  ) async {
    var userId = event.userId;

    Map<String, List<HouseholdModel>> dayVsHouseholdListMap = {};
    Map<String, List<TaskModel>> dayVsTaskListMap = {};
    Map<String?, String> variantIdVsProduct = {};
    Set<String> availableDates = {};
    final householdList =
        await (householdRepository as HouseholdLocalRepository).search(
      HouseholdSearchModel(tenantId: envConfig.variables.tenantId),
      userId,
    );
    final productVariantList =
        await (productVariantRepository as ProductVariantLocalRepository)
            .search(
      ProductVariantSearchModel(tenantId: envConfig.variables.tenantId),
    );

    // download all the task irrespective of status
    final taskList = await (taskRepository as TaskLocalRepository).search(
      TaskSearchModel(
        tenantId: envConfig.variables.tenantId,
      ),
      userId,
    );
    Set<String> projectBeneficiaryClientReferenceIds = taskList
        .map((e) => e.projectBeneficiaryClientReferenceId ?? "")
        .toSet()
        .where((element) => element.isNotEmpty)
        .toSet();

    // get all the pb based on the task created till now
    final projectBeneficiaryList = await (projectBeneficiaryRepository
            as ProjectBeneficiaryLocalBaseRepository)
        .search(
      ProjectBeneficiarySearchModel(
          tenantId: envConfig.variables.tenantId,
          clientReferenceId: projectBeneficiaryClientReferenceIds.toList()),
    );

// Fetching the stock reconciliation details
    final receivedStocks = (await stockDataRepository.search(
      StockSearchModel(
        transactionType: [TransactionType.received.toValue()],
      ),
    ))
        .where(
          (element) =>
              element.clientAuditDetails != null &&
              element.clientAuditDetails?.createdBy == userId,
        )
        .toList();

    // Assuming each element has 'date' (String or DateTime) and 'quantity' (int or double)
    final Map<String, double> stockReceivedVsDate = {};

    for (var stock in receivedStocks) {
      var dateKey = DigitDateUtils.getDateFromTimestamp(
        stock.dateOfEntry ?? DateTime.now().millisecondsSinceEpoch,
      ); // Replace 'date' with the actual field name in your data model.
      final quantity = double.parse(stock.quantity ??
          '0'); // Replace 'quantity' with the actual field name.

      // Accumulate the quantity for the same date
      stockReceivedVsDate[dateKey] =
          (stockReceivedVsDate[dateKey] ?? 0) + quantity;
    }

    var spaq1 = productVariantList.first.id;

    for (var element in householdList) {
      final isConsentGiven = element.additionalFields?.fields
              .firstWhereOrNull((h) => h.key == Constants.headConsent)
              ?.value ??
          "true";
      if (isConsentGiven.toString() == "true") {
        var dateKey = DigitDateUtils.getDateFromTimestamp(
          element.clientAuditDetails!.createdTime,
        );

        dayVsHouseholdListMap.putIfAbsent(dateKey, () => []).add(element);
      }
    }

    for (var element in taskList) {
      var dateKey = DigitDateUtils.getDateFromTimestamp(
        element.clientAuditDetails!.createdTime,
      );

      dayVsTaskListMap.putIfAbsent(dateKey, () => []).add(element);
    }
    availableDates.addAll(dayVsHouseholdListMap.keys.toSet());

    availableDates.addAll(dayVsTaskListMap.keys.toSet());

    Map<String, DistributionSummaryData> dayVsDataCount = {};
    Map<String, Map<String?, dynamic>> dayVsDrugsQuantityMap = {};

    for (var entry in dayVsTaskListMap.entries) {
      var date = entry.key;
      var taskListForADate = entry.value;
      getDrugsVsQuantityMap(
        taskListForADate,
        date,
        dayVsDrugsQuantityMap,
      );
    }

    for (var date in availableDates) {
      int totatlHouseholdForADay = 0;
      int totalTaskForADay = 0;

      if (dayVsHouseholdListMap.containsKey(date) &&
          dayVsHouseholdListMap[date] != null) {
        for (var entry in dayVsHouseholdListMap[date]!.toList()) {
          totatlHouseholdForADay++;
        }
      }
      if (dayVsTaskListMap.containsKey(date) &&
          dayVsTaskListMap[date] != null) {
        totalTaskForADay += dayVsTaskListMap[date]!.length;
      }

      // denominator is fixed here
      // assumption here is aztUsed  AZT used
      double aztReceived = 0;
      double aztUsed = 0;
      if (dayVsDrugsQuantityMap.containsKey(date) &&
          dayVsDrugsQuantityMap[date] != null &&
          dayVsDrugsQuantityMap[date]!.containsKey(
            spaq1,
          )) {
        aztUsed = dayVsDrugsQuantityMap[date]![spaq1] ?? 0;
      }

      if (stockReceivedVsDate.containsKey(date) &&
          stockReceivedVsDate[date] != null) {
        aztReceived = stockReceivedVsDate[date] ?? 0;
      }

      final treatedPercentage =
          (totalTaskForADay / Constants.dailyTarget) * 100;

      //Rounded treatedPercentage to 2 degree
      DistributionSummaryData summary = DistributionSummaryData(
        treatedPercentage: double.parse(treatedPercentage.toStringAsFixed(2)),
        householdCount: totatlHouseholdForADay,
        taskCount: totalTaskForADay,
        aztReceived: aztReceived * 30,
        aztUsed: aztUsed,
      );
      dayVsDataCount[date] = summary;
    }

    emit(CustomDistributionSummaryReportSummaryDataState(
      summaryData: SplayTreeMap<String, DistributionSummaryData>.from(
        dayVsDataCount,
        (a, b) => b.compareTo(a),
      ),
    ));
  }

  void getDrugsVsQuantityMap(
    List<TaskModel> taskList,
    String date,
    Map<String, Map<String?, dynamic>> dayVsDrugsQuantityMap,
  ) {
    Map<String?, double> resourceVsQuantity = {};
    List<TaskResourceModel> taskResourceList = [];

    for (var task in taskList) {
      if (task.resources == null) {
        continue;
      }
      taskResourceList.addAll(task.resources!.toList());
    }
    for (var resource in taskResourceList) {
      double quantityDistributed = 0;
      double quantityRedosed = 0;

      //todo remove the double and int checks once , data type is finalized
      var resourceId = resource.productVariantId;
      quantityDistributed = quantityDistributed +
          (resource.quantity!.toString().contains(".")
              ? double.parse((resource.quantity ?? "0.0").toString()).toInt()
              : int.parse((resource.quantity ?? "0").toString()));
      if (resource.additionalFields != null) {
        var value = resource.additionalFields!.fields
            .firstWhereOrNull(
              (element) => element.key == Constants.reDoseQuantityKey,
            )
            ?.value;
        quantityRedosed = quantityRedosed +
            (value == null || value == "null"
                ? 0
                : (value.toString().contains(".")
                    ? double.parse(value.toString()).toInt()
                    : int.parse(value.toString())));
      }
      final quantityUsed = quantityDistributed + quantityRedosed;

      resourceVsQuantity.update(
        resourceId,
        (existingValue) => existingValue + quantityUsed,
        ifAbsent: () => quantityUsed,
      );
    }
    dayVsDrugsQuantityMap[date] = resourceVsQuantity;
  }

  Future<void> _handleLoadingEvent(
    CustomDistributionSummaryReportLoadingEvent event,
    CustomDistributionSummaryReportEmitter emit,
  ) async {
    emit(const CustomDistributionSummaryReportLoadingState());
  }
}

@freezed
class CustomDistributionSummaryReportEvent
    with _$CustomDistributionSummaryReportEvent {
  const factory CustomDistributionSummaryReportEvent.loadData({
    required String userId,
  }) = CustomDistributionSummaryReportLoadDataEvent;

  const factory CustomDistributionSummaryReportEvent.loading() =
      CustomDistributionSummaryReportLoadingEvent;
}

@freezed
class CustomDistributionSummaryReportState
    with _$CustomDistributionSummaryReportState {
  const factory CustomDistributionSummaryReportState.loading() =
      CustomDistributionSummaryReportLoadingState;
  const factory CustomDistributionSummaryReportState.empty() =
      CustomDistributionSummaryReportEmptyState;

  const factory CustomDistributionSummaryReportState.summaryData({
    @Default({}) Map<String, DistributionSummaryData> summaryData,
  }) = CustomDistributionSummaryReportSummaryDataState;
}
