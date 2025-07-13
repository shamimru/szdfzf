import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> createPlaneNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 4,
      channelKey: "basic_channel",
      title:
          "${Emojis.money_money_bag + Emojis.emotion_beating_heart} Bye some Food",
      body: "Floral at 123 Main st, has 2 in stock",
      notificationLayout: NotificationLayout.BigPicture
    ),
  );
}
