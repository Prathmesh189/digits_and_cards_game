/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        required this.phonepeNumber,
        required this.pincode,
        required this.address,
        required this.city,
        required this.fullName,
        required this.bankName,
        required this.walletPoints,
        required this.userId,
        required this.accountHolderName,
        required this.paytmNumber,
        required this.token,
        required this.mobNo,
        required this.password,
        required this.gpayNumber,
        required this.accountNo,
        required this.ifscCode,
        // required this.agentMaster,
        required this.email,
        required this.status,
    });

    String phonepeNumber;
    int pincode;
    String address;
    String city;
    String fullName;
    String bankName;
    double walletPoints;
    int userId;
    String accountHolderName;
    String paytmNumber;
    String token;
    String mobNo;
    String password;
    String gpayNumber;
    String accountNo;
    String ifscCode;
    // AgentMaster agentMaster;
    String email;
    String status;

    factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
        phonepeNumber: json["phonepeNumber"],
        pincode: json["pincode"],
        address: json["address"],
        city: json["city"],
        fullName: json["fullName"],
        bankName: json["bankName"],
        walletPoints: json["walletPoints"],
        userId: json["userId"],
        accountHolderName: json["accountHolderName"],
        paytmNumber: json["paytmNumber"],
        token: json["token"],
        mobNo: json["mobNo"],
        password: json["password"],
        gpayNumber: json["gpayNumber"],
        accountNo: json["accountNo"],
        ifscCode: json["ifscCode"],
        // agentMaster: AgentMaster.fromJson(json["agentMaster"]),
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
        "userId": userId,
        "accountHolderName": accountHolderName,
        "paytmNumber": paytmNumber,
        "token": token,
        "mobNo": mobNo,
        "password": password,
        "gpayNumber": gpayNumber,
        "accountNo": accountNo,
        "ifscCode": ifscCode,
        // "agentMaster": agentMaster.toJson(),
        "email": email,
        "status": status,
    };
}

class AgentMaster {
    AgentMaster({
        required this.agentId,
        required this.agentAddress,
        required this.agentEmail,
        required this.agentAccountNo,
        required this.roleId,
        required this.whatsAppNo,
        required this.agentName,
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

    int agentId;
    String agentAddress;
    String agentEmail;
    String agentAccountNo;
    int roleId;
    String whatsAppNo;
    String agentName;
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
    double agentwalletPoints;
    String agentBankName;
    String agentMobNo;

    factory AgentMaster.fromJson(Map<dynamic, dynamic> json) => AgentMaster(
        agentId: json["agentId"],
        agentAddress: json["agentAddress"],
        agentEmail: json["agentEmail"],
        agentAccountNo: json["agentAccountNo"],
        roleId: json["roleId"],
        whatsAppNo: json["whatsAppNo"],
        agentName: json["agentName"],
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
        agentwalletPoints: json["agentwalletPoints"]?.toDouble(),
        agentBankName: json["agentBankName"],
        agentMobNo: json["agentMobNo"],
    );

    Map<dynamic, dynamic> toJson() => {
        "agentId": agentId,
        "agentAddress": agentAddress,
        "agentEmail": agentEmail,
        "agentAccountNo": agentAccountNo,
        "roleId": roleId,
        "whatsAppNo": whatsAppNo,
        "agentName": agentName,
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
//