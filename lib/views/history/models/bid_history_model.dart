/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

BidHistoryModel bidHistoryModelFromJson(String str) => BidHistoryModel.fromJson(json.decode(str));

String bidHistoryModelToJson(BidHistoryModel data) => json.encode(data.toJson());

class BidHistoryModel {
    BidHistoryModel({

        required this.game,
        required this.bidPoint,
        required this.session,
        required this.bidDate,
        required this.value,
        required this.bidId,
    });

    String game;
    double bidPoint;
    String session;
    int bidDate;
    String value;
    int bidId;

    factory BidHistoryModel.fromJson(Map<dynamic, dynamic> json) => BidHistoryModel(

        game: json["game"]  ?? "Empty",
        bidPoint: json["bidPoint"] ?? 00.00,
        session: json["session"]?? "Empty" ,
        bidDate: json["bidDate"] ?? 0000,
        value: json["value"]?? "Empty" ,
        bidId: json["bidId"]?? 10 ,
    );

    Map<dynamic, dynamic> toJson() => {
        "game": game,
        "bidPoint": bidPoint,
        "session": session,
        "bidDate": bidDate,
        "value": value,
        "bidId": bidId,
    };
}