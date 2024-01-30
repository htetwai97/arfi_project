import 'package:arfi_project/connection_test_service/scaffold_with_connection_status.dart';
import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_strings.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/view/color/screen/color_screen.dart';
import 'package:arfi_project/view/shopping/bloc/shopping_bloc.dart';
import 'package:arfi_project/view/shopping/widgets/gender_box_widget.dart';
import 'package:arfi_project/view/shopping/widgets/man_wears_inside_detail_widget.dart';
import 'package:arfi_project/view/shopping/widgets/woman_wears_inside_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithConnectionStatus(
      child: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => ShoppingBloc(),
          child: Consumer<ShoppingBloc>(
            builder: (context, bloc, child) => Stack(
              children: [
                Scaffold(
                  backgroundColor: MATERIAL_COLOR,
                  appBar: Functions.commonAppBar(
                      null, context, bloc.cartLength ?? 0),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: DIMEN_SIXTEEN),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: DIMEN_TWENTY),
                          GenderBoxWidget(
                            child: ManWearsInsideDetailWidget(
                              onPressManWears: () {
                                Functions.rightToLeftTransition(
                                    context,
                                    const ColorScreen(
                                      gender: "Man",
                                    ));
                              },
                            ),
                          ),
                          const SizedBox(height: DIMEN_TWENTY),
                          Text(
                            "Precision Tailoring for a Polished Look",
                            style: ConfigStyle.regularStyleThree(
                              DIMEN_SIXTEEN,
                              BLACK_HEAVY,
                            ),
                          ),
                          const SizedBox(height: DIMEN_SIXTEEN),
                          Text(
                            CONTENT_THREE,
                            style: ConfigStyle.regularStyleThree(
                              DIMEN_FOURTEEN - 1,
                              Colors.grey.shade500,
                            ),
                          ),
                          const SizedBox(height: DIMEN_TWENTY),
                          GenderBoxWidget(
                            child: WomanWearsInsideDetailWidget(
                              onPressWomanWears: () {
                                Functions.rightToLeftTransition(
                                  context,
                                  const ColorScreen(
                                    gender: "Woman",
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: DIMEN_TWENTY),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: bloc.isLoading,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
