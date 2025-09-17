import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_scanner/digit_scanner.dart';
import 'package:digit_scanner/utils/scanner_utils.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/models/RadioButtonModel.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/atoms/table_cell.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_table.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:transit_post/blocs/transit_post.dart';
import 'package:transit_post/router/transit_post_router.gm.dart';
import 'package:transit_post/utils/i18_key_constants.dart' as i18;
import 'package:transit_post/utils/utils.dart';
import 'package:transit_post/widgets/back_navigation_help_header.dart';
import 'package:transit_post/widgets/localized.dart';
import 'package:transit_post/widgets/total_delivery.dart';
import 'package:registration_delivery/utils/i18_key_constants.dart'
    as registration_delivery;
import '../../../utils/i18_key_constants.dart' as i18_local;
import '../../blocs/app_initialization/app_initialization.dart';
import '../../blocs/transit_post/custom_transit_post.dart';
import '../../blocs/transit_post/fixed_post.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../models/entities/project_types.dart';
import '../../models/entities/user_action_enums.dart';
import '../../router/app_router.dart';
import '../../utils/extensions/extensions.dart';
import '../../utils/utils.dart';
import '../../widgets/showcase/showcase_wrappers.dart';
import '../campaign_delivery_select.dart';

@RoutePage()
class CustomFixedPostRecordVaccinationPage extends LocalizedStatefulWidget {
  final String postType;
  const CustomFixedPostRecordVaccinationPage({
    super.key,
    required this.postType,
  });

  @override
  State<CustomFixedPostRecordVaccinationPage> createState() =>
      CustomFixedPostRecordVaccinationPageState();
}

enum AgeRange { nineToEleven, twelveToFiftyNine }

