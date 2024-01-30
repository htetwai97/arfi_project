import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class CategoryAndExploreWidget extends StatelessWidget {
  final Function onTapExplore;
  final String name, url, description;
  const CategoryAndExploreWidget({
    Key? key,
    required this.name,
    required this.description,
    required this.url,
    required this.onTapExplore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapExplore();
      },
      child: Column(
        children: [
          SizedBox(
            height: scaleHeight(context) / 4.3,
            width: scaleWidth(context) / 2.6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DIMEN_FOURTEEN),
            child: Text(
              name,
              style: ConfigStyle.regularStyleThree(
                DIMEN_FOURTEEN,
                BLACK_HEAVY,
              ),
            ),
          ),
          Text(
            "($description)",
            style: ConfigStyle.regularStyleThree(
              DIMEN_FOURTEEN - 2,
              BLACK_HEAVY,
            ),
          ),
          // ElevatedButton(
          //   style: ButtonStyle(
          //     shape: MaterialStateProperty.all(
          //       RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(8),
          //       ),
          //     ),
          //     padding: MaterialStateProperty.all(
          //       const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
          //     ),
          //     backgroundColor: MaterialStateProperty.all(MATERIAL_COLOR),
          //   ),
          //   onPressed: () {
          //     onTapExplore();
          //   },
          //   child: Text(
          //     "Explore",
          //     style: ConfigStyle.boldStyleThree(
          //       DIMEN_FOURTEEN - 2,
          //       SEPERATOR_COLOR,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
