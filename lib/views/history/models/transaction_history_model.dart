/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

TransactionHistoryModel transactionHistoryModelFromJson(String str) => TransactionHistoryModel.fromJson(json.decode(str));

String transactionHistoryModelToJson(TransactionHistoryModel data) => json.encode(data.toJson());

class TransactionHistoryModel {
    TransactionHistoryModel({
        required this.dateTime,
        required this.userTransctionId,
        required this.points,
        required this.tranStatus,
        required this.tranType,
    });

    int dateTime;
    int userTransctionId;
    double points;
    String tranStatus;
    String tranType;

    factory TransactionHistoryModel.fromJson(Map<dynamic, dynamic> json) => TransactionHistoryModel(
        dateTime: json["dateTime"],
        userTransctionId: json["userTransctionId"] ?? 0,
        points: json["points"]  ?? 00.00,
        tranStatus: json["tranStatus"] ?? "empty",
        tranType: json["tranType"] ?? "empty",
    );

    Map<dynamic, dynamic> toJson() => {
        "dateTime": dateTime,
        "userTransctionId": userTransctionId,
        "points": points,
        "tranStatus": tranStatus,
        "tranType": tranType,
    };
}