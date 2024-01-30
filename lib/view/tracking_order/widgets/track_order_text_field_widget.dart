import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class TrackOrderTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function onTapSearch;
  final String hint;
  final int maxLine;
  final FocusNode focusNode;
  const TrackOrderTextFieldWidget({
    Key? key,
    required this.controller,
    this.hint = "Enter phone number to search",
    this.maxLine = 1,
    required this.onTapSearch,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // onTap: () {
      //   focusNode.requestFocus();
      // },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter phone number';
        }
        return null;
      },
      maxLines: maxLine,
      // onEditingComplete: () {
      //   focusNode.unfocus();
      //   onTapSearch();
      // },
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        isDense: true,
        suffixIcon: InkWell(
          onTap: () {
            //focusNode.unfocus();
            onTapSearch();
          },
          child: const Icon(Icons.search),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade100),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: hint,
        hintStyle: ConfigStyle.regularStyleTwo(
          DIMEN_FOURTEEN,
          BLACK_LIGHT,
        ),
      ),
    );
  }
}
