/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

GamerateModel gamerateModelFromJson(String str) => GamerateModel.fromJson(json.decode(str));

String gamerateModelToJson(GamerateModel data) => json.encode(data.toJson());

class GamerateModel {
    GamerateModel({
        required this.agentId,
        required this.gameName,
        required this.gameRate,
        required this.agentName,
        required this.gameRateMasterId,
        required this.status,
    });

    int agentId;
    String gameName;
    double gameRate;
    String agentName;
    int gameRateMasterId;
    String status;

    factory GamerateModel.fromJson(Map<dynamic, dynamic> json) => GamerateModel(
        agentId: json["agentId"],
        gameName: json["gameName"],
        gameRate: json["gameRate"],
        agentName: json["agentName"],
        gameRateMasterId: json["gameRateMasterId"],
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
        "agentId": agentId,
        "gameName": gameName,
        "gameRate": gameRate,
        "agentName": agentName,
        "gameRateMasterId": gameRateMasterId,
        "status": status,
    };
}
