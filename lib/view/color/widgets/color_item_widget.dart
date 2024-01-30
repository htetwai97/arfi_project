import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:flutter/material.dart';

class ColorItemWidget extends StatelessWidget {
  final Function onPressedColor;
  final String colorName, photo, colorCode;
  const ColorItemWidget({
    required this.onPressedColor,
    required this.colorName,
    required this.colorCode,
    required this.photo,
    super.key,
  });

  Color _hexToColor(String colorCode) {
    var hexColor = colorCode.replaceAll("#", "");
    int hexValue = int.parse(hexColor ?? "", radix: 16);
    return Color(hexValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: scaleHeight(context) / 8,
      width: scaleWidth(context),
      padding: const EdgeInsets.symmetric(
        horizontal: DIMEN_SIXTEEN,
        //vertical: DIMEN_FOURTEEN - 4,
      ),
      decoration: BoxDecoration(
        color: MATERIAL_COLOR,
        // color: _hexToColor(colorCode),
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Colors.grey.shade400,
            _hexToColor(colorCode),
          ],
        ),
        boxShadow: [
          Functions.buildBoxShadow(),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(photo),
            radius: 30,
          ),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(0),
          //   child: Image.network(
          //     photo,
          //     fit: BoxFit.cover,
          //     width: scaleWidth(context) / 4,
          //   ),
          // ),
          Text(
            colorName,
            style: ConfigStyle.regularStyleThree(
              DIMEN_FOURTEEN,
              BLACK_HEAVY,
            ),
          ),
          IconButton(
            onPressed: () {
              onPressedColor();
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: BLACK_HEAVY,
              size: DIMEN_EIGHTEEN,
            ),
          ),
        ],
      ),
    );
  }
}
