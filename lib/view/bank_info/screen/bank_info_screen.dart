import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/data/vo/bank_info_vo.dart';
import 'package:arfi_project/data/vo/order_payload_vo.dart';
import 'package:arfi_project/view/bank_info/bloc/bank_info_bloc.dart';
import 'package:arfi_project/view/bank_info/widgets/attach_file_section_view.dart';
import 'package:arfi_project/view/bank_info/widgets/total_amount_box_view_widget.dart';
import 'package:arfi_project/view/bottom_navigation/screen/bottom_navigation_screen.dart';
import 'package:arfi_project/view/register/widgets/common_text_field_widget.dart';
import 'package:arfi_project/view/voucher_display/screen/voucher_display_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BankInfoScreen extends StatelessWidget {
  final OrderPayLoadVO payLoad;
  const BankInfoScreen({
    Key? key,
    required this.payLoad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BankInfoBloc(payLoad),
      child: Selector<BankInfoBloc, bool>(
        selector: (context, bloc) => bloc.isLoading,
        builder: (context, isLoading, child) => (isLoading)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Selector<BankInfoBloc, bool>(
                selector: (context, bloc) => bloc.isApiCalling,
                builder: (context, isApiCalling, child) => Stack(
                  children: [
                    SafeArea(
                      child: Scaffold(
                        body: SingleChildScrollView(
                          child: Column(
                            children: [
                              TotalAmountBoxViewWidget(
                                total: payLoad.totalAmount?.toString() ?? "",
                                onTapBack: () {
                                  Functions.replacementTransition(
                                    context,
                                    const BottomNavigationScreen(
                                      currentIndex: 1,
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "Available Bank Accounts",
                                style: ConfigStyle.regularStyleThree(
                                  18,
                                  BLACK_HEAVY,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Selector<BankInfoBloc, List<BankInfoVO>?>(
                                selector: (context, bloc) => bloc.bankInfoList,
                                builder: (context, bankList, child) {
                                  return ListView.separated(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount: bankList?.length ?? 0,
                                    separatorBuilder: (c, i) =>
                                        const SizedBox(height: 20),
                                    itemBuilder: (c, i) {
                                      var bank = bankList?[i];
                                      return Container(
                                        padding: const EdgeInsets.all(24),
                                        decoration: BoxDecoration(
                                          color: MATERIAL_COLOR,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            Functions.buildBoxShadow(),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                    bank?.photo ?? "",
                                                  ),
                                                  radius: 34,
                                                ),
                                                Text(
                                                  bank?.accountHolderName ?? "",
                                                  style: ConfigStyle
                                                      .regularStyleThree(
                                                    DIMEN_EIGHTEEN - 2,
                                                    BLACK_HEAVY,
                                                  ),
                                                ),
                                                Text(
                                                  bank?.bankName ?? "",
                                                  style: GoogleFonts.amaranth(
                                                    color: BLACK_HEAVY,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 22,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              bank?.accountNumber?.toString() ??
                                                  "",
                                              style: GoogleFonts.aBeeZee(
                                                color: BLACK_HEAVY,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 22,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 20),
                              Consumer<BankInfoBloc>(
                                builder: (context, bloc, child) =>
                                    CommonTextFieldWidget(
                                  keyboardType: TextInputType.number,
                                  maxLine: 1,
                                  title: "Deposit",
                                  hint: "Enter deposit amount",
                                  descriptionController: bloc.controller,
                                  onChanged: () {
                                    // bloc.taxIdValidate();
                                  },
                                ),
                              ),
                              AttachFileSectionView(
                                /// fileName: bloc.fileName ?? "",
                                fileName: "hello",
                                onChooseFile: () async {
                                  var result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.image,
                                    allowMultiple: false,
                                  );
                                  var platFormFile = result?.files.first;
                                  if (platFormFile != null) {
                                    // bloc.onPickedAttachFile(
                                    //   File(platFormFile.path ?? ""),
                                    // );
                                  }
                                },
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Consumer<BankInfoBloc>(
                                      builder: (context, bloc, child) =>
                                          Checkbox(
                                        side: const BorderSide(
                                            color: Colors.black),
                                        activeColor: SEPERATOR_COLOR,
                                        checkColor: MATERIAL_COLOR,
                                        value: bloc.isChecked,
                                        onChanged: (newValue) {
                                          if (bloc.controller.text != "") {
                                            bloc.onChecked(newValue ?? false);
                                          } else {
                                            Functions.toast(
                                                msg: "Field Required!",
                                                status: false);
                                          }
                                        },
                                      ),
                                    ),
                                    Text(
                                      "Done Payment?",
                                      style: ConfigStyle.regularStyleOne(
                                        DIMEN_SIXTEEN,
                                        LOGIN_BUTTON_COLOR,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Consumer<BankInfoBloc>(
                                builder: (context, bloc, child) =>
                                    MaterialButton(
                                  color: (bloc.isChecked == true)
                                      ? SEPERATOR_COLOR
                                      : Colors.grey,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  onPressed: () {
                                    if (bloc.isChecked == true) {
                                      bloc.onTapConfirm().then((value) {
                                        Functions.replacementTransition(context,
                                            const VoucherDisplayScreen());
                                      });
                                    } else {
                                      Functions.toast(
                                          msg: "Fields required!",
                                          status: false);
                                    }
                                  },
                                  child: Text(
                                    "Confirm",
                                    style: ConfigStyle.regularStyleThree(
                                        14, MATERIAL_COLOR),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
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
    );
  }
}
