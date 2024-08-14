/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

SendDigitsBidModel sendDigitsBidModelFromJson(String str) => SendDigitsBidModel.fromJson(json.decode(str));

String sendDigitsBidModelToJson(SendDigitsBidModel data) => json.encode(data.toJson());

class SendDigitsBidModel {
    SendDigitsBidModel({
        required this.agentId,
        required this.game,
        required this.session,
        required this.lineId,
        required this.lineName,
        required this.userId,
        required this.bidPoint,
        required this.gameName,
        required this.value,
        required this.status,
        // required this.bidDate,

        // required this.lineMaster,
        // required this.userMaster,


    });

    int agentId;
    String game;
    // LineMaster lineMaster;
    String session;
    int lineId;
    String lineName;
    int userId;
    // UserMaster userMaster;
    int bidPoint;
    String gameName;
    // DateTime bidDate;
    String value;
    String status;

    factory SendDigitsBidModel.fromJson(Map<dynamic, dynamic> json) => SendDigitsBidModel(
        agentId: json["agentId"],
        game: json["game"],
        // lineMaster: LineMaster.fromJson(json["lineMaster"]),
        session: json["session"],
        lineId: json["lineId"],
        lineName: json["lineName"],
        userId: json["userId"],
        // userMaster: UserMaster.fromJson(json["userMaster"]),
        bidPoint: json["bidPoint"],
        gameName: json["gameName"],
        // bidDate: DateTime.parse(json["bidDate"]),
        value: json["value"],
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
        "agentId": agentId,
        "game": game,
        // "lineMaster": lineMaster.toJson(),
        "session": session,
        "lineId": lineId,
        "lineName": lineName,
        "userId": userId,
        // "userMaster": userMaster.toJson(),
        "bidPoint": bidPoint,
        "gameName": gameName,
        // "bidDate": bidDate.toIso8601String(),
        "value": value,
        "status": status,
    };
}


class LineMaster {
    LineMaster({
        required this.lineEndTime,
        required this.lineStartTime,
        required this.lineDate,
        required this.lineOpenNo,
        required this.openStatus,
        required this.finalStatus,
        required this.lineId,
        required this.lineName,
        required this.lineMidNo,
        required this.agentMaster,
        required this.lineCloseNo,
        required this.status,
    });

    DateTime lineEndTime;
    DateTime lineStartTime;
    DateTime lineDate;
    int lineOpenNo;
    bool openStatus;
    bool finalStatus;
    int lineId;
    String lineName;
    String lineMidNo;
    AgentMaster agentMaster;
    int lineCloseNo;
    String status;

    factory LineMaster.fromJson(Map<dynamic, dynamic> json) => LineMaster(
        lineEndTime: DateTime.parse(json["lineEndTime"]),
        lineStartTime: DateTime.parse(json["lineStartTime"]),
        lineDate: DateTime.parse(json["lineDate"]),
        lineOpenNo: json["lineOpenNo"],
        openStatus: json["openStatus"],
        finalStatus: json["finalStatus"],
        lineId: json["lineId"],
        lineName: json["lineName"],
        lineMidNo: json["lineMidNo"],
        agentMaster: AgentMaster.fromJson(json["agentMaster"]),
        lineCloseNo: json["lineCloseNo"],
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
        "lineEndTime": lineEndTime.toIso8601String(),
        "lineStartTime": lineStartTime.toIso8601String(),
        "lineDate": lineDate.toIso8601String(),
        "lineOpenNo": lineOpenNo,
        "openStatus": openStatus,
        "finalStatus": finalStatus,
        "lineId": lineId,
        "lineName": lineName,
        "lineMidNo": lineMidNo,
        "agentMaster": agentMaster.toJson(),
        "lineCloseNo": lineCloseNo,
        "status": status,
    };
}

class AgentMaster {
    AgentMaster({
        required this.agentAddress,
        required this.agentId,
        required this.agentEmail,
        required this.agentAccountNo,
        required this.roleId,
        required this.whatsAppNo,
        required this.agentName,
        required this.otp,
        required this.commision,
        required this.login,
        required this.agentStatus,
        required this.agentPassword,
        required this.agentPaytmNumber,
        required this.agentAccountHolderName,
        required this.agentcity,
        required this.agentIfscCode,
        required this.agentPinCode,
        required this.agentGpayNumber,
        required this.agentPhonepeNumber,
        required this.agentwalletPoints,
        required this.agentBankName,
        required this.agentMobNo,
    });

