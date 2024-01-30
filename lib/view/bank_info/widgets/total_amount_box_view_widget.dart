import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class TotalAmountBoxViewWidget extends StatelessWidget {
  final Function onTapBack;
  final String total;
  const TotalAmountBoxViewWidget({
    super.key,
    required this.onTapBack,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SEPERATOR_COLOR,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  onTapBack();
                },
                child: const Icon(
                  Icons.arrow_back,
                  size: 22,
                  color: MATERIAL_COLOR,
                ),
              ),
              const SizedBox(width: 24),
              Text(
                "Banking\nInformation",
                style: ConfigStyle.regularStyleThree(
                  DIMEN_FOURTEEN,
                  MATERIAL_COLOR,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total\nAmount",
                style: ConfigStyle.regularStyleThree(
                  DIMEN_EIGHTEEN,
                  MATERIAL_COLOR,
                ),
              ),
              Text(
                "$total\nBaht",
                style: ConfigStyle.regularStyleThree(
                  DIMEN_EIGHTEEN - 2,
                  MATERIAL_COLOR,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
