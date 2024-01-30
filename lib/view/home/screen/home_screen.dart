import 'package:arfi_project/connection_test_service/scaffold_with_connection_status.dart';
import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_strings.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/view/color/screen/color_screen.dart';
import 'package:arfi_project/view/home/bloc/home_bloc.dart';
import 'package:arfi_project/view/home/widgets/best_seller_section_widget.dart';
import 'package:arfi_project/view/home/widgets/home_banner_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithConnectionStatus(
      child: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => HomeBloc(),
          child: Consumer<HomeBloc>(
            builder: (context, bloc, child) => Stack(
              children: [
                Scaffold(
                  backgroundColor: MATERIAL_COLOR,
                  appBar: Functions.commonAppBar(
                      null, context, bloc.cartLength ?? 0),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        HomeBannerViewWidget(
                          imageList: bloc.maleColorList ?? [],
                          onPressShopping: () {
                            Functions.rightToLeftTransition(
                                context,
                                const ColorScreen(
                                  gender: "Man",
                                ));
                          },
                        ),
                        const SizedBox(height: DIMEN_TWENTY),
                        Text(
                          "SMART|  PROFESSIONAL|  COMFY",
                          style: ConfigStyle.boldStyleThree(
                            DIMEN_EIGHTEEN - 2,
                            Colors.deepPurple,
                          ),
                        ),
                        const SizedBox(height: DIMEN_TWENTY),
                        // const PromoCollectionWidget(),
                        // const SizedBox(height: DIMEN_TWENTY),
                        // CommonHorizontalListWidget(
                        //   title: "Trending",
                        //   listHeight: scaleHeight(context) / 3.4,
                        //   itemHeight: scaleHeight(context) / 4.2,
                        //   itemWidth: scaleWidth(context) / 2.6,
                        // ),
                        // const SizedBox(height: DIMEN_TWENTY),
                        // CommonGridWidget(
                        //   title: "New Arrival",
                        //   mainExtent: scaleHeight(context) / 2.65,
                        //   itemWidth: scaleWidth(context) / 2.3,
                        //   itemHeight: scaleHeight(context) / 3.8,
                        // ),
                        // const SizedBox(height: DIMEN_TWENTY),
                        const BestSellerSectionWidget(
                          title: "THE WAIT IS OVER\nARFI IS HERE.",
                          image: "assets/images/home_banner_first.jpg",
                          content: CONTENT_TWO_B,
                          buttonVisible: false,
                        ),
                        const SizedBox(height: DIMEN_TWENTY),
                        const BestSellerSectionWidget(
                          title: "WE DEFINE PREMIUM.",
                          image: "assets/images/home_banner_middle.jpg",
                          content: CONTENT_TWO,
                          buttonVisible: true,
                        ),
                        const SizedBox(height: DIMEN_TWENTY),
                        Text(
                          "SHOP BY",
                          style: ConfigStyle.boldStyleThree(
                            DIMEN_EIGHTEEN,
                            Colors.deepPurple,
                          ),
                        ),
                        const SizedBox(height: DIMEN_FOURTEEN),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Chip(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              label: const Text("Color"),
                              labelStyle: ConfigStyle.regularStyleThree(
                                  DIMEN_FOURTEEN, SEPERATOR_COLOR),
                              side: const BorderSide(color: SEPERATOR_COLOR),
                            ),
                            Chip(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              label: const Text("Gender"),
                              labelStyle: ConfigStyle.regularStyleThree(
                                  DIMEN_FOURTEEN, SEPERATOR_COLOR),
                              side: const BorderSide(color: SEPERATOR_COLOR),
                            ),
                            Chip(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              label: const Text("Category"),
                              labelStyle: ConfigStyle.regularStyleThree(
                                  DIMEN_FOURTEEN, SEPERATOR_COLOR),
                              side: const BorderSide(color: SEPERATOR_COLOR),
                            ),
                            Chip(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              label: const Text("Specification"),
                              labelStyle: ConfigStyle.regularStyleThree(
                                  DIMEN_FOURTEEN, SEPERATOR_COLOR),
                              side: const BorderSide(color: SEPERATOR_COLOR),
                            ),
                          ],
                        ),
                        const SizedBox(height: DIMEN_TWENTY),
                        HomeBannerViewWidget(
                          imageList: bloc.femaleColorList ?? [],
                          onPressShopping: () {
                            Functions.rightToLeftTransition(
                                context,
                                const ColorScreen(
                                  gender: "Woman",
                                ));
                          },
                        ),
                        //const SizedBox(height: DIMEN_TWENTY),
                        const BestSellerSectionWidget(
                          title: "GROUP ORDERS",
                          image: "assets/images/home_banner_last.png",
                          content: CONTENT_TWO_B,
                          buttonVisible: true,
                          buttonName: "Contact Us",
                        ),
                        const SizedBox(height: DIMEN_TWENTY),
                      ],
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
