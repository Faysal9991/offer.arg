import 'package:arg_offer/app_conostant.dart';
import 'package:arg_offer/helper/helper.dart';
import 'package:arg_offer/provider/payment._provider.dart';
import 'package:arg_offer/util/appbar.dart';
import 'package:arg_offer/util/custom_text_field.dart';
import 'package:arg_offer/util/theme/app_colors.dart';
import 'package:arg_offer/util/theme/text.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddBalanceScreen extends StatefulWidget {
  const AddBalanceScreen({super.key});

  @override
  State<AddBalanceScreen> createState() => _AddBalanceScreenState();
}

class _AddBalanceScreenState extends State<AddBalanceScreen> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PaymentProvider>(context, listen: false).geBankDetails();
    });

    super.initState();
  }

  TextEditingController ammount = TextEditingController();
  TextEditingController transectionId = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: AppColors.scaffold,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(),
              provider.isLoading
                  ? Center(child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: CircularProgressIndicator(),
                  ))
                  : Column(
                      children: [
                        Container(
                            height: 110,
                            decoration: BoxDecoration(
                                color: Colors.white, borderRadius: BorderRadius.circular(10)),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: provider.bankInfo.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        provider.changeIndex(index);
                                      },
                                      child: Container(
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: Helper.downShadow,
                                            border: Border.all(
                                                width: 4,
                                                color: provider.index == index
                                                    ? AppColors.primaryColorLight
                                                    : AppColors.secondaryColorLight),
                                            image: DecorationImage(
                                                image: NetworkImage(AppConstant.baseUrl +
                                                    provider.bankInfo[index].icon!),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  );
                                })),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Html(
                                    data: provider.bankInfo[provider.index].instructions,
                                    style: {
                                      "body": Style(
                                        fontSize: FontSize(18.0),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 22, right: 22),
                                    child: InkWell(
                                      onTap: () {
                                        Clipboard.setData(ClipboardData(
                                                text: provider.bankInfo[provider.index].number
                                                    .toString()))
                                            .then((_) {
                                          showTopSnackBar(
                                            Overlay.of(context),
                                            const CustomSnackBar.success(
                                              message: "Successfully copied to clipboard",
                                            ),
                                          );
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                      bottomLeft: Radius.circular(5),
                                                      topLeft: Radius.circular(5)),
                                                  color: AppColors.primaryColorLight),
                                              child: Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Center(
                                                    child: Text(
                                                  "${provider.bankInfo[provider.index].number}",
                                                  style: latoStyle700Bold.copyWith(
                                                      color: AppColors.secondaryColorLight),
                                                )),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomRight: Radius.circular(5),
                                                  topRight: Radius.circular(5)),
                                              color: AppColors.scaffold,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Center(
                                                  child: Text(
                                                "Click here to copy",
                                                style: latoStyle700Bold,
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 22, right: 22),
                                    child: Text(
                                      "Enter Amount: ",
                                      style: latoStyle600SemiBold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 22, right: 22),
                                    child: CustomTextField(
                                      controller: ammount,
                                      borderRadius: 30,
                                      fillColor: Colors.white,
                                      isShowBorder: true,
                                      verticalSize: 15,
                                      horizontalSize: 20,
                                      hintText: "Enter the ammount you sent",
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 22, right: 22),
                                    child: Text(
                                      "Transaction ID: ",
                                      style: latoStyle600SemiBold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 22, right: 22),
                                    child: CustomTextField(
                                      controller: transectionId,
                                      borderRadius: 30,
                                      fillColor: Colors.white,
                                      isShowBorder: true,
                                      verticalSize: 15,
                                      horizontalSize: 20,
                                      hintText: "Ex: cCascwuen4567",
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 22, right: 22),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: AppColors.primaryColorLight),
                                          onPressed: () {
                                            if (ammount.text.isEmpty) {
                                              showTopSnackBar(
                                                  Overlay.of(context),
                                                  const CustomSnackBar.error(
                                                    message: "Ammount is required",
                                                  ));
                                            } else if (transectionId.text.isEmpty) {
                                              showTopSnackBar(
                                                  Overlay.of(context),
                                                  const CustomSnackBar.error(
                                                    message: "Transaction is required",
                                                  ));
                                            } else {
                                              provider.addBalance(
                                                  methodName: provider.bankInfo[provider.index].name
                                                      .toString(),
                                                  ammount: ammount.text,
                                                  transactionId: transectionId.text,
                                                  response: (value, massage) {
                                                    if (value) {
                                                      showTopSnackBar(
                                                          Overlay.of(context),
                                                          CustomSnackBar.success(
                                                            message: massage,
                                                          ));
                                                    } else {
                                                      showTopSnackBar(
                                                          Overlay.of(context),
                                                          CustomSnackBar.error(
                                                            message: massage,
                                                          ));
                                                    }
                                                  });
                                            }
                                          },
                                          child: const Text("Confirm deposit")),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
            ],
          ),
        ),
      );
    });
  }
}
