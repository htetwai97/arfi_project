import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/data/vo/order_vo.dart';
import 'package:arfi_project/view/order_detail/widgets/customer_detail_expansion_widget.dart';
import 'package:arfi_project/view/order_detail/widgets/order_detail_expansion_widget.dart';
import 'package:flutter/material.dart';

class OrderDetailScreen extends StatelessWidget {
  final OrderVO? order;
  const OrderDetailScreen({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Functions.commonAppBarForOrder(context, null),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        Functions.buildBoxShadow(),
                      ],
                    ),
                    child: Column(
                      children: [
                        OrderDetailExpansionWidget(
                          orderCode: order?.orderCode ?? "",
                          orderDate: order?.orderDate ?? "",
                          totalQty: order?.totalQuantity?.toString() ?? "",
                          totalAmount: order?.totalAmount?.toString() ?? "",
                        ),
                        CustomerDetailExpansionWidget(
                          name: order?.customerName ?? "",
                          email: order?.customerEmail ?? "",
                          phone: order?.customerPhone ?? "",
                          address: order?.deliverAddress ?? "",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        Functions.buildBoxShadow(),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: DIMEN_SIXTEEN,
                            vertical: DIMEN_FOURTEEN,
                          ),
                          child: Text(
                            "Order Item List",
                            style: ConfigStyle.boldStyleThree(
                              14,
                              BLACK_HEAVY,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          child: Center(
                            child: Container(
                              color: BLACK_LIGHT,
                              height: 0.5,
                            ),
                          ),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (c, i) {
                            var item = order?.countingUnitEcommerceOrders?[i];
                            return Container(
                              padding: const EdgeInsets.all(DIMEN_SIXTEEN),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 80,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            item?.photo ?? "",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        item?.subcategoryName ?? "",
                                        style: ConfigStyle.regularStyleThree(
                                          12,
                                          BLACK_HEAVY,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 40),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${item?.itemName ?? ""}(${item?.size ?? ""})",
                                        style: ConfigStyle.regularStyleThree(
                                          16,
                                          SEPERATOR_COLOR,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "Qty ${item?.quantity ?? 0}",
                                        style: ConfigStyle.regularStyleThree(
                                          14,
                                          BLACK_HEAVY,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "${item?.price} Baht",
                                        style: ConfigStyle.boldStyleThree(
                                          14,
                                          BLACK_HEAVY,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (c, i) => SizedBox(
                            height: 20,
                            child: Center(
                              child: Container(
                                height: 0.5,
                                color: BLACK_LIGHT,
                              ),
                            ),
                          ),
                          itemCount:
                              order?.countingUnitEcommerceOrders?.length ?? 0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
