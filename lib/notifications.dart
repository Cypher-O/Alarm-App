import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AlarmNotifications extends StatelessWidget {
  AlarmNotifications({Key? key}) : super(key: key);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Android-specific initialization settings
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  // iOS-specific initialization settings
  final DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings(onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {
    print(
        "Received notification with id: $id, title: $title, body: $body, payload: $payload");
  });

  // Initialization settings for both Android and iOS
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  // Initialize the plugin with the initialization settings and set the onSelectNotification callback
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        String? payload = response.payload;
        print('Notification clicked with payload: $payload');
      });
}
