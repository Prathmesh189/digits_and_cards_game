/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

NotificationsModel notificationsModelFromJson(String str) => NotificationsModel.fromJson(json.decode(str));

String notificationsModelToJson(NotificationsModel data) => json.encode(data.toJson());

class NotificationsModel {
    NotificationsModel({
        required this.notificationMasterId,
        required this.notificationMasterDate,
        required this.notificationMasterTitle,
        required this.notificationMasterDesc,
    });

    int notificationMasterId;
    int notificationMasterDate;
    String notificationMasterTitle;
    String notificationMasterDesc;

    factory NotificationsModel.fromJson(Map<dynamic, dynamic> json) => NotificationsModel(
        notificationMasterId: json["notificationMasterId"] ?? 0,
        notificationMasterDate: json["notificationMasterDate"] ?? 0,
        notificationMasterTitle: json["notificationMasterTitle"] ?? " ",
        notificationMasterDesc: json["notificationMasterDesc"] ?? " ",
    );

    Map<dynamic, dynamic> toJson() => {
        "notificationMasterId": notificationMasterId,
        "notificationMasterDate": notificationMasterDate,
        "notificationMasterTitle": notificationMasterTitle,
        "notificationMasterDesc": notificationMasterDesc,
    };
}
