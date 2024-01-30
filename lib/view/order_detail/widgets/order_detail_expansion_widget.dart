import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class OrderDetailExpansionWidget extends StatelessWidget {
  final String orderCode, orderDate, totalQty, totalAmount;
  const OrderDetailExpansionWidget({
    Key? key,
    required this.orderCode,
    required this.orderDate,
    required this.totalQty,
    required this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: Text(
        "Order Detail",
        style: ConfigStyle.boldStyleThree(
          14,
          BLACK_HEAVY,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      "Order Code",
                      style: ConfigStyle.regularStyleThree(14, BLACK_HEAVY),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      orderCode,
                      style: ConfigStyle.regularStyleThree(14, BLACK_HEAVY),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      "Order Date",
                      style: ConfigStyle.regularStyleThree(14, BLACK_HEAVY),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      orderDate,
                      style: ConfigStyle.regularStyleThree(14, BLACK_HEAVY),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      "Total Qty",
                      style: ConfigStyle.regularStyleThree(14, BLACK_HEAVY),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      totalQty,
                      style: ConfigStyle.regularStyleThree(14, BLACK_HEAVY),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      "Total Amount",
                      style: ConfigStyle.regularStyleThree(14, BLACK_HEAVY),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      totalAmount,
                      style: ConfigStyle.regularStyleThree(14, BLACK_HEAVY),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
