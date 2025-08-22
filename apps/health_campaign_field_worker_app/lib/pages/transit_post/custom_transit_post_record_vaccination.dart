import 'package:auto_route/auto_route.dart';
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
import '../../blocs/transit_post/fixed_post.dart';
import '../../router/app_router.dart';
import '../../widgets/showcase/showcase_wrappers.dart';
import '../campaign_delivery_select.dart';

@RoutePage()
class CustomTransitPostRecordVaccinationPage extends LocalizedStatefulWidget {
  final String postType;
  const CustomTransitPostRecordVaccinationPage({
    super.key,
    required this.postType,
  });

  @override
  State<CustomTransitPostRecordVaccinationPage> createState() =>
      CustomTransitPostRecordVaccinationPageState();
}

enum AgeRange { nineToEleven, twelveToFiftyNine }

class CustomTransitPostRecordVaccinationPageState
    extends LocalizedState<CustomTransitPostRecordVaccinationPage> {
  String? ageRangeSelected;

  int polioBeneficiaryCount = 0;
  int measlesBeneficiaryCount = 0;

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
      body: BlocBuilder<TransitPostBloc, TransitPostState>(
        builder: (context, transitPostState) {
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
                        ) as bool;

                        if (submit ?? false) {
                          if (context.mounted) {
                            // // submit polio event
                            // context.read<CustomTransitPostBloc>().add(
                            //     CustomTransitPostEvent.submitDelivery(
                            //         latitude: latKey.text.isNotEmpty
                            //             ? double.parse(latKey.text)
                            //             : transitPostState.latitude,
                            //         longitude: lngKey.text.isNotEmpty
                            //             ? double.parse(lngKey.text)
                            //             : transitPostState.longitude,
                            //         locationAccuracy:
                            //             accuracyKey.text.isNotEmpty
                            //                 ? double.parse(accuracyKey.text)
                            //                 : transitPostState.locationAccuracy,
                            //         scannedResource: "",
                            //         drugType: "POLIO",
                            //         beneficiaryDelivered:
                            //             polioBeneficiaryCount));

                            // // submit measles event

                            // context
                            //     .read<CustomTransitPostBloc>()
                            //     .add(CustomTransitPostEvent.submitDelivery(
                            //       latitude: latKey.text.isNotEmpty
                            //           ? double.parse(latKey.text)
                            //           : transitPostState.latitude,
                            //       longitude: lngKey.text.isNotEmpty
                            //           ? double.parse(lngKey.text)
                            //           : transitPostState.longitude,
                            //       locationAccuracy: accuracyKey.text.isNotEmpty
                            //           ? double.parse(accuracyKey.text)
                            //           : transitPostState.locationAccuracy,
                            //       scannedResource: "",
                            //       drugType: drugType,
                            //       beneficiaryDelivered: measlesBeneficiaryCount,
                            //     ));

                            if (widget.postType == PostType.fixed.toString()) {
                              context.router.replaceAll(
                                  [const CustomFixedPostSelectionRoute()]);
                            } else {
                              context.router.replaceAll(
                                  [const CustomTransitPostSelectionRoute()]);
                            }
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
                      count: transitPostState.curCount ?? 0,
                      description: localizations.translate(
                        i18.transitPost.todayDeliveriesDescription,
                      )),
                  BlocBuilder<TransitPostBloc, TransitPostState>(
                    builder: (context, transitPostState) => DigitCard(
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
                                    PostType.transit.toString())
                                  LabelValueItem(
                                      labelFlex: 5,
                                      label: localizations.translate(
                                          i18.transitPost.transitPostTypeLabel),
                                      value: localizations.translate(
                                          transitPostState.transitPostType ??
                                              '')),
                                LabelValueItem(
                                    labelFlex: 5,
                                    label: localizations.translate(
                                      widget.postType ==
                                              PostType.transit.toString()
                                          ? i18.transitPost.transitPostNameLabel
                                          : i18_local.transitFixedPost
                                              .fixedPostnameLabel,
                                    ),
                                    value: transitPostState.transitPostName)
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
                    // if (TransitPostSingleton().minAge != null &&
                    //     TransitPostSingleton().maxAge != null)
                    //   LabelValueSummary(items: [
                    //     LabelValueItem(
                    //       labelFlex: 5,
                    //       maxLines: 4,
                    //       label: localizations.translate(
                    //         i18.transitPost.beneficiaryAgeLabel,
                    //       ),
                    //       value:
                    //           "${localizations.translate(i18.transitPost.beneficiaryAgeDescription)} ${TransitPostSingleton().minAge!.toString()} ${"-"} ${TransitPostSingleton().maxAge!.toString()} ${localizations.translate(
                    //         i18_local.individualDetails.monthsHintText,
                    //       )}",
                    //     )
                    //   ]),
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
                            context.read<TransitPostBloc>().add(
                                TransitPostDeliveryEvent(
                                    latitude: latKey.text.isNotEmpty
                                        ? double.parse(latKey.text)
                                        : transitPostState.latitude,
                                    longitude: lngKey.text.isNotEmpty
                                        ? double.parse(lngKey.text)
                                        : transitPostState.longitude,
                                    locationAccuracy:
                                        accuracyKey.text.isNotEmpty
                                            ? double.parse(accuracyKey.text)
                                            : transitPostState.locationAccuracy,
                                    curCount:
                                        (transitPostState.curCount == null)
                                            ? 1
                                            : transitPostState.curCount! + 1,
                                    totalCount:
                                        (transitPostState.totalCount == null)
                                            ? 1
                                            : transitPostState.totalCount! + 1,
                                    scannedResource: "POLIO"));

                            context.router
                                .push(const TransitPostAcknowledgmentRoute());
                          }
                        },
                      ),
                    ],
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

                            context.read<TransitPostBloc>().add(
                                TransitPostDeliveryEvent(
                                    latitude: latKey.text.isNotEmpty
                                        ? double.parse(latKey.text)
                                        : transitPostState.latitude,
                                    longitude: lngKey.text.isNotEmpty
                                        ? double.parse(lngKey.text)
                                        : transitPostState.longitude,
                                    locationAccuracy:
                                        accuracyKey.text.isNotEmpty
                                            ? double.parse(accuracyKey.text)
                                            : transitPostState.locationAccuracy,
                                    curCount:
                                        (transitPostState.curCount == null)
                                            ? 1
                                            : transitPostState.curCount! + 1,
                                    totalCount:
                                        (transitPostState.totalCount == null)
                                            ? 1
                                            : transitPostState.totalCount! + 1,
                                    scannedResource:
                                        ageRange == null || ageRange.isEmpty
                                            ? "MEASLES"
                                            : "MEASLES||$ageRange"));

                            // set age range empty once selection done and event submitted
                            setState(() {
                              ageRangeSelected = '';
                            });

                            context.router
                                .push(const TransitPostAcknowledgmentRoute());
                          }
                        },
                      ),
                      Text(
                        localizations.translate(
                          i18_local.deliverIntervention.selectAgeRange,
                        ),
                        style: textTheme.headingL
                            .copyWith(color: theme.colorTheme.text.primary),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(
                              kPadding, 0, kPadding, 0),
                          child: FormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              builder: (context) {
                                return RadioList(
                                  radioDigitButtons: [
                                    RadioButtonModel(
                                      code: AgeRange.nineToEleven.name,
                                      name: localizations.translate(
                                        i18_local.deliverIntervention
                                            .ninetoElevenAgeRange,
                                      ),
                                    ),
                                    RadioButtonModel(
                                      code: AgeRange.twelveToFiftyNine.name,
                                      name: localizations.translate(
                                        i18_local.deliverIntervention
                                            .twelvetofiftyNineAgeRange,
                                      ),
                                    ),
                                  ],
                                  groupValue: ageRangeSelected ?? '',
                                  onChanged: (value) {
                                    if (value.code ==
                                        AgeRange.nineToEleven.name) {
                                      setState(() {
                                        ageRangeSelected =
                                            AgeRange.nineToEleven.name;
                                      });
                                    } else {
                                      setState(() {
                                        ageRangeSelected =
                                            AgeRange.twelveToFiftyNine.name;
                                      });
                                    }
                                  },
                                );
                              }))
                    ],
                  ),
                ],
              ));
        },
      ),
    );
  }

  String? getAgeRangeSelected(String? ageRangeSelected) {
    if (ageRangeSelected == null) {
      return "";
    }
    return ageRangeSelected;
  }

  List<DigitTableRow> buildTableData() {
    final resources = TransitPostSingleton().resources;

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
}
