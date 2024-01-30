import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final String gender, photo, name, price, color, quantity, size;
  final Function onTapAdd;
  final Function onTapReduce;
  final Function onTapDelete;
  const CartItemWidget({
    super.key,
    required this.gender,
    required this.photo,
    required this.name,
    required this.price,
    required this.color,
    required this.quantity,
    required this.onTapAdd,
    required this.onTapReduce,
    required this.onTapDelete,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DIMEN_SIXTEEN),
      height: scaleHeight(context) / 4.5,
      width: scaleWidth(context),
      decoration: BoxDecoration(
        color: MATERIAL_COLOR,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          Functions.buildBoxShadow(),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$gender's wear",
                style: ConfigStyle.regularStyleThree(
                  14,
                  BLACK_HEAVY,
                ),
              ),
              InkWell(
                onTap: () {
                  onTapDelete();
                },
                child: const Icon(
                  Icons.close,
                  color: SEPERATOR_COLOR,
                  size: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
            child: Center(
              child: Container(
                height: 0.6,
                color: BLACK_LIGHT,
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    photo,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: scaleWidth(context) / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$name ($color)",
                      // overflow: TextOverflow.ellipsis,
                      style: ConfigStyle.boldStyleThree(
                        14,
                        BLACK_HEAVY,
                      ),
                    ),
                    Text(
                      "$price Baht",
                      style: ConfigStyle.regularStyleThree(
                        14,
                        BLACK_HEAVY,
                      ),
                    ),
                    Text(
                      "Size-${size.toUpperCase()}",
                      style: ConfigStyle.regularStyleTwo(
                        14,
                        BLACK_HEAVY,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        onTapAdd();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: SEPERATOR_COLOR),
                        child: const Icon(
                          Icons.add,
                          size: 16,
                          color: MATERIAL_COLOR,
                        ),
                      ),
                    ),
                    Text(
                      quantity,
                      style: ConfigStyle.regularStyleThree(
                        14,
                        BLACK_HEAVY,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        onTapReduce();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: SEPERATOR_COLOR),
                        child: const Icon(
                          Icons.remove,
                          size: 16,
                          color: MATERIAL_COLOR,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
