
import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:szdfzf/NotificationUtilities.dart';

import 'MyOwnNotification.dart';

class Mylocalnotification extends StatefulWidget {
  const Mylocalnotification({super.key});

  @override
  State<Mylocalnotification> createState() => _MylocalnotificationState();
}

class _MylocalnotificationState extends State<Mylocalnotification> {
  // var noti= NotificationUtilities().ini;

  var check;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check= isNotificationAllowed();
  }

  // to check access permission
  Future<bool> isNotificationAllowed() async {
    return await AwesomeNotifications().isNotificationAllowed();
  }



  Future<void> _checkNotificationPermission() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    // debugger();
    if (!isAllowed) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Allow Notification"),
            content: const Text(
              "Our app would like to send you notifications.",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Don't Allow"),
              ),
              TextButton(
                onPressed: () {
                  AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Get.back());
                },
                child: const Text("Allow"),
              ),
            ],
          ),
        );
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () async{
              if(await isNotificationAllowed() != true){
                print("inside method ${isNotificationAllowed() != true}");
                _checkNotificationPermission();// check the permission before create notification
              }
              NotificationUtilities.createPlaneNotification();// after get permission , create Notification
            }, child: Text("show Notification"))
          ],
        ),
      )
    );
  }
}
