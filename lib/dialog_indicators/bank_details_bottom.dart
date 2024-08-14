import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common_widgets/common_textfield_for_snaclbar.dart';
import '../common_widgets/custom_snackbar_save_button.dart';
import '../views/singleViewa/controller/profilePageController.dart';

class BankDetailsBottom extends StatelessWidget {
  final TextEditingController accountNumberController;
  final TextEditingController accountHolderNameController;
  final TextEditingController bankNameController;
  final TextEditingController ifscCodeController;

  BankDetailsBottom({
    required this.accountNumberController,
    required this.accountHolderNameController,
    required this.bankNameController,
    required this.ifscCodeController,
  });

  @override
  Widget build(BuildContext context) {
    final profileScreenController = Get.put(ProfileScreenController());

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: DraggableScrollableSheet(
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          var width = MediaQuery.of(context).size.width;
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Center(child: Text("Edit you bank details")),
                  common_textfield_for_snaclbar(
                    width,
                    "Enter your bank account Number",
                    "Bank Account No. Number",
                    accountNumberController,
                    null,
                  ),
                  SizedBox(height: 16),
                  common_textfield_for_snaclbar(
                    width,
                    "Enter Account holder Number",
                    "Number ",
                    accountHolderNameController,
                    null,
                  ),
                  SizedBox(height: 16),
                  common_textfield_for_snaclbar(
                    width,
                    "Enter your Bank Name",
                    "Bank Number",
                    bankNameController,
                    null,
                  ),
                  SizedBox(height: 16),
                  common_textfield_for_snaclbar(
                    width,
                    "Enter your Bank Name",
                    "Bank Number",
                    ifscCodeController,
                    null,
                  ),
                  SizedBox(height: 16),
                  CustomSnackBarSaveButton(
                    buttonTitle: "Save Change",
                    onpressed: () {
                      print(profileScreenController.addressTextController.text);
                      // Handle save action
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  static void show(
      BuildContext context,
      TextEditingController accountNumberController,
      TextEditingController accountHolderNameController,
      TextEditingController bankNameController,
      TextEditingController ifscCodeController,
      ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BankDetailsBottom(
          accountNumberController: accountNumberController,
          accountHolderNameController: accountHolderNameController,
          bankNameController: bankNameController,
          ifscCodeController: ifscCodeController,
        );
      },
    );
  }
}
