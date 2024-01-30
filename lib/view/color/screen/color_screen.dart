import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_strings.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/data/vo/color_vo.dart';
import 'package:arfi_project/view/category/screen/category_screen.dart';
import 'package:arfi_project/view/color/bloc/color_bloc.dart';
import 'package:arfi_project/view/color/widgets/color_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorScreen extends StatelessWidget {
  final String gender;
  const ColorScreen({
    Key? key,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ColorBloc(gender),
      child: Selector<ColorBloc, bool>(
        selector: (context, bloc) => bloc.isLoading,
        builder: (context, isLoading, child) => (isLoading)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                appBar: Functions.commonAppBarWithBack(context, gender),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: DIMEN_SIXTEEN, vertical: DIMEN_SIXTEEN),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ARFI's Color Palette: Your Style, Your Hue",
                          style: ConfigStyle.regularStyleThree(
                            DIMEN_FOURTEEN,
                            BLACK_HEAVY,
                          ),
                        ),
                        const SizedBox(height: DIMEN_FOURTEEN - 4),
                        Text(
                          CONTENT_FOUR,
                          style: ConfigStyle.regularStyleThree(
                            DIMEN_FOURTEEN - 2,
                            Colors.grey.shade500,
                          ),
                        ),
                        const SizedBox(height: DIMEN_TWENTY_FOUR),
                        Selector<ColorBloc, List<ColorVO>?>(
                          selector: (context, bloc) => bloc.colorObjects,
                          builder: (context, colorObjects, child) =>
                              ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: colorObjects?.length ?? 0,
                            itemBuilder: (context, index) {
                              return ColorItemWidget(
                                colorName:
                                    colorObjects?[index].subcategoryName ?? "",
                                colorCode: colorObjects?[index].colorCode ?? "",
                                photo: colorObjects?[index].photo ?? "",
                                onPressedColor: () {
                                  Functions.transition(
                                    context,
                                    CategoryScreen(
                                      color: colorObjects?[index]
                                              .subcategoryName ??
                                          "",
                                      gender:
                                          (gender == "Man") ? "male" : "female",
                                      colorId: colorObjects?[index].id ?? 0,
                                      genderId: (gender == "Man") ? 1 : 2,
                                    ),
                                  );
                                },
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: DIMEN_TWENTY_EIGHT,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
