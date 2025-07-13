import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'MyLocalNotification.dart';

class NotificationUtilities {
  var mylocalnotification = Mylocalnotification();
  static Future<void> initialize() async {
    await AwesomeNotifications()
        .initialize("resource://drawable/icon_notification", [
          NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Basic Notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Colors.teal,
            ledColor: Colors.white,
            importance: NotificationImportance.High,
          ),
        ]);
  }

  static Future<void> createPlaneNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 4,
        channelKey: "basic_channel",
        title:
            "${Emojis.money_money_bag + Emojis.emotion_beating_heart} Bye some Food",
        body: "Floral at 123 Main st, has 2 in shamim",
        bigPicture: 'asset://images/food1.jpg',
        notificationLayout: NotificationLayout.BigPicture,
      ),
    );
  }

  static Future<void> createPlaneNotification_2() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();

    if (!isAllowed) {
      print("Notification permission not granted.");
      return; // Prevent from crashing
    }

    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        title: 'Plane mode activated',
        body: 'You are now in plane mode',
      ),
    );
  }
}
