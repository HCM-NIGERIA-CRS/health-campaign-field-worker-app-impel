// GENERATED using mason_cli
import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/address_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registration_delivery/models/entities/status.dart';
import 'package:registration_delivery/registration_delivery.dart';

import '../../utils/constants.dart';
import '../../utils/typedefs.dart';

part 'consent_household.freezed.dart';

typedef ConsentHouseholdEmitter = Emitter<ConsentHouseholdState>;

//This bloc is used for registration of Beneficiaries to the project
class ConsentHouseholdBloc
    extends Bloc<ConsentHouseholdEvent, ConsentHouseholdState> {
  final IndividualDataRepository individualRepository;

  final HouseholdDataRepository householdRepository;

  final HouseholdMemberDataRepository householdMemberRepository;

  final ProjectBeneficiaryDataRepository projectBeneficiaryRepository;

  final TaskDataRepository taskDataRepository;

  final BeneficiaryType beneficiaryType;

  ConsentHouseholdBloc(
    super.initialState, {
    required this.individualRepository,
    required this.householdRepository,
    required this.householdMemberRepository,
    required this.projectBeneficiaryRepository,
    required this.taskDataRepository,
    required this.beneficiaryType,
  }) {
    on(_handleSubmit);
  }

  FutureOr<void> _handleSubmit(
    ConsentHouseholdSubmitEvent event,
    ConsentHouseholdEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));

    var locality =
        LocalityModel(code: event.boundaryCode!, name: event.boundaryName);
    final householdId = event.householdId ?? "";
    final householdNumber = event.householdNumber ?? "";
    final isConsent = event.isConsent;

    try {
      String localityCode = locality!.code;

      Set<String> beneficiaryId = {};
      var address = AddressModel(
        latitude: event.latitude,
        longitude: event.longitude,
        locationAccuracy: event.locationAccuracy,
        type: AddressType.correspondence,
        locality: LocalityModel(
          code: event.boundaryCode!,
          name: event.boundaryName,
        ),
        tenantId: event.tenantId,
        rowVersion: 1,
        clientAuditDetails: ClientAuditDetails(
          createdBy: event.loggedInUserUuid!,
          createdTime: DateTime.now().millisecondsSinceEpoch,
          lastModifiedBy: event.loggedInUserUuid!,
          lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
        ),
        auditDetails: AuditDetails(
          createdBy: event.loggedInUserUuid!,
          createdTime: DateTime.now().millisecondsSinceEpoch,
          lastModifiedBy: event.loggedInUserUuid!,
          lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
        ),
      );
      var household = HouseholdModel(
          clientReferenceId: IdGen.i.identifier,
          address: address,
          memberCount: 1,
          rowVersion: 1,
          tenantId: event.tenantId.toString(),
          longitude: event.longitude,
          latitude: event.latitude,
          clientAuditDetails: ClientAuditDetails(
            createdBy: event.loggedInUserUuid!,
            createdTime: DateTime.now().millisecondsSinceEpoch,
            lastModifiedBy: event.loggedInUserUuid!,
            lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
          ),
          auditDetails: AuditDetails(
            createdBy: event.loggedInUserUuid!,
            createdTime: DateTime.now().millisecondsSinceEpoch,
            lastModifiedBy: event.loggedInUserUuid!,
            lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
          ),
          householdType: RegistrationDeliverySingleton().householdType,
          additionalFields: HouseholdAdditionalFields(version: 1, fields: [
            if (householdNumber.isNotEmpty)
              AdditionalField(
                Constants.householdNumber,
                householdNumber,
              ),
            AdditionalField(
              Constants.consent,
              isConsent,
            ),
          ]));
      var individual = IndividualModel(
        clientReferenceId: IdGen.i.identifier,
        tenantId: event.tenantId,
        rowVersion: 1,
        clientAuditDetails: ClientAuditDetails(
          createdBy: event.loggedInUserUuid!,
          createdTime: DateTime.now().millisecondsSinceEpoch,
          lastModifiedBy: event.loggedInUserUuid!,
          lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
        ),
        auditDetails: AuditDetails(
          createdBy: event.loggedInUserUuid!,
          createdTime: DateTime.now().millisecondsSinceEpoch,
          lastModifiedBy: event.loggedInUserUuid!,
          lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
        ),
      );
      var name = NameModel(
        givenName: event.householdHeadName,
        individualClientReferenceId: individual.clientReferenceId,
        tenantId: event.tenantId,
        rowVersion: 1,
        clientAuditDetails: ClientAuditDetails(
          createdBy: event.loggedInUserUuid!,
          createdTime: DateTime.now().millisecondsSinceEpoch,
          lastModifiedBy: event.loggedInUserUuid!,
          lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
        ),
        auditDetails: AuditDetails(
          createdBy: event.loggedInUserUuid!,
          createdTime: DateTime.now().millisecondsSinceEpoch,
          lastModifiedBy: event.loggedInUserUuid!,
          lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
        ),
      );
      var identifier = IdentifierModel(
        clientReferenceId: individual.clientReferenceId,
        tenantId: event.tenantId,
        rowVersion: 1,
        clientAuditDetails: ClientAuditDetails(
          createdBy: event.loggedInUserUuid!,
          createdTime: DateTime.now().millisecondsSinceEpoch,
          lastModifiedBy: event.loggedInUserUuid!,
          lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
        ),
        auditDetails: AuditDetails(
          createdBy: event.loggedInUserUuid!,
          createdTime: DateTime.now().millisecondsSinceEpoch,
          lastModifiedBy: event.loggedInUserUuid!,
          lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
        ),
      );

      var projectBeneficiary = ProjectBeneficiaryModel(
        tag: event.tag,
        rowVersion: 1,
        tenantId: event.tenantId,
        clientReferenceId: IdGen.i.identifier,
        dateOfRegistration: DateTime.now().millisecondsSinceEpoch,
        projectId: event.projectId,
        beneficiaryClientReferenceId:
            event.beneficiaryType == BeneficiaryType.individual.toString()
                ? individual.clientReferenceId
                : household.clientReferenceId,
        clientAuditDetails: ClientAuditDetails(
          createdTime: DateTime.now().millisecondsSinceEpoch,
          lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
          lastModifiedBy: event.loggedInUserUuid!,
          createdBy: event.loggedInUserUuid!,
        ),
        auditDetails: AuditDetails(
          createdBy: event.loggedInUserUuid!,
          createdTime: DateTime.now().millisecondsSinceEpoch,
        ),
      );

      individual = individual.copyWith(
        name: name,
        address: [
          address.copyWith(
            relatedClientReferenceId: individual.clientReferenceId,
            auditDetails: individual.auditDetails,
            clientAuditDetails: individual.clientAuditDetails,
            locality: locality,
          ),
        ],
        identifiers: [
          identifier.copyWith(
            identifierId: getIdentifierId(event, beneficiaryId),
            identifierType: getIdentifierType(event),
          ),
        ],
        auditDetails: AuditDetails(
          createdBy: event.loggedInUserUuid!,
          createdTime: DateTime.now().millisecondsSinceEpoch,
          lastModifiedBy: event.loggedInUserUuid!,
          lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
        ),
        clientAuditDetails: ClientAuditDetails(
          createdBy: event.loggedInUserUuid!,
          createdTime: DateTime.now().millisecondsSinceEpoch,
          lastModifiedBy: event.loggedInUserUuid!,
          lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
        ),
      );
      var householdMember = HouseholdMemberModel(
        householdClientReferenceId: household.clientReferenceId,
        individualClientReferenceId: individual.clientReferenceId,
        isHeadOfHousehold: true,
        tenantId: event.tenantId,
        rowVersion: 1,
        clientReferenceId: IdGen.i.identifier,
        clientAuditDetails: ClientAuditDetails(
          createdTime: DateTime.now().millisecondsSinceEpoch,
          lastModifiedBy: event.loggedInUserUuid!,
          createdBy: event.loggedInUserUuid!,
        ),
        auditDetails: AuditDetails(
          createdBy: event.loggedInUserUuid!,
          createdTime: DateTime.now().millisecondsSinceEpoch,
        ),
      );

      var task = TaskModel(
        projectBeneficiaryClientReferenceId:
            projectBeneficiary.clientReferenceId,
        clientReferenceId: IdGen.i.identifier,
        tenantId: event.tenantId,
        projectId: event.projectId,
        rowVersion: 1,
        address: address,
        status: Status.administeredFailed.toValue(),
        auditDetails: AuditDetails(
          createdBy: event.loggedInUserUuid!,
          createdTime: DateTime.now().millisecondsSinceEpoch,
        ),
        clientAuditDetails: ClientAuditDetails(
          createdBy: event.loggedInUserUuid!,
          createdTime: DateTime.now().millisecondsSinceEpoch,
        ),
      );

      await householdRepository.create(
        household.copyWith(
          address: address.copyWith(
            relatedClientReferenceId: household.clientReferenceId,
            auditDetails: individual.auditDetails,
            clientAuditDetails: individual.clientAuditDetails,
            locality: locality,
          ),
        ),
      );

      final initialModifiedAt = DateTime.now().millisecondsSinceEpoch;
      await individualRepository.create(
        individual.copyWith(
          address: [
            address.copyWith(
              relatedClientReferenceId: individual.clientReferenceId,
              auditDetails: individual.auditDetails,
              clientAuditDetails: individual.clientAuditDetails,
              locality: locality,
            ),
          ],
        ),
      );

      await projectBeneficiaryRepository.create(
        projectBeneficiary,
      );

      await householdMemberRepository.create(householdMember.copyWith(
          clientAuditDetails: householdMember.clientAuditDetails!.copyWith(
        lastModifiedTime: initialModifiedAt,
      )));

      await taskDataRepository.create(task);

      emit(state.copyWith(loading: false));
    } catch (error) {
      rethrow;
    }
  }

  // Info get the identifier type based on projectTypeCode
  String getIdentifierType(ConsentHouseholdSubmitEvent event) {
    return "DEFAULT";
  }

  String getIdentifierId(
      ConsentHouseholdSubmitEvent event, Set<String> beneficiaryId) {
    return "DEFAULT";
  }
}

@freezed
class ConsentHouseholdEvent with _$ConsentHouseholdEvent {
  const factory ConsentHouseholdEvent.handleSubmit(
    String? boundaryCode,
    String? boundaryName,
    String? loggedInUserUuid,
    String? tenantId,
    String? projectId,
    String? householdId,
    String? householdNumber,
    String? beneficiaryType,
    bool isConsent, {
    @Default(0) double latitude,
    @Default(0) double longitude,
    @Default(0) double locationAccuracy,
    String? householdHeadName,
    String? tag,
    BuildContext? context,
  }) = ConsentHouseholdSubmitEvent;
}

@freezed
class ConsentHouseholdState with _$ConsentHouseholdState {
  const factory ConsentHouseholdState({
    @Default(false) bool loading,
    @Default(false) bool isEditing,
    @Default(0) double latitude,
    @Default(0) double longitude,
    @Default(0) double locationAccuracy,
    String? householdHeadName,
  }) = _ConsentHouseholdState;
}
