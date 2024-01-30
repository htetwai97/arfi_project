import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/data/vo/size_vo.dart';
import 'package:flutter/material.dart';

class SizeListWidget extends StatelessWidget {
  final List<SizeVO?>? sizeList;
  final Function(int) onSelectSize;
  const SizeListWidget({
    super.key,
    required this.sizeList,
    required this.onSelectSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (c, i) {
          return InkWell(
            onTap: () {
              onSelectSize(i);
            },
            child: Container(
              width: 50,
              decoration: BoxDecoration(
                color: (sizeList?[i]?.isSelected == true)
                    ? BLACK_HEAVY
                    : MATERIAL_COLOR,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: BLACK_LIGHT, width: 0.6),
              ),
              child: Center(
                child: Text(
                  sizeList?[i]?.sizeName?.toUpperCase() ?? "",
                  style: ConfigStyle.regularStyleThree(
                    DIMEN_FOURTEEN - 3,
                    (sizeList?[i]?.isSelected == true)
                        ? MATERIAL_COLOR
                        : BLACK_HEAVY,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (c, i) => const SizedBox(
          width: 10,
        ),
        itemCount: sizeList?.length ?? 0,
      ),
    );
  }
}
