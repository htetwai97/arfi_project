import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class CommonTextFieldWidget extends StatelessWidget {
  final TextEditingController descriptionController;
  final Function onChanged;
  final String title, hint;
  final int maxLine;
  final double height;
  final bool isEnable;
  final TextInputType? keyboardType;
  const CommonTextFieldWidget({
    Key? key,
    required this.descriptionController,
    required this.onChanged,
    this.title = "Description(Reason)",
    this.hint = "Enter Reason",
    this.maxLine = 24,
    this.height = 6,
    this.isEnable = true,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: ConfigStyle.boldStyleTwo(DIMEN_SIXTEEN, Colors.black87),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: keyboardType,
            enabled: isEnable,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter the ${title.toLowerCase()}';
              }
              return null;
            },
            maxLines: maxLine,
            onChanged: (text) {
              onChanged();
            },
            controller: descriptionController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade100,
              isDense: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade100),
                borderRadius: BorderRadius.circular(DIMEN_SIXTEEN),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green),
                borderRadius: BorderRadius.circular(DIMEN_SIXTEEN),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(DIMEN_SIXTEEN),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(DIMEN_SIXTEEN),
              ),
              hintText: hint,
              hintStyle: ConfigStyle.regularStyleTwo(
                DIMEN_FOURTEEN,
                BLACK_LIGHT,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
