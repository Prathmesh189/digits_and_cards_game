import 'dart:convert';

ShreestarlineModel shreestarlineModelFromJson(String str) => ShreestarlineModel.fromJson(json.decode(str));

String shreestarlineModelToJson(ShreestarlineModel data) => json.encode(data.toJson());

class ShreestarlineModel {
    ShreestarlineModel({
        required this.date,
        required this.openStatus,
        required this.shreeStarLineId,
        required this.name,
        required this.openPannaDigit,
        required this.jodiDigit,
        required this.startTime,
        required this.endTime,
        required this.status,
    });

    DateTime date;
    bool openStatus;
    int shreeStarLineId;
    String name;
    int? openPannaDigit;
    int? jodiDigit;
    int startTime;
    int endTime;
    String status;

    factory ShreestarlineModel.fromJson(Map<String, dynamic> json) => ShreestarlineModel(
        date: DateTime.parse(json["date"]),
        openStatus: json["openStatus"] ?? false,
        shreeStarLineId: json["shreeStarLineId"] ?? 0,
        name: json["name"] ?? "undefined",
        openPannaDigit: json["openPannaDigit"]  != null ? json["openPannaDigit"] : null,
        jodiDigit: json["jodiDigit"] != null ? json["jodiDigit"] : null,
        startTime: json["startTime"] ?? 0,
        endTime: json["endTime"] ?? 0,
        status: json["status"] ?? "undefined",
    );

    Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "openStatus": openStatus,
        "shreeStarLineId": shreeStarLineId,
        "name": name,
        "openPannaDigit": openPannaDigit,
        "jodiDigit": jodiDigit,
        "startTime": startTime,
        "endTime": endTime,
        "status": status,
    };
}