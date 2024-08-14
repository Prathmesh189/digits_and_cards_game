/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

ShreelineAddBidModel shreelineAddBidModelFromJson(String str) => ShreelineAddBidModel.fromJson(json.decode(str));

String shreelineAddBidModelToJson(ShreelineAddBidModel data) => json.encode(data.toJson());

class ShreelineAddBidModel {
    ShreelineAddBidModel({
        required this.bidPoint,
        required this.game,
        required this.shreeStarLineId,
        // required this.session,
        // required this.bidDate,
        required this.userId,
        required this.value,
    });

    int bidPoint;
    String game;
    int shreeStarLineId;
    // String session;
    // DateTime bidDate;
    int userId;
    String value;

    factory ShreelineAddBidModel.fromJson(Map<dynamic, dynamic> json) => ShreelineAddBidModel(
        bidPoint: json["bidPoint"],
        game: json["game"],
        shreeStarLineId: json["shreeStarLineId"],
        // session: json["session"],
        // bidDate: DateTime.parse(json["bidDate"]),
        userId: json["userId"],
        value: json["value"],
    );

    Map<dynamic, dynamic> toJson() => {
        "bidPoint": bidPoint,
        "game": game,
        "shreeStarLineId": shreeStarLineId,
        // "session": session,
        // "bidDate": bidDate.toIso8601String(),
        "userId": userId,
        "value": value,
    };
}
