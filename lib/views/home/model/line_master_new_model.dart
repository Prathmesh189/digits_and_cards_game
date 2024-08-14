/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

LineMasterNewModel lineMasterNewModelFromJson(String str) => LineMasterNewModel.fromJson(json.decode(str));

String lineMasterNewModelToJson(LineMasterNewModel data) => json.encode(data.toJson());

class LineMasterNewModel {
    LineMasterNewModel({
        required this.lineEndTime,
        required this.lineStartTime,
        required this.lineDate,
        required this.openStatus,
        required this.finalStatus,
        required this.lineId,
        required this.lineName,
        required this.agentMaster,
        required this.status,
        required this.lineOpenNo,
        required this.lineMidNo,
        required this.lineCloseNo,
    });

    int lineEndTime;
    int lineStartTime;
    DateTime lineDate;
    bool openStatus;
    bool finalStatus;
    int lineId;
    String lineName;
    AgentMaster agentMaster;
    String status;
    String lineOpenNo;
    String lineMidNo;
    String lineCloseNo;

    factory LineMasterNewModel.fromJson(Map<dynamic, dynamic> json) => LineMasterNewModel(
        lineEndTime: json["lineEndTime"],
        lineStartTime: json["lineStartTime"],
        lineDate: DateTime.parse(json["lineDate"]),
        openStatus: json["openStatus"],
        finalStatus: json["finalStatus"],
        lineId: json["lineId"],
        lineName: json["lineName"],
        agentMaster: AgentMaster.fromJson(json["agentMaster"]),
        status: json["status"],
        lineOpenNo: json["lineOpenNo"] ?? "***" ,
        lineMidNo: json["lineMidNo"] ?? "***" ,
        lineCloseNo: json["lineCloseNo"] ?? "***" ,
    );

    Map<dynamic, dynamic> toJson() => {
        "lineEndTime": lineEndTime,
        "lineStartTime": lineStartTime,
        "lineDate": "${lineDate.year.toString().padLeft(4, '0')}-${lineDate.month.toString().padLeft(2, '0')}-${lineDate.day.toString().padLeft(2, '0')}",
        "openStatus": openStatus,
        "finalStatus": finalStatus,
        "lineId": lineId,
        "lineName": lineName,
        "agentMaster": agentMaster.toJson(),
        "status": status,
        "lineOpenNo": lineOpenNo,
        "lineMidNo": lineMidNo,
        "lineCloseNo": lineCloseNo,
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
