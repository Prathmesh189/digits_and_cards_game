import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Utills {


  String formatTimestamp(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat('h:mm a').format(date);
  }

  String updateCurrentDate() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('dd MMM yyyy');
    var currentDate = formatter.format(now);
    return currentDate;
  }

  void openWhatsApp(String phoneNumber ) async {
    String message = "Hello, I need assistance";
    String url = "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }




  String parseTimestamp(int timestamp ,{int onlyTime = 1}  ) {

    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formattedDate = "${dateTime.day.toString().padLeft(2, '0')} ${_getMonthName(dateTime.month)} ${dateTime.year}";
    String hour = dateTime.hour % 12 == 0 ? '12' : (dateTime.hour % 12).toString();
    String minute = dateTime.minute.toString().padLeft(2, '0');
    String amPm = dateTime.hour >= 12 ? 'PM' : 'AM';

    String formattedTime = "$hour:$minute $amPm";

    if(onlyTime == 1){
      return "on $formattedDate at $formattedTime";
    }else{
      return " $formattedTime  $formattedDate";

    }


  }


  String _getMonthName(int month) {
    const List<String> monthNames = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return monthNames[month - 1]; // Month is 1-indexed
  }

  void makePhoneCall(String phoneNumber) async {
    final telScheme = 'tel:$phoneNumber';
    if (await canLaunch(telScheme)) {
      await launch(telScheme);
    } else {
      print('Could not launch $telScheme');
    }
  }



  static bool isTimeInRange(TimeOfDay current, TimeOfDay start, TimeOfDay end) {
    // Compare only the time part
    final nowMinutes = current.hour * 60 + current.minute;
    final startMinutes = start.hour * 60 + start.minute;
    final endMinutes = end.hour * 60 + end.minute;

    if (startMinutes < endMinutes) {
      return nowMinutes >= startMinutes && nowMinutes <= endMinutes;
    } else {
      return nowMinutes >= startMinutes || nowMinutes <= endMinutes;
    }
  }

  void snackBar(BuildContext context, bool isError, String title) {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isError ? Colors.red.withOpacity(0.7
        ) : Colors.green,
        content: Text(title ,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),),
        showCloseIcon: true,
      ),
    );
  }
}
