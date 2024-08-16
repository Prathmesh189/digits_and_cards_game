
import 'package:flutter_satka_matka/views/singleViewa/models/dashboard_model.dart';

import '../generated/assets.dart';

class Constants {

  static String baseUrl = "http://192.168.0.11:7080";
  //static String baseUrl = "http://97.74.91.204:2585";


  static String registerUser = "/user";
  static String userLogin = "/user/userLogin";
  static String adminDetails = "/agent/editAgent";
  static String getBanners = "/bannerMaster/getAllBannerMasterList";
  static String getActiveLineList = "/lineMaster/getActiveList";
  static String gameRateList = "/gameratemaster/getGameRateListByAgentId/1";
  static String getTransactionHistoryList = "/getuserTransction";
  static String winMasterHistory = "/wining/getWiningList";
  static String BidMasterHistory = "/bidMaster/getAllList";
  static String FundMasterHistory = "/fundRequest/getAllList/";
  static String ShreeBidWinningHistory = "/shreeStarLineBidMaster/getAllShreeStarLineWiningList/";
  static String ShreeLineGames = "/shreestarline/getAllList";
  static String SendBid = "/bidMaster";
  static String ShreeSendBid = "/shreeStarLineBidMaster";
  static String getUSer = "/user/editUser";
  static String editUser = "/user";
  static String addFundRwquest = "/fundRequest";
  static String getNotiication = "/notification/getActiveList";

  List <int>  walletsPointList = [500,1000,2000,5000,8000,10000];

  List <DashboardModel>  dashboardModellist = [
    DashboardModel(image: Assets.imagesSingleDigit, title: "Single Digit"),
    DashboardModel(image: Assets.imagesDoubleDigit, title: "Jodi"),
    DashboardModel(image: Assets.imagesPatti, title: "Single Patti "),
    DashboardModel(image: Assets.imagesDoublePatti, title: "Double Patti "),
    DashboardModel(image: Assets.imagesTriplePatti, title: "Triple Patti "),
    DashboardModel(image: Assets.imagesCasino, title: "Half Sangam "),
    DashboardModel(image: Assets.imagesFullSangam, title: "full Sangam "),
  ];

  List <DashboardModel>  ShreedashboardModellist = [
    DashboardModel(image: Assets.imagesSingleDigit, title: "Single Digit"),
    DashboardModel(image: Assets.imagesPatti, title: "Single Patti "),
    DashboardModel(image: Assets.imagesDoublePatti, title: "Double Patti "),
    DashboardModel(image: Assets.imagesTriplePatti, title: "Triple Patti "),
  ];
}