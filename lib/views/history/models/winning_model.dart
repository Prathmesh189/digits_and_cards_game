/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

WinningModel winningModelFromJson(String str) => WinningModel.fromJson(json.decode(str));

String winningModelToJson(WinningModel data) => json.encode(data.toJson());

class WinningModel {
    WinningModel({

        required this.winStatus,
        required this.winPoints,
        required this.winDate,
        required this.winingId,
    });


    String winStatus;
    double winPoints;
    int winDate;
    int winingId;

    factory WinningModel.fromJson(Map<dynamic, dynamic> json) => WinningModel(
        winStatus: json["winStatus"]  ?? "undefined"  ,
        winPoints: json["winPoints"]  ??  00.00 ,
        winDate: json["winDate"]  ,
        winingId: json["winingId"]   ?? 0 ,
    );

    Map<dynamic, dynamic> toJson() => {
        "winStatus": winStatus,
        "winPoints": winPoints,
        "winDate": winDate,
        "winingId": winingId,
    };
}

