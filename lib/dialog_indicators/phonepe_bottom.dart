
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../common_widgets/common_textfield_for_snaclbar.dart';
import '../common_widgets/custom_snackbar_save_button.dart';
import '../views/singleViewa/controller/profilePageController.dart';

class phonePeControllerSheet extends StatelessWidget {
  TextEditingController phonePeTextControllerSheet;


  phonePeControllerSheet({
    required this.phonePeTextControllerSheet,

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
                  Center(child: Text("Edit Details")),
                  common_textfield_for_snaclbar(
                    width,
                    "Enter your PhonePe Number",
                    "PhonePe Number",
                    phonePeTextControllerSheet,
                    null,
                  ),


                  SizedBox(height: 36),
                  CustomSnackBarSaveButton(
                    buttonTitle: "Save Change",
                    onpressed: () {
                      print(phonePeTextControllerSheet.text);
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

  static void show(BuildContext context, TextEditingController phonepeNumber) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return phonePeControllerSheet(
          phonePeTextControllerSheet: phonepeNumber
        );
      },
    );
  }
}
