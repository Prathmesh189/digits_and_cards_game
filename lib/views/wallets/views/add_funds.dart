import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../../common_widgets/custom_login_textfield.dart';
import '../../../common_widgets/custom_submit_button.dart';
import '../../../dialog_indicators/invalid_digitssnackbar_.dart';
import '../controllers/funds_controllers.dart';

class AddFundsScreen extends StatelessWidget {
  final bool isAddFund;
  final bool iswithdrawFund;
  final bool isWalletTranser;
  AddFundsScreen({ this.isAddFund = false ,  this.iswithdrawFund = false  ,  this.isWalletTranser = false });
  final WalletsFundsController controller = Get.put(WalletsFundsController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text( isAddFund == true?   "Add Funds"  :iswithdrawFund ? " Withdraw Funds" :   "Wallet Transfer"    ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Visibility(
            visible: isAddFund,
            child: Column(
              children: [
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomLoginTexField(
                    hintText: "Enter amount",
                    keyboardtype: TextInputType.number,
                    textController: controller.amountController,
                  ),
                ),
                SizedBox(
                  width: width * 0.87,
                  height: height * 0.23,
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2,
                    mainAxisSpacing: 10,
                    padding: EdgeInsets.all(8.0),
                    children: List.generate(controller.walletsPointList.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          // Set the selected wallet point to the TextEditingController
                          controller.amountController.text = controller.walletsPointList[index].toString();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red.shade500,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              '₹ ${controller.walletsPointList[index]}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(115)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Obx(() => RadioListTile<String>(
                          title: const Text('Online', style: TextStyle(fontWeight: FontWeight.bold)),
                          value: 'Online Payment',
                          groupValue: controller.selectedPaymentOption.value,
                          onChanged: (String? value) {
                            if (value != null) controller.setSelectedPaymentOption(value);
                          },
                        )),
                      ),
                      Expanded(
                        child: Obx(() => RadioListTile<String>(
                          title: const Text('Offline', style: TextStyle(fontWeight: FontWeight.bold)),
                          value: 'Offline Payment',
                          groupValue: controller.selectedPaymentOption.value,
                          onChanged: (String? value) {
                            if (value != null) controller.setSelectedPaymentOption(value);
                          },
                        )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child:        Center(
                    child: Obx(() {
                      return Visibility(
                          visible: controller.selectedPaymentOption.value  != "Online Payment" ? false :true  ,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical:  5),
                            child: Text("You can make payment only with google pay"  ,style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic),  ),
                          ));
                    }),
                  ),
                ),

                CustomSubmitButton(
                  buttonTitle: "Send Add Request",
                  onpressed: () {



                    if(controller.amountController.text.isNull  || controller.amountController.text.isEmpty   ){
                      showinvalidDigitsSnackbar(
                        context,"Failed Your you must added atleast Rs.1 to send the request",true
                      );



                    }else{
                      controller.fundRequest(context,controller.amountController.text ,"Add" );

                      print("Selected Payment Option: ${controller.selectedPaymentOption.value}");
                      print("Entered Amount: ${controller.amountController.text}");

                    }






                  },
                ),
              ],
            ),
          ),

          Visibility(
            visible: iswithdrawFund,
            child: Column(
              children: [
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomLoginTexField(
                    hintText: "Enter Withdraw Points",
                    keyboardtype: TextInputType.number,
                    textController: controller.amountController,
                  ),
                ),
                SizedBox(
                  width: width * 0.87,
                  height: height * 0.23,
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2,
                    mainAxisSpacing: 10,
                    padding: EdgeInsets.all(8.0),
                    children: List.generate(controller.walletsPointList.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          // Set the selected wallet point to the TextEditingController
                          controller.amountController.text = controller.walletsPointList[index].toString();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red.shade500,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              '₹ ${controller.walletsPointList[index]}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                SizedBox(
                  height: height *0.48,
                ),


                CustomSubmitButton(
                  buttonTitle: "Send Withdraw Request",
                  onpressed: () {
                    if(controller.amountController.text.isNull  || controller.amountController.text.isEmpty   ){
                      showinvalidDigitsSnackbar(
                        context,"Failed Your you must added atleast Rs.1 to send the request",true
                      );
                    }else{
                      controller.fundRequest(context,controller.amountController.text ,"withdraw" );
                      print("Entered Amount: ${controller.amountController.text}");
                    }
                  },
                ),
              ],
            ),
          ),

          Visibility(
            visible: isWalletTranser,
            child: Column(
              children: [
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomLoginTexField(
                    hintText: "Enter Transer Point",
                    keyboardtype: TextInputType.number,
                    textController: controller.amountController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomLoginTexField(
                    hintText: "Enter Your Number to transfer money",
                    keyboardtype: TextInputType.number,
                    textController: controller.phonenumberController,
                    validator: (value){




                    },


                  ),
                ),
                SizedBox(
                  width: width * 0.87,
                  height: height * 0.23,
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2,
                    mainAxisSpacing: 10,
                    padding: EdgeInsets.all(8.0),
                    children: List.generate(controller.walletsPointList.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          controller.amountController.text = controller.walletsPointList[index].toString();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red.shade500,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              '₹ ${controller.walletsPointList[index]}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                SizedBox(
                  height: 50,
                  child:        Center(
                    child: Obx(() {
                      return Visibility(
                          visible: controller.selectedPaymentOption.value  != "Online Payment" ? false :true  ,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical:  5),
                            child: Text("You can make payment only with google pay"  ,style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic),  ),
                          ));
                    }),
                  ),
                ),

                CustomSubmitButton(
                  buttonTitle: "Send Add Request",
                  onpressed: () {

                    if(controller.amountController.text.isNull   || controller.amountController.text.isEmpty   ) {
                      showinvalidDigitsSnackbar(
                          context,
                          "Failed Your you must added atleast Rs.1 to send the request",
                          true
                      );
                    }else if(controller.phonenumberController.text.isNull
                        || controller.phonenumberController.text.length < 10 ){
                      showinvalidDigitsSnackbar(
                          context,"Please Enter 10 digit valid mobile Number",true
                      );
                    }else{

                     controller.fundRequest(context, controller.amountController.text ,"Transfer",takenmobileNumber:  controller.phonenumberController.text   );


                    }





                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
