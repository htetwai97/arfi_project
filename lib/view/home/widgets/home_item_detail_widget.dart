import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class ItemDetailViewWidget extends StatelessWidget {
  const ItemDetailViewWidget({
    super.key,
    required this.itemHeight,
    required this.itemWidth,
    required this.name,
    required this.description,
    required this.photo,
    required this.onTap,
  });

  final String name, description, photo;
  final double itemHeight, itemWidth;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          SizedBox(
            height: itemHeight,
            width: itemWidth,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(DIMEN_FOURTEEN - 8),
              child: Image.network(
                photo,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: DIMEN_FOURTEEN - 4,
          ),
          Text(
            name,
            style: ConfigStyle.regularStyleThree(
              DIMEN_FOURTEEN - 1,
              BLACK_HEAVY,
            ),
          ),
          Text(
            description,
            style: ConfigStyle.regularStyleThree(
              DIMEN_FOURTEEN - 3,
              BLACK_HEAVY,
            ),
          ),
        ],
      ),
    );
  }
}
