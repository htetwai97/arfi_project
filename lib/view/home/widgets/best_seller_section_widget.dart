import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class BestSellerSectionWidget extends StatelessWidget {
  final String title, content, image, buttonName;
  final bool buttonVisible;
  const BestSellerSectionWidget({
    Key? key,
    required this.title,
    required this.content,
    required this.image,
    required this.buttonVisible,
    this.buttonName = "See More Videos",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: scaleHeight(context) / 1.6,
          width: scaleWidth(context),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: DIMEN_SIXTEEN),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: DIMEN_SIXTEEN),
          child: Text(
            title,
            style: ConfigStyle.boldStyleThree(
              DIMEN_SIXTEEN,
              BLACK_HEAVY,
            ),
          ),
        ),
        const SizedBox(
          height: DIMEN_FOURTEEN - 4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: DIMEN_SIXTEEN),
          child: Text(
            content,
            style: ConfigStyle.regularStyleThree(
              DIMEN_FOURTEEN,
              BLACK_HEAVY,
            ),
          ),
        ),
        const SizedBox(height: DIMEN_SIXTEEN),
        Visibility(
          visible: buttonVisible,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                SEPERATOR_COLOR,
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                    horizontal: DIMEN_TWENTY_EIGHT * 2.4),
              ),
            ),
            onPressed: () {},
            child: Text(
              buttonName,
              style: ConfigStyle.regularStyleThree(
                DIMEN_FOURTEEN,
                MATERIAL_COLOR,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
