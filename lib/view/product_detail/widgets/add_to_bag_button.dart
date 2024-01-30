import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class AddToBagButton extends StatelessWidget {
  final Function onTap;
  const AddToBagButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: MaterialButton(
        color: SEPERATOR_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: DIMEN_TWENTY_EIGHT, vertical: DIMEN_FOURTEEN - 2),
        onPressed: () {
          onTap();
        },
        child: SizedBox(
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Add to Bag",
                style: ConfigStyle.regularStyleThree(
                  DIMEN_FOURTEEN,
                  MATERIAL_COLOR,
                ),
              ),
              const Icon(
                Icons.shopping_cart_outlined,
                size: 18,
                color: MATERIAL_COLOR,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
