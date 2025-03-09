import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;



class NotificationHelper {
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  static final StreamController<String?> selectNotificationStream =
  StreamController<String?>.broadcast();

  static const String _channelId = 'your_channel_id';
  static const String _channelName = 'Turn Digital'; // Updated channel name
  static const String _channelDescription = 'Your channel description';

  static Future<void> init() async {
    _initializeLocalNotifications();
    await _createNotificationChannel(); // Create notification channel
    tz.initializeTimeZones();
  }

  static void _initializeLocalNotifications() {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    const initializationSettings =
    InitializationSettings(android: androidSettings, iOS: iosSettings);

    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (response) {
        _handleTap(response.payload);
      },
    );
  }

  // Create notification channel for Android
  static Future<void> _createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: _channelDescription,
      importance: Importance.max,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  // Schedule notification with specific time
  SecduleNotificationAlarm(DateTime datetim, int Randomnumber) async {
    int newtime =
        datetim.millisecondsSinceEpoch - DateTime.now().millisecondsSinceEpoch;
    print(datetim.millisecondsSinceEpoch);
    print(DateTime.now().millisecondsSinceEpoch);
    print(newtime);
    await _flutterLocalNotificationsPlugin!.zonedSchedule(
        Randomnumber,
        'Alarm Event',
        "${DateFormat().format(DateTime.now())} ,Time Event",
        tz.TZDateTime.now(tz.local).add(Duration(hours: newtime)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'your channel id', 'your channel name',
                channelDescription: 'your channel description',
                // sound: RawResourceAndroidNotificationSound("alarm"),
                autoCancel: false,
                playSound: true,
                priority: Priority.max)),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);
  }

  // Schedule notification with specific DateTime
  static Future<void> scheduleNotificationAlarm(
      DateTime dateTime, int id) async {
    final scheduledDate = tz.TZDateTime.from(dateTime, tz.local);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      'Alarm',
      'Scheduled alarm at ${DateFormat('HH:mm').format(dateTime)}',
      scheduledDate,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription: _channelDescription,
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  // Convert time to TZDateTime
  static tz.TZDateTime _convertTime({required int hour, required int minutes}) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate =
    tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minutes);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  // Handle notification tap
  static void _handleTap(String? payload) async {
    if (payload == null) return;

    Map<String, dynamic> payloadMap = json.decode(payload);
    String typeRoute = payloadMap['type_route'] ?? '';

    switch (typeRoute) {
      case 'name bage':

        break;
      case 'openFile':

        break;
      default:
        debugPrint("No route defined for payload: $payload");
    }
  }

  // Show notification with big text
  static Future<void> showBigTextNotification(
      String title,
      String body,
      Object payload,
      ) async {
    var bigTextStyle = BigTextStyleInformation(
      body,
      contentTitle: title,
    );

    var androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      styleInformation: bigTextStyle,
      importance: Importance.max,
      priority: Priority.high,
    );

    final notificationDetails = NotificationDetails(android: androidDetails);
    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
      payload: jsonEncode(payload),
    );
  }




}