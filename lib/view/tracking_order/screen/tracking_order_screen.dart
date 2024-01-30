import 'package:arfi_project/connection_test_service/scaffold_with_connection_status.dart';
import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/view/order_detail/screen/order_detail_screen.dart';
import 'package:arfi_project/view/tracking_order/bloc/track_order_bloc.dart';
import 'package:arfi_project/view/tracking_order/widgets/track_order_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrackingOrderScreen extends StatelessWidget {
  const TrackingOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithConnectionStatus(
      child: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => TrackOrderBloc(),
          child: Scaffold(
            appBar: Functions.commonAppBarForOrder(context, "My Orders"),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: DIMEN_SIXTEEN, vertical: DIMEN_SIXTEEN),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Consumer<TrackOrderBloc>(
                      builder: (context, bloc, child) => Visibility(
                        visible: bloc.user == null,
                        child: TrackOrderTextFieldWidget(
                          controller: bloc.phoneController,
                          focusNode: bloc.phoneFN,
                          onTapSearch: () {
                            bloc.onSearch();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: DIMEN_TWENTY + 10),
                    Consumer<TrackOrderBloc>(
                      builder: (context, bloc, child) => (bloc.orderList !=
                                  null &&
                              bloc.orderList?.length != 0)
                          ? ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (c, i) {
                                var order = bloc.orderList?[i];
                                return Container(
                                  height: scaleHeight(context) / 8,
                                  width: scaleWidth(context),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: MATERIAL_COLOR,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      Functions.buildBoxShadow(),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 60,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              order?.orderDate
                                                      ?.substring(0, 4) ??
                                                  "",
                                              style:
                                                  ConfigStyle.regularStyleThree(
                                                12,
                                                BLACK_LIGHT,
                                              ),
                                            ),
                                            Text(
                                              order?.orderDate
                                                      ?.substring(8, 10) ??
                                                  "",
                                              style:
                                                  ConfigStyle.regularStyleThree(
                                                18,
                                                SEPERATOR_COLOR,
                                              ),
                                            ),
                                            Text(
                                              bloc.getMonthName(order?.orderDate
                                                      ?.substring(5, 7) ??
                                                  ""),
                                              style:
                                                  ConfigStyle.regularStyleThree(
                                                12,
                                                BLACK_LIGHT,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 180,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "#${order?.orderCode ?? ""}",
                                                style: ConfigStyle
                                                    .regularStyleThreeWithOverflow(
                                                  14,
                                                  SEPERATOR_COLOR,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                order?.customerName ?? "",
                                                style: ConfigStyle
                                                    .regularStyleThreeWithOverflow(
                                                  16,
                                                  BLACK_HEAVY,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                order?.customerEmail ?? "",
                                                style: ConfigStyle
                                                    .regularStyleThreeWithOverflow(
                                                  12,
                                                  BLACK_LIGHT,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  SEPERATOR_COLOR),
                                        ),
                                        onPressed: () {
                                          Functions.transition(
                                            context,
                                            OrderDetailScreen(
                                              order: order,
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Detail",
                                          style: ConfigStyle.regularStyleThree(
                                            12,
                                            MATERIAL_COLOR,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (c, i) =>
                                  const SizedBox(height: 20),
                              itemCount: bloc.orderList?.length ?? 0,
                            )
                          : Align(
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: scaleHeight(context) / 4),
                                  const Icon(
                                    Icons.remove_shopping_cart,
                                    size: 100,
                                    color: SEPERATOR_COLOR,
                                  ),
                                  const SizedBox(height: 20),
                                  Selector<TrackOrderBloc, bool>(
                                    selector: (context, bloc) => bloc.isSearch,
                                    builder: (context, isSearch, child) => Text(
                                        (isSearch)
                                            ? "No Order yet!.Make order by shopping.."
                                            : "Search by ordered phone number.."),
                                  )
                                ],
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
