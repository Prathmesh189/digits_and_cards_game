import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../common_widgets/common_textfield_for_snaclbar.dart';
import '../common_widgets/custom_snackbar_save_button.dart';
import '../views/singleViewa/controller/profilePageController.dart';

class AddressBottomSheet extends StatelessWidget {
    TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController pinCodeController;

  AddressBottomSheet({
    required this.addressController,
    required this.cityController,
    required this.pinCodeController,
  });

  final profileScreenController = Get.put(ProfileScreenController());


  @override
  Widget build(BuildContext context) {
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
                  Center(child: Text("Edit your details")),
                  common_textfield_for_snaclbar(
                    width,
                    "Enter your Address",
                    "Address",
                    profileScreenController.addressTextController,
                    null,
                  ),
                  SizedBox(height: 16),
                  common_textfield_for_snaclbar(width, "Enter your City", "City", profileScreenController.cityTextController, null,),
                  SizedBox(height: 16),
                  common_textfield_for_snaclbar(
                    width,
                    "Enter your Pin-code",
                    "Pin-Code",
                    profileScreenController.pinTextController,
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

  static void show(BuildContext context, TextEditingController addressController,
      TextEditingController cityController, TextEditingController pinCodeController) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return AddressBottomSheet(
          addressController: addressController,
          cityController: cityController,
          pinCodeController: pinCodeController,
        );
      },
    );
  }
}
