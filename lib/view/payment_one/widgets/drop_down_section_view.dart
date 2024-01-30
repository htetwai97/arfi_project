import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/view/payment_one/widgets/drop_down_view.dart';
import 'package:flutter/material.dart';

class DropDownSectionView extends StatelessWidget {
  final String menuTitle, selectedValue,mainTitle;
  final Function(String) onChoose;
  final List<String> list;
  const DropDownSectionView({
    super.key,
    required this.menuTitle,
    this.mainTitle = "Payment Options",
    required this.selectedValue,
    required this.onChoose,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mainTitle,
            style: ConfigStyle.boldStyleTwo(DIMEN_SIXTEEN, Colors.black87),
          ),
          const SizedBox(
            height: 10,
          ),
          DropDownView(
            list: list,
            menuTitle: menuTitle,
            selectedValue: selectedValue,
            onChange: (value) {
              onChoose(value ?? "");
            },
          ),
        ],
      ),
    );
  }
}
