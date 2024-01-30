import 'package:arfi_project/connection_test_service/scaffold_with_connection_status.dart';
import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/view/cart/bloc/cart_bloc.dart';
import 'package:arfi_project/view/cart/widgets/cart_item_widget.dart';
import 'package:arfi_project/view/payment_one/screen/payment_one_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithConnectionStatus(
      child: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => CartBloc(),
          child: Scaffold(
            persistentFooterButtons: [
              Consumer<CartBloc>(
                builder: (context, bloc, child) => Column(
                  children: [
                    GestureDetector(
                      onVerticalDragEnd: (ded) {
                        bloc.onChangeFooter();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 8,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: bloc.isVisiblePrice,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 200,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sub Total",
                                  style: ConfigStyle.regularStyleThree(
                                      14, BLACK_HEAVY),
                                ),
                                Text(
                                  "${bloc.mainSubTotal.toStringAsFixed(2)} Baht",
                                  style: ConfigStyle.regularStyleThree(
                                      14, BLACK_HEAVY),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Discount",
                                  style: ConfigStyle.regularStyleThree(
                                      14, BLACK_HEAVY),
                                ),
                                Text(
                                  "${bloc.discount.toStringAsFixed(2)} Baht",
                                  style: ConfigStyle.regularStyleThree(
                                      14, BLACK_HEAVY),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Grand Total",
                                  style: ConfigStyle.regularStyleThree(
                                      14, BLACK_HEAVY),
                                ),
                                Text(
                                  "${bloc.grandTotal.toStringAsFixed(2)} Baht",
                                  style: ConfigStyle.regularStyleThree(
                                      14, BLACK_HEAVY),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "VAT rate(7%)",
                                  style: ConfigStyle.regularStyleThree(
                                      14, BLACK_HEAVY),
                                ),
                                Text(
                                  "${bloc.preVatPercentValue.toStringAsFixed(2)} Baht",
                                  style: ConfigStyle.regularStyleThree(
                                      14, BLACK_HEAVY),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Pre VAT",
                                  style: ConfigStyle.regularStyleThree(
                                      14, BLACK_HEAVY),
                                ),
                                Text(
                                  "${bloc.preVatAmount.toStringAsFixed(2)} Baht",
                                  style: ConfigStyle.regularStyleThree(
                                      14, BLACK_HEAVY),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: ConfigStyle.regularStyleThree(
                                      14, BLACK_HEAVY),
                                ),
                                Text(
                                  "${bloc.grandTotal.toStringAsFixed(2)} Baht",
                                  style: ConfigStyle.regularStyleThree(
                                      14, BLACK_HEAVY),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    bloc.onChangeFooter();
                                  },
                                  child: Container(
                                    width: 140,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        Functions.buildBoxShadow(),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Cancel",
                                        style: ConfigStyle.regularStyleThree(
                                          14,
                                          SEPERATOR_COLOR,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    if (bloc.cartList != null &&
                                        bloc.cartList?.length != 0) {
                                      Functions.transition(
                                          context, const PaymentOneScreen());
                                    } else {
                                      Functions.toast(
                                          msg: "Add Items first",
                                          status: false);
                                    }
                                  },
                                  child: Container(
                                    width: 140,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: SEPERATOR_COLOR,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        Functions.buildBoxShadow(),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Continue",
                                        style: ConfigStyle.regularStyleThree(
                                          14,
                                          MATERIAL_COLOR,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
            persistentFooterAlignment: AlignmentDirectional.center,
            appBar: AppBar(
              centerTitle: true,
              elevation: 0.0,
              leadingWidth: 100,
              leading: Row(
                children: [
                  const SizedBox(width: DIMEN_SIXTEEN),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      // Functions.replacementTransition(
                      //     context, const BottomNavigationScreen());
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.deepPurple,
                      size: DIMEN_TWENTY + 1,
                    ),
                  ),
                ],
              ),
              title: Text(
                "My Bag",
                style: ConfigStyle.regularStyleThree(
                  DIMEN_SIXTEEN,
                  Colors.deepPurple,
                ),
              ),
              actions: [
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.deepPurple,
                    size: DIMEN_TWENTY + 1,
                  ),
                ),
                const SizedBox(width: DIMEN_SIXTEEN),
              ],
            ),
            body: Consumer<CartBloc>(
              builder: (context, bloc, child) =>
                  (bloc.cartList != null && bloc.cartList?.length != 0)
                      ? ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: DIMEN_SIXTEEN,
                              vertical: DIMEN_TWENTY),
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (c, i) {
                            var cart = bloc.cartList?[i];
                            return CartItemWidget(
                              gender: cart?.gender ?? "",
                              photo: cart?.photo ?? "",
                              name: cart?.name ?? "",
                              price: cart?.price?.toString() ?? "",
                              color: cart?.color ?? "",
                              quantity: cart?.quantity?.toString() ?? "",
                              size: cart?.size ?? "",
                              onTapAdd: () {
                                bloc.onTapIncreaseItemQty(cart);
                              },
                              onTapReduce: () {
                                bloc.onTapReduceItemQty(cart);
                              },
                              onTapDelete: () {
                                bloc.onTapRemoveItem(cart);
                              },
                            );
                          },
                          separatorBuilder: (c, i) => const SizedBox(
                            height: 20,
                          ),
                          itemCount: bloc.cartList?.length ?? 0,
                        )
                      : Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              SizedBox(
                                height: scaleHeight(context) / 3,
                              ),
                              const Icon(
                                Icons.remove_shopping_cart,
                                color: SEPERATOR_COLOR,
                                size: 100,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "No Cart Item yet, start choosing one!!!",
                                style: ConfigStyle.regularStyleThree(
                                  14,
                                  BLACK_HEAVY,
                                ),
                              ),
                            ],
                          ),
                        ),
            ),
          ),
        ),
      ),
    );
  }
}
