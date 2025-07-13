
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:szdfzf/NotificationUtilities.dart';

class Mylocalnotification extends StatefulWidget {
  const Mylocalnotification({super.key});

  @override
  State<Mylocalnotification> createState() => _MylocalnotificationState();
}

class _MylocalnotificationState extends State<Mylocalnotification> {
  // var noti= NotificationUtilities().ini;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed){
      if(!isAllowed){
        showDialog(context: context, builder: (context)=> AlertDialog(
          title: Text("Allowed Notification"),
          content: Text("Our app notification"),
          actions: [
           TextButton(onPressed: (){
             AwesomeNotifications().requestPermissionToSendNotifications().then((_)=>{
               Get.back()
             });
           }, child: Text("Don\'t allowed")),
           TextButton(onPressed: (){
             Get.back();
           }, child: Text("Allow"))
          ],
        ));
    }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            createPlaneNotification();
          }, child: Text("show Notification"))
        ],
      )
    );
  }
}