class CustomFixedPostRecordVaccinationPageState
    extends LocalizedState<CustomFixedPostRecordVaccinationPage> {
  String? ageRangeSelected;
  String? heightRangeSelected;

  int polioBeneficiaryCount = 0;
  int measlesBeneficiaryCount = 0;
  int onchoBeneficiaryCount = 0;

  String? drugType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    final TextEditingController latKey = TextEditingController();
    final TextEditingController lngKey = TextEditingController();
    final TextEditingController accuracyKey = TextEditingController();
    final List<DigitTableRow> tableRow = buildTableData();

    return Scaffold(
      body: BlocBuilder<FixedPostBloc, FixedPostState>(
        builder: (context, fixedPostState) {
          return BlocListener<LocationBloc, LocationState>(
              listener: (context, locationState) {
                if (locationState.accuracy != null) {
                  //Hide the dialog after 1 seconds
                  Future.delayed(const Duration(seconds: 1), () {
                    DigitComponentsUtils.hideDialog(context);
                  });
                }

                final lat = locationState.latitude;
                final lng = locationState.longitude;
                final accuracy = locationState.accuracy;

                latKey.text = lat.toString();
                lngKey.text = lng.toString();
                accuracyKey.text = accuracy.toString();
              },
              listenWhen: (previous, current) {
                final lat = latKey.text;
                final lng = lngKey.text;
                final accuracy = accuracyKey.text;

                return lat.isNotEmpty || lng.isNotEmpty || accuracy.isNotEmpty
                    ? false
                    : true;
              },
              child: ScrollableContent(
                header: const BackNavigationHelpHeaderWidget(),
                enableFixedDigitButton: true,
                footer: DigitCard(
                  margin: const EdgeInsets.only(top: spacer2),
                  children: [
                    DigitButton(
                      label: localizations.translate(
                        i18.transitPost.closeDeliveryLabel,
                      ),
                      onPressed: () async {
                        final submit = await showCustomPopup(
                          context: context,
                          builder: (popupContext) => Popup(
                            title: localizations.translate(
                              registration_delivery
                                  .deliverIntervention.dialogTitle,
                            ),
                            onOutsideTap: () {
                              Navigator.of(popupContext).pop(false);
                            },
                            description: localizations.translate(
                              registration_delivery
                                  .deliverIntervention.dialogContent,
                            ),
                            type: PopUpType.simple,
                            actions: [
                              DigitButton(
                                label: localizations.translate(
                                  registration_delivery.common.coreCommonSubmit,
                                ),
                                onPressed: () {
                                  Navigator.of(
                                    popupContext,
                                    rootNavigator: true,
                                  ).pop(true);
                                },
                                type: DigitButtonType.primary,
                                size: DigitButtonSize.large,
                              ),
                              DigitButton(
                                label: localizations.translate(
                                  registration_delivery.common.coreCommonCancel,
                                ),
                                onPressed: () {
                                  Navigator.of(
                                    popupContext,
                                    rootNavigator: true,
                                  ).pop(false);
                                },
                                type: DigitButtonType.secondary,
                                size: DigitButtonSize.large,
                              ),
                            ],
                          ),
                        );

                        if (submit ?? false) {
                          if (context.mounted) {
                            context.router.replaceAll(
                                [const CustomFixedPostSelectionRoute()]);
                          }
                        }
                      },
                      type: DigitButtonType.primary,
                      size: DigitButtonSize.large,
                      mainAxisSize: MainAxisSize.max,
                    ),
                  ],
                ),
                children: [
                  DeliveryWidget(
                      count: fixedPostState.curCount ?? 0,
                      description: localizations.translate(
                        i18.transitPost.todayDeliveriesDescription,
                      )),
                  BlocBuilder<FixedPostBloc, FixedPostState>(
                    builder: (context, fixedPostState) => DigitCard(
                        margin: const EdgeInsets.all(spacer2),
                        children: [
                          LabelValueSummary(
                              heading: localizations.translate(
                                i18.transitPost.vaccinationDetailsLabel,
                              ),
                              items: [
                                LabelValueItem(
                                    labelFlex: 5,
                                    label: localizations.translate(
                                      i18.transitPost.dateLabel,
                                    ),
                                    value: DateFormat("d MMMM yyyy")
                                        .format(DateTime.now())),
                                if (widget.postType ==
                                    UserActionEnums.transit.toValue())
                                  LabelValueItem(
                                      labelFlex: 5,
                                      label: localizations.translate(
                                          i18.transitPost.transitPostTypeLabel),
                                      value: localizations.translate(
                                          fixedPostState.fixedPostType ?? '')),
                                LabelValueItem(
                                    labelFlex: 5,
                                    label: localizations.translate(
                                      widget.postType ==
                                              UserActionEnums.transit.toValue()
                                          ? i18.transitPost.transitPostNameLabel
                                          : i18_local.transitFixedPost
                                              .fixedPostnameLabel,
                                    ),
                                    value: fixedPostState.fixedPostName)
                              ])
                        ]),
                  ),
                  DigitCard(margin: const EdgeInsets.all(spacer2), children: [
                    Text(
                      localizations.translate(
                        i18.transitPost.resourceDeliveredLabel,
                      ),
                      style: textTheme.headingL.copyWith(
                        color: theme.colorTheme.text.primary,
                      ),
                    ),
                    SizedBox(
                      height: (tableRow.length * 70.0).toDouble().clamp(
                              100, MediaQuery.of(context).size.height * 0.5) +
                          40,
                      child: DigitTable(
                          tableHeight: (tableRow.length * 70.0)
                              .toDouble()
                              .clamp(100,
                                  MediaQuery.of(context).size.height * 0.5),
                          showPagination: false,
                          columns: [
                            DigitTableColumn(
                              header: localizations.translate(
                                i18.transitPost.doseLabel,
                              ),
                              cellValue: 'Dose',
                            ),
                            DigitTableColumn(
                              header: localizations.translate(
                                i18.transitPost.resourceLabel,
                              ),
                              cellValue: 'Resource',
                            ),
                          ],
                          rows: tableRow),
                    ),
                  ]),
                  DigitCard(
                    margin: const EdgeInsets.all(spacer2),
                    children: [
                      Text(
                        localizations.translate(
                          i18_local.deliverIntervention.polioDeliverySummary,
                        ),
                        style: textTheme.headingL
                            .copyWith(color: theme.colorTheme.text.primary),
                      ),
                      LabelValueSummary(items: [
                        LabelValueItem(
                          labelFlex: 5,
                          maxLines: 4,
                          label: localizations.translate(
                            i18_local
                                .deliverIntervention.noOfChildrenVaccinated,
                          ),
                          value: polioBeneficiaryCount.toString(),
                        )
                      ]),
                      DigitButton(
                        label: localizations.translate(
                          i18_local.deliverIntervention.vaccinateBeneficiary,
                        ),
                        type: DigitButtonType.primary,
                        size: DigitButtonSize.large,
                        mainAxisSize: MainAxisSize.max,
                        isDisabled: false,
                        onPressed: () {
                          setState(() {
                            drugType = "POLIO";
                          });
                          if (context.mounted) {
                            setState(() {
                              polioBeneficiaryCount += 1;
                            });
                            // setting the resource type in scanned resource
                            context
                                .read<FixedPostBloc>()
                                .add(FixedPostDeliveryEvent(
                                  latitude: latKey.text.isNotEmpty
                                      ? double.parse(latKey.text)
                                      : fixedPostState.latitude,
                                  longitude: lngKey.text.isNotEmpty
                                      ? double.parse(lngKey.text)
                                      : fixedPostState.longitude,
                                  locationAccuracy: accuracyKey.text.isNotEmpty
                                      ? double.parse(accuracyKey.text)
                                      : fixedPostState.locationAccuracy,
                                  curCount: (fixedPostState.curCount == null)
                                      ? 1
                                      : fixedPostState.curCount! + 1,
                                  totalCount:
                                      (fixedPostState.totalCount == null)
                                          ? 1
                                          : fixedPostState.totalCount! + 1,
                                  action: widget.postType,
                                  scannedResource: "POLIO",
                                ));

                            context.router
                                .push(const TransitPostAcknowledgmentRoute());
                          }
                        },
                      ),
                    ],
                  ),
                  Offstage(
                    offstage: !(context.projectTypeCode ==
                        ProjectTypes.oncho.toValue()),
                    child: DigitCard(
                      margin: const EdgeInsets.all(spacer2),
                      children: [
                        Text(
                          localizations.translate(
                            i18_local.deliverIntervention.onchoDeliverySummary,
                          ),
                          style: textTheme.headingL
                              .copyWith(color: theme.colorTheme.text.primary),
                        ),
                        LabelValueSummary(items: [
                          LabelValueItem(
                            labelFlex: 5,
                            maxLines: 4,
                            label: localizations.translate(
                              i18_local
                                  .deliverIntervention.noOfChildrenVaccinated,
                            ),
                            value: onchoBeneficiaryCount.toString(),
                          )
                        ]),
                        DigitCard(
                          margin: const EdgeInsets.all(spacer2),
                          children: [
                            Text(
                              localizations.translate(
                                i18_local.deliverIntervention.selectHeightRange,
                              ),
                              style: textTheme.headingL.copyWith(
                                  color: theme.colorTheme.text.primary),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  kPadding, 0, kPadding, 0),
                              child: BlocBuilder<AppInitializationBloc,
                                  AppInitializationState>(
                                builder: (context, state) {
                                  if (state is! AppInitialized) {
                                    return const Offstage();
                                  }

                                  final heightRangeOptions = state
                                          .appConfiguration
                                          .heightRangeOptions ??
                                      <HeightRangeOptions>[];

                                  return FormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      builder: (context) {
                                        return RadioList(
                                          radioDigitButtons: heightRangeOptions
                                              .map((element) =>
                                                  RadioButtonModel(
                                                      code: element.code,
                                                      name: localizations
                                                          .translate(
                                                              element.code)))
                                              .toList(),
                                          groupValue: heightRangeSelected ?? '',
                                          onChanged: (value) {
                                            if (value.code.isNotEmpty) {
                                              setState(() {
                                                heightRangeSelected =
                                                    value.code;
                                              });
                                            }
                                          },
                                        );
                                      });
                                },
                              ),
                            )
                          ],
                        ),
                        DigitButton(
                          label: localizations.translate(
                            i18_local.deliverIntervention.vaccinateBeneficiary,
                          ),
                          type: DigitButtonType.primary,
                          size: DigitButtonSize.large,
                          mainAxisSize: MainAxisSize.max,
                          isDisabled: false,
                          onPressed: () async {
                            setState(() {
                              drugType = "ONCHO";
                            });
                            if (heightRangeSelected == null ||
                                (heightRangeSelected?.isEmpty ?? true)) {
                              await DigitToast.show(
                                context,
                                options: DigitToastOptions(
                                  localizations.translate(i18_local
                                      .deliverIntervention.selectHeightRange),
                                  true,
                                  theme,
                                ),
                              );

                              return;
                            }
                            var heightSelected =
                                getHeightRangeSelected(heightRangeSelected);

                            if (context.mounted) {
                              setState(() {
                                onchoBeneficiaryCount += 1;
                              });
                              context.read<FixedPostBloc>().add(
                                  FixedPostDeliveryEvent(
                                      latitude: latKey.text.isNotEmpty
                                          ? double.parse(latKey.text)
                                          : fixedPostState.latitude,
                                      longitude: lngKey.text.isNotEmpty
                                          ? double.parse(lngKey.text)
                                          : fixedPostState.longitude,
                                      locationAccuracy:
                                          accuracyKey.text.isNotEmpty
                                              ? double.parse(accuracyKey.text)
                                              : fixedPostState.locationAccuracy,
                                      curCount:
                                          (fixedPostState.curCount == null)
                                              ? 1
                                              : fixedPostState.curCount! + 1,
                                      totalCount:
                                          (fixedPostState.totalCount == null)
                                              ? 1
                                              : fixedPostState.totalCount! + 1,
                                      action: widget.postType,
                                      scannedResource: "ONCHO",
                                      additionalFieldsCaptured:
                                          heightSelected == null
                                              ? []
                                              : [heightSelected]));

                              // set age range empty once selection done and event submitted
                              setState(() {
                                heightRangeSelected = '';
                              });

                              context.router
                                  .push(const TransitPostAcknowledgmentRoute());
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  DigitCard(
                    margin: const EdgeInsets.all(spacer2),
                    children: [
                      Text(
                        localizations.translate(
                          i18_local.deliverIntervention.measlesDeliverySummary,
                        ),
                        style: textTheme.headingL
                            .copyWith(color: theme.colorTheme.text.primary),
                      ),
                      LabelValueSummary(items: [
                        LabelValueItem(
                          labelFlex: 5,
                          maxLines: 4,
                          label: localizations.translate(
                            i18_local
                                .deliverIntervention.noOfChildrenVaccinated,
                          ),
                          value: measlesBeneficiaryCount.toString(),
                        )
                      ]),
                      Text(
                        localizations.translate(
                          i18_local.deliverIntervention.selectAgeRange,
                        ),
                        style: textTheme.headingL
                            .copyWith(color: theme.colorTheme.text.primary),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                        child: BlocBuilder<AppInitializationBloc,
                            AppInitializationState>(
                          builder: (context, state) {
                            if (state is! AppInitialized) {
                              return const Offstage();
                            }

                            final ageRangeOptions =
                                state.appConfiguration.ageRangeOptions ??
                                    <AgeRangeOptions>[];

                            return FormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                builder: (context) {
                                  return RadioList(
                                    radioDigitButtons: ageRangeOptions
                                        .map((age) => RadioButtonModel(
                                            code: age.code, name: age.code))
                                        .toList(),
                                    groupValue: ageRangeSelected ?? '',
                                    onChanged: (value) {
                                      if (value.code.isNotEmpty) {
                                        setState(() {
                                          ageRangeSelected = value.code;
                                        });
                                      }
                                    },
                                  );
                                });
                          },
                        ),
                      ),
                      DigitButton(
                        label: localizations.translate(
                          i18_local.deliverIntervention.vaccinateBeneficiary,
                        ),
                        type: DigitButtonType.primary,
                        size: DigitButtonSize.large,
                        mainAxisSize: MainAxisSize.max,
                        isDisabled: false,
                        onPressed: () async {
                          setState(() {
                            drugType = "MEASLES";
                          });
                          if (ageRangeSelected == null ||
                              (ageRangeSelected?.isEmpty ?? true)) {
                            await DigitToast.show(
                              context,
                              options: DigitToastOptions(
                                localizations.translate(i18_local
                                    .deliverIntervention.selectAgeRange),
                                true,
                                theme,
                              ),
                            );

                            return;
                          }

                          var ageRange = getAgeRangeSelected(ageRangeSelected);

                          if (context.mounted) {
                            setState(() {
                              measlesBeneficiaryCount += 1;
                            });

                            // setting the resource type in scanned resource

                            context.read<FixedPostBloc>().add(
                                  FixedPostDeliveryEvent(
                                      latitude: latKey.text.isNotEmpty
                                          ? double.parse(latKey.text)
                                          : fixedPostState.latitude,
                                      longitude: lngKey.text.isNotEmpty
                                          ? double.parse(lngKey.text)
                                          : fixedPostState.longitude,
                                      locationAccuracy:
                                          accuracyKey.text.isNotEmpty
                                              ? double.parse(accuracyKey.text)
                                              : fixedPostState.locationAccuracy,
                                      curCount:
                                          (fixedPostState.curCount == null)
                                              ? 1
                                              : fixedPostState.curCount! + 1,
                                      totalCount:
                                          (fixedPostState.totalCount == null)
                                              ? 1
                                              : fixedPostState.totalCount! + 1,
                                      action: widget.postType,
                                      scannedResource: "MEASLES",
                                      additionalFieldsCaptured:
                                          ageRange == null ? [] : [ageRange]),
                                );

                            // set age range empty once selection done and event submitted
                            setState(() {
                              ageRangeSelected = '';
                            });

                            context.router
                                .push(const TransitPostAcknowledgmentRoute());
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ));
        },
      ),
    );
  }

  AdditionalField? getAgeRangeSelected(String? ageRangeSelected) {
    if (ageRangeSelected == null) {
      return null;
    }
    return AdditionalField("ageRange", heightRangeSelected);
  }

  AdditionalField? getHeightRangeSelected(String? heightRangeSelected) {
    if (heightRangeSelected == null) {
      return null;
    }
    return AdditionalField("heightRange", heightRangeSelected);
  }

  List<DigitTableRow> buildTableData() {
    final resources =
        getResourceVariantsBasedOnProjectType(TransitPostSingleton().resources);

    if (resources == null || resources.isEmpty) return [];

    List<DigitTableRow> finalTableRow = [];
    int count = 1;

    for (var resource in resources) {
      List<DigitTableData> tableData = [];

      tableData.add(
        DigitTableData(
            "${localizations.translate(i18.transitPost.doseLabel)} $count",
            cellKey: "Dose$count"),
      );
      tableData.add(DigitTableData(resource.productVariantId,
          cellKey: resource.name ?? resource.productVariantId));

      finalTableRow.add(DigitTableRow(tableRow: tableData));
      count++;
    }
    return finalTableRow;
  }

  List<ProjectProductVariantModel> getResourceVariantsBasedOnProjectType(
    List<ProjectProductVariantModel>? resources,
  ) {
    if (resources == null || resources.isEmpty) return [];

    return context.projectTypeCode == ProjectTypes.oncho.toValue()
        ? resources
            .whereNot((resource) =>
                resource.productVariantId == "PVAR-2025-09-01-000022" ||
                resource.productVariantId == "PVAR-2025-09-01-000021")
            .toList()
        : resources
            .whereNot((resource) =>
                resource.productVariantId == "PVAR-2025-09-01-000022" ||
                resource.productVariantId == "PVAR-2025-09-01-000021" ||
                resource.productVariantId == "PVAR-2025-09-01-000023")
            .toList();
  }
}
