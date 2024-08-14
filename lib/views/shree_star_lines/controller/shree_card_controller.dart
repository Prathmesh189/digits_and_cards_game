import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../constants/constants.dart';
import '../../../../dialog_indicators/loading_dialog.dart';
import '../../GamePlayScreens/digits/models/toShowUserModel.dart';
import '../../home/controllers/home_controllers.dart';
import '../model/shreeline_add_bid_model.dart';


class ShreeCardsPlayController extends GetxController {
  var walletBalance = 0.obs;
  var currentDate = ''.obs;
  var sessionStatus = 'Open'.obs;
  var sessionStatusList = <String>[].obs;
  RxBool isLoading = false.obs;
  final HomeController honecontroller = Get.put(HomeController()  , permanent: true );
  TextEditingController pattiController = TextEditingController();
  TextEditingController singleDigitsController = TextEditingController();
  TextEditingController pointsController = TextEditingController();
  RxList<Toshowusermodel> list = <Toshowusermodel>[].obs;
  RxList<ShreelineAddBidModel> listToSendDB = <ShreelineAddBidModel>[].obs;


  var agentID = ''.obs;
  var userId = ''.obs;


  @override
  void onInit() {
    super.onInit();
    updateCurrentDate();
    getUserAndAdminId();
    fetchSessionStatuses();
  }

  void getUserAndAdminId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    agentID.value = prefs.getString('agentId') ?? '';
    userId.value = prefs.getString('userId') ?? '';
  }



  void clearTextControllers() {
    pointsController.clear();
    pattiController.clear();
    singleDigitsController.clear();
  }

  List<String> getSinglePatti() {
    List<String> singlePatti = [
      // Single Pana
      "123", "124", "125", "126", "127", "128", "129", "120",
      "134", "135", "136", "137", "138", "139", "130",
      "145", "146", "147", "148", "149", "140",
      "156", "157", "158", "159", "150",
      "167", "168", "169", "160",
      "178", "179", "170", "189", "180", "190",
      "234", "235", "236", "237", "238", "239", "230",
      "245", "246", "247", "248", "249", "240",
      "256", "257", "258", "259", "250",
      "267", "268", "269", "260",
      "278", "279", "270", "289", "280",
      "290", "345", "346", "347", "348", "349", "340",
      "356", "357", "358", "359", "350",
      "367", "368", "369", "360", "378", "379", "370",
      "389", "380", "390", "456", "457", "458", "459", "450",
      "467", "468", "469", "460",
      "478", "479", "470",
      "489", "480", "490",
      "567", "568", "569", "560",
      "578", "579", "570", "589", "580",
      "590", "678", "679", "670",
      "689", "680",
      "690", "789", "780",
      "790", "890",
    ];
    return singlePatti;
  }

  List<String>  getDoublePatti(){

    List<String> DoublePatti = [

      "112", "113", "114", "115", "116", "117", "118", "119", "110",
      "100", "122", "133", "144", "155", "166", "177", "188", "199",
      "223", "224", "225", "226", "227", "228", "229", "220", "599",
      "200", "233", "244", "255", "266", "277", "288", "299", "599",
      "334", "335", "336", "337", "338", "339", "330",
      "300", "344", "355", "366", "377", "388", "399",
      "445", "446", "447", "448", "449", "440",
      "400", "455", "466", "477", "488", "499",
      "556", "557", "558", "559", "550",
      "500", "566", "577", "588", "599",
      "667", "668", "669", "660",
      "600", "677", "688", "699",
      "778", "779", "770", "700",
      "889", "880", "800", "899",
      "990", "900" , "788", "799",



    ];


    return DoublePatti;

  }

  List<String>  getTriplePatti(){
    List<String> getTriplePatti = ["111", "222" ,"333","444","555","666","777","888","999"  ];
    return getTriplePatti;
  }

  void updateWalletBalance(int newBalance) {
    walletBalance.value = newBalance;
  }

  void increment() {
    walletBalance.value++;
  }

  Future<void> submitBid(List listToSendDB, BuildContext context   ) async {
    final url = Uri.parse('${Constants.baseUrl}${Constants.ShreeSendBid}');

    print(url);
    try {
      isLoading(true);
      loadingDialog(context,"Making Transactions");
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(listToSendDB));
      print(jsonEncode(listToSendDB));

      if (response.statusCode == 200) {
        isLoading(false);
        print('Bid submit successfully');
        print(response.body);
        print(response.statusCode);
        Get.back();
        Get.back();
        honecontroller.getWallet();
        Get.snackbar(" Successful", "Your Bid Has Been successfully Got Placed " , backgroundColor: Colors.green.withOpacity(0.6) );

      } else {
        isLoading(false);
        print('Failed to submit bid: ${response.body}');
        Get.snackbar("Something went wrong!", "Please Try again later!");
      }
    } catch (e) {
      isLoading(false);
      print('Error occurred while submit bid: $e');
    }
  }

  void updateCurrentDate() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('dd MMM yyyy');
    currentDate.value = formatter.format(now);
  }

  void updateSessionStatus(String status) {
    sessionStatus.value = status;
  }

  void fetchSessionStatuses() {

    sessionStatusList.assignAll(['Open', 'Close']);
    sessionStatus.value = sessionStatusList.first;
  }

}