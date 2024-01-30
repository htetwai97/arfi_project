import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:flutter/material.dart';

class PromoCollectionWidget extends StatelessWidget {
  const PromoCollectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DIMEN_SIXTEEN),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Promo Collection",
            style: ConfigStyle.boldStyleThree(
              DIMEN_SIXTEEN,
              BLACK_HEAVY,
            ),
          ),
          const SizedBox(height: DIMEN_FOURTEEN),
          Container(
            width: scaleWidth(context),
            height: scaleHeight(context) / 4,
            decoration: BoxDecoration(
              color: MATERIAL_COLOR,
              borderRadius: BorderRadius.circular(DIMEN_FOURTEEN - 4),
              boxShadow: [
                Functions.buildBoxShadow(),
              ],
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: scaleWidth(context) / 2.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Winter Sales",
                          style: ConfigStyle.boldStyleThree(
                            DIMEN_SIXTEEN,
                            Colors.purple,
                          ),
                        ),
                        Text(
                          "20% OFF",
                          style: ConfigStyle.boldStyleThree(
                            DIMEN_TWENTY,
                            Colors.purple,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Shop Now",
                            style: ConfigStyle.regularStyleThree(
                              DIMEN_FOURTEEN,
                              Colors.purple,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(DIMEN_TWENTY_EIGHT),
                    child: Image.asset(
                      "assets/images/home_b_1.jpg",
                      fit: BoxFit.cover,
                      width: scaleWidth(context) / 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
