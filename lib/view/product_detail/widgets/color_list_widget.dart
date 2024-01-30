import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/data/vo/color_vo.dart';
import 'package:flutter/material.dart';

class ColorListWidget extends StatelessWidget {
  final List<ColorVO>? colorList;
  final Function(int) onTapColor;
  const ColorListWidget({
    super.key,
    required this.colorList,
    required this.onTapColor,
  });

  Color _hexToColor(ColorVO? colorObj) {
    var hexColor = colorObj?.colorCode?.replaceAll("#", "FF");
    int hexValue = int.parse(hexColor ?? "", radix: 16);
    return Color(hexValue);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 40,
        child: ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (c, i) {
            var color = colorList?[i];
            return InkWell(
              radius: 20,
              splashColor: _hexToColor(color),
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                onTapColor(i);
              },
              child: Container(
                width: (color?.isSelected ?? false) ? 42 : 36,
                height: (color?.isSelected ?? false) ? 42 : 36,
                padding: EdgeInsets.all((color?.isSelected ?? false) ? 2 : 0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: (color?.isSelected ?? false)
                        ? BLACK_LIGHT
                        : MATERIAL_COLOR,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: (color?.isSelected ?? false) ? 40 : 34,
                    height: (color?.isSelected ?? false) ? 40 : 34,
                    decoration: BoxDecoration(
                      color: _hexToColor(colorList?[i]),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (c, i) => const SizedBox(
            width: 16,
          ),
          itemCount: colorList?.length ?? 0,
        ),
      ),
    );
  }
}
