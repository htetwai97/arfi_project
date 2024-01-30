import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AttachFileSectionView extends StatelessWidget {
  final String fileName;
  final Function onChooseFile;
  final TextStyle? textStyle;
  const AttachFileSectionView({
    super.key,
    required this.fileName,
    required this.onChooseFile,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Attach File",
            style: (textStyle == null)
                ? ConfigStyle.boldStyleOne(
              DIMEN_SIXTEEN,
              BLACK_HEAVY,
            )
                : textStyle,
          ),
          const SizedBox(height: 10),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: BLACK_LIGHT,
                  width: 0.5,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  fileName,
                  style: ConfigStyle.regularStyleThree(
                    DIMEN_FOURTEEN,
                    BLACK_LIGHT,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    onChooseFile();
                  },
                  icon: const Icon(
                    MdiIcons.attachment,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
