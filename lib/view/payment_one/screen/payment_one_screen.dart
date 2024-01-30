import 'package:arfi_project/connection_test_service/scaffold_with_connection_status.dart';
import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/data/vo/order_payload_vo.dart';
import 'package:arfi_project/view/bank_info/screen/bank_info_screen.dart';
import 'package:arfi_project/view/bottom_navigation/screen/bottom_navigation_screen.dart';
import 'package:arfi_project/view/login/widgets/email_textfield_widget.dart';
import 'package:arfi_project/view/payment_one/bloc/payment_one_bloc.dart';
import 'package:arfi_project/view/payment_one/widgets/drop_down_section_view.dart';
import 'package:arfi_project/view/register/widgets/common_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentOneScreen extends StatelessWidget {
  const PaymentOneScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithConnectionStatus(
      child: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => PaymentOneBloc(),
          child: Selector<PaymentOneBloc, bool>(
            selector: (context, bloc) => bloc.isLoading,
            builder: (context, isLoading, child) => (isLoading)
                ? Container(
                    color: MATERIAL_COLOR,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Selector<PaymentOneBloc, bool>(
                    selector: (context, bloc) => bloc.isApiCalling,
                    builder: (context, isApiCalling, child) => Stack(
                      children: [
                        Scaffold(
                          body: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: scaleHeight(context) / 20),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back_ios,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "My Information",
                                  style: ConfigStyle.boldStyleThree(
                                    DIMEN_TWENTY,
                                    SEPERATOR_COLOR,
                                  ),
                                ),
                                SizedBox(height: scaleHeight(context) / 30),
                                Consumer<PaymentOneBloc>(
                                  builder: (context, bloc, child) => Form(
                                    key: bloc.nameFormKey,
                                    child: CommonTextFieldWidget(
                                      maxLine: 1,
                                      title: "Name",
                                      hint: "Enter Name",
                                      descriptionController:
                                          bloc.nameController,
                                      onChanged: () {
                                        bloc.nameValidate();
                                      },
                                    ),
                                  ),
                                ),
                                Consumer<PaymentOneBloc>(
                                  builder: (context, bloc, child) => Form(
                                    key: bloc.emailFormKey,
                                    child: EmailTextFieldWidget(
                                      isRealLogin: false,
                                      emailController: bloc.emailController,
                                      onChanged: () {
                                        bloc.emailValidate();
                                      },
                                    ),
                                  ),
                                ),
                                Consumer<PaymentOneBloc>(
                                  builder: (context, bloc, child) => Form(
                                    key: bloc.phoneFormKey,
                                    child: CommonTextFieldWidget(
                                      keyboardType: TextInputType.phone,
                                      maxLine: 1,
                                      title: "Phone",
                                      hint: "Enter phone",
                                      descriptionController:
                                          bloc.phoneController,
                                      onChanged: () {
                                        bloc.phoneValidate();
                                      },
                                    ),
                                  ),
                                ),
                                Consumer<PaymentOneBloc>(
                                  builder: (context, bloc, child) => Form(
                                    key: bloc.addressFormKey,
                                    child: CommonTextFieldWidget(
                                      maxLine: 1,
                                      title: "Address",
                                      hint: "Enter address",
                                      descriptionController:
                                          bloc.addressController,
                                      onChanged: () {
                                        bloc.addressValidate();
                                      },
                                    ),
                                  ),
                                ),
                                Consumer<PaymentOneBloc>(
                                  builder: (context, bloc, child) =>
                                      DropDownSectionView(
                                    list: bloc.districtNameList,
                                    mainTitle: "District",
                                    menuTitle: "Choose District",
                                    selectedValue: "",
                                    onChoose: (value) {
                                      bloc.onChooseDistrict(value);
                                    },
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Consumer<PaymentOneBloc>(
                                  builder: (context, bloc, child) =>
                                      DropDownSectionView(
                                    list: bloc.expressNameList,
                                    mainTitle: "Express",
                                    menuTitle: "Choose Express",
                                    selectedValue: "",
                                    onChoose: (value) {
                                      bloc.onChooseExpress(value);
                                    },
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Consumer<PaymentOneBloc>(
                                  builder: (context, bloc, child) => Form(
                                    //  key: bloc.deliFeeFormKey,
                                    child: CommonTextFieldWidget(
                                      isEnable: false,
                                      maxLine: 1,
                                      title: "Delivery Fees",
                                      hint: "",
                                      descriptionController:
                                          bloc.deliFeeController,
                                      onChanged: () {
                                        // bloc.deliFeeValidate();
                                      },
                                    ),
                                  ),
                                ),
                                Consumer<PaymentOneBloc>(
                                  builder: (context, bloc, child) => Form(
                                    key: bloc.postalCodeFormKey,
                                    child: CommonTextFieldWidget(
                                      keyboardType: TextInputType.number,
                                      maxLine: 1,
                                      title: "Postal Code",
                                      hint: "Enter Postal Code",
                                      descriptionController:
                                          bloc.postalCodeController,
                                      onChanged: () {
                                        bloc.postalCodeValidate();
                                      },
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Consumer<PaymentOneBloc>(
                                      builder: (context, bloc, child) =>
                                          Checkbox(
                                        side: const BorderSide(
                                            color: Colors.black),
                                        activeColor: SEPERATOR_COLOR,
                                        checkColor: MATERIAL_COLOR,
                                        value: bloc.checkValue,
                                        onChanged: (newValue) {
                                          bloc.onCheckB2B(newValue ?? false);
                                        },
                                      ),
                                    ),
                                    Text(
                                      "Order For organization(B2B)?",
                                      style: ConfigStyle.regularStyleThree(
                                        DIMEN_FOURTEEN,
                                        BLACK_HEAVY,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Consumer<PaymentOneBloc>(
                                  builder: (context, bloc, child) => Visibility(
                                    visible: bloc.checkValue == true,
                                    child: Form(
                                      key: bloc.taxIdFormKey,
                                      child: CommonTextFieldWidget(
                                        keyboardType: TextInputType.number,
                                        maxLine: 1,
                                        title: "Tax ID",
                                        hint: "Enter Tax ID",
                                        descriptionController:
                                            bloc.taxIdController,
                                        onChanged: () {
                                          bloc.taxIdValidate();
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Consumer<PaymentOneBloc>(
                                  builder: (context, bloc, child) =>
                                      DropDownSectionView(
                                    list: const [
                                      'COD',
                                      'Bank Transfer',
                                    ],
                                    menuTitle: "Choose Payment Options",
                                    selectedValue: "",
                                    onChoose: (value) {
                                      bloc.onChoosePayment(value);
                                    },
                                  ),
                                ),
                                SizedBox(height: scaleHeight(context) / 20),
                                Consumer<PaymentOneBloc>(
                                  builder: (context, bloc, child) =>
                                      MaterialButton(
                                    onPressed: () {
                                      if (bloc.isApiCalling == false &&
                                          bloc.isGoToPayUnlock) {
                                        bloc.onTapGoToPayment().then((value) {
                                          if (value == "COD") {
                                            Functions.replacementTransition(
                                                context,
                                                const BottomNavigationScreen());
                                          } else {
                                            Functions.replacementTransition(
                                                context,
                                                BankInfoScreen(
                                                  payLoad:
                                                      bloc.orderPayLoadVO ??
                                                          OrderPayLoadVO(),
                                                ));
                                          }
                                        });
                                      }
                                    },
                                    minWidth: 240,
                                    height: 40,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    color: bloc.isGoToPayUnlock
                                        ? LOGIN_BUTTON_COLOR
                                        : Colors.grey,
                                    child: Text(
                                      (bloc.paymentOption == "COD")
                                          ? "Place Order"
                                          : "Next",
                                      style: ConfigStyle.boldStyleTwo(
                                          DIMEN_EIGHTEEN, MATERIAL_COLOR),
                                    ),
                                  ),
                                ),
                                SizedBox(height: scaleHeight(context) / 20),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isApiCalling,
                          child: const Center(
                            child: CircularProgressIndicator(),
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
