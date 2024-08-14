/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

FundsRequestModel fundsRequestModelFromJson(String str) => FundsRequestModel.fromJson(json.decode(str));

String fundsRequestModelToJson(FundsRequestModel data) => json.encode(data.toJson());

class FundsRequestModel {
    FundsRequestModel({

        required this.requestType,
        required this.requestDate,
        required this.fundRequestId,
        required this.points,
        required this.status,
    });


    String requestType;
    int requestDate;
    int fundRequestId;
    double points;
    String status;

    factory FundsRequestModel.fromJson(Map<dynamic, dynamic> json) => FundsRequestModel(

        requestType: json["requestType"],
        requestDate: json["requestDate"],
        fundRequestId: json["fundRequestId"],
        points: json["points"],
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {

        "requestType": requestType,
        "requestDate": requestDate,
        "fundRequestId": fundRequestId,
        "points": points,
        "status": status,
    };
}