    String agentAddress;
    int agentId;
    String agentEmail;
    String agentAccountNo;
    int roleId;
    String whatsAppNo;
    String agentName;
    int otp;
    int commision;
    bool login;
    String agentStatus;
    String agentPassword;
    String agentPaytmNumber;
    String agentAccountHolderName;
    String agentcity;
    String agentIfscCode;
    int agentPinCode;
    String agentGpayNumber;
    String agentPhonepeNumber;
    int agentwalletPoints;
    String agentBankName;
    String agentMobNo;

    factory AgentMaster.fromJson(Map<dynamic, dynamic> json) => AgentMaster(
        agentAddress: json["agentAddress"],
        agentId: json["agentId"],
        agentEmail: json["agentEmail"],
        agentAccountNo: json["agentAccountNo"],
        roleId: json["roleId"],
        whatsAppNo: json["whatsAppNo"],
        agentName: json["agentName"],
        otp: json["otp"],
        commision: json["commision"],
        login: json["login"],
        agentStatus: json["agentStatus"],
        agentPassword: json["agentPassword"],
        agentPaytmNumber: json["agentPaytmNumber"],
        agentAccountHolderName: json["agentAccountHolderName"],
        agentcity: json["agentcity"],
        agentIfscCode: json["agentIfscCode"],
        agentPinCode: json["agentPinCode"],
        agentGpayNumber: json["agentGpayNumber"],
        agentPhonepeNumber: json["agentPhonepeNumber"],
        agentwalletPoints: json["agentwalletPoints"],
        agentBankName: json["agentBankName"],
        agentMobNo: json["agentMobNo"],
    );

    Map<dynamic, dynamic> toJson() => {
        "agentAddress": agentAddress,
        "agentId": agentId,
        "agentEmail": agentEmail,
        "agentAccountNo": agentAccountNo,
        "roleId": roleId,
        "whatsAppNo": whatsAppNo,
        "agentName": agentName,
        "otp": otp,
        "commision": commision,
        "login": login,
        "agentStatus": agentStatus,
        "agentPassword": agentPassword,
        "agentPaytmNumber": agentPaytmNumber,
        "agentAccountHolderName": agentAccountHolderName,
        "agentcity": agentcity,
        "agentIfscCode": agentIfscCode,
        "agentPinCode": agentPinCode,
        "agentGpayNumber": agentGpayNumber,
        "agentPhonepeNumber": agentPhonepeNumber,
        "agentwalletPoints": agentwalletPoints,
        "agentBankName": agentBankName,
        "agentMobNo": agentMobNo,
    };
}

class UserMaster {
    UserMaster({
        required this.phonepeNumber,
        required this.pincode,
        required this.address,
        required this.city,
        required this.fullName,
        required this.bankName,
        required this.walletPoints,
        required this.accountHolderName,
        required this.paytmNumber,
        required this.userId,
        required this.token,
        required this.mobNo,
        required this.password,
        required this.gpayNumber,
        required this.accountNo,
        required this.agentMaster,
        required this.ifscCode,
        required this.email,
        required this.status,
    });

    String phonepeNumber;
    int pincode;
    String address;
    String city;
    String fullName;
    String bankName;
    int walletPoints;
    String accountHolderName;
    String paytmNumber;
    int userId;
    String token;
    String mobNo;
    String password;
    String gpayNumber;
    String accountNo;
    AgentMaster agentMaster;
    String ifscCode;
    String email;
    String status;

    factory UserMaster.fromJson(Map<dynamic, dynamic> json) => UserMaster(
        phonepeNumber: json["phonepeNumber"],
        pincode: json["pincode"],
        address: json["address"],
        city: json["city"],
        fullName: json["fullName"],
        bankName: json["bankName"],
        walletPoints: json["walletPoints"],
        accountHolderName: json["accountHolderName"],
        paytmNumber: json["paytmNumber"],
        userId: json["userId"],
        token: json["token"],
        mobNo: json["mobNo"],
        password: json["password"],
        gpayNumber: json["gpayNumber"],
        accountNo: json["accountNo"],
        agentMaster: AgentMaster.fromJson(json["agentMaster"]),
        ifscCode: json["ifscCode"],
        email: json["email"],
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
        "phonepeNumber": phonepeNumber,
        "pincode": pincode,
        "address": address,
        "city": city,
        "fullName": fullName,
        "bankName": bankName,
        "walletPoints": walletPoints,
        "accountHolderName": accountHolderName,
        "paytmNumber": paytmNumber,
        "userId": userId,
        "token": token,
        "mobNo": mobNo,
        "password": password,
        "gpayNumber": gpayNumber,
        "accountNo": accountNo,
        "agentMaster": agentMaster.toJson(),
        "ifscCode": ifscCode,
        "email": email,
        "status": status,
    };
}
