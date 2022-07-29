import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mutex/mutex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:starter_application/core/common/local_storage.dart';

/// foreground means open but not focused
/// Background means the app is killed
/// Focused means the app is currently open
class FireBaseMessagingWrapper {
  static final _instance = FireBaseMessagingWrapper._singelton();
  factory FireBaseMessagingWrapper() => _instance;
  FireBaseMessagingWrapper._singelton();

  // fields
  static final notificationLock = Mutex();
  late final Future<void> Function() _onRefreshToken;
  final _fcm = FirebaseMessaging.instance;
  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  int _counter = 0;

  /// Init firebase messaging and AwesomeNotifications
  ///
  /// [onRefreshToken]: Send to the server new token.
  Future<void> init({required Future<void> Function() onRefreshToken}) async {
    this._onRefreshToken = onRefreshToken;
    await _initFirebaseMessaging();
    await _initLocalNotfications();
  }

  /// If the app is on the backgroung/killed then  Firebase messages are pushed automatically from the FCM SDK
  /// If the app is on the forground (the app is open but not on the screen) then  Firebase messages  are pushed automatically from the FCM SDK
  Future<void> _initFirebaseMessaging() async {
    /// Get firebase token
    await _getFirebaseToken();

    /// Listen to token change
    await _onTokenRefresh();

    /// Called when app has focus
    /// Not called when app in foreground or background/killed
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    /// Called when app in foreground
    /// Not Called when app in background/Killed
    FirebaseMessaging.onMessageOpenedApp
        .listen((message) => _onMessageTap(message: message));

    // Called when app in background.
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);

    /// Called when user click message while app is in backgroun/killed
    _handleBackgrounMessageClicked();
  }

  Future<void> _initLocalNotfications() async {
    const android = AndroidInitializationSettings('background');
    const iOS = IOSInitializationSettings();
    const initSettings = InitializationSettings(android: android, iOS: iOS);

    bool? success = await _flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onSelectNotification: (payload) =>
          _onMessageTap(localNotification: payload),
    );

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    final channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    if (success ?? false)
      print("flutterLocalNotification initialized successfully");
  }

  // Token logic (get, refresh, delete).
  Future<void> _getFirebaseToken() async {
    try {
      await _fcm.getToken().then((token) async {
        print("firebase token: $token");
        if (token != null) {
          if (await LocalStorage.hasFcmToken) {
            await LocalStorage.persistOldFcmToken(
                (await LocalStorage.fcmToken)!);
          }
          await LocalStorage.persistFcmToken(token);
        }
      });
    } catch (_) {
      print("Error: Couldn't get firebase token");
    }
  }

  Future<void> _onTokenRefresh() async {
    await _fcm.onTokenRefresh.listen((newToken) async {
      print("New FCM Token Generated: ${newToken}");
      await LocalStorage.persistOldFcmToken((await LocalStorage.fcmToken)!);
      await LocalStorage.persistFcmToken(newToken);

      /// Send new fcm token to the sever
      if (await LocalStorage.hasToken) await _onRefreshToken.call();
    });
  }

  Future<void> deleteFirebaseToken() async {
    //Todo delete token logic (If token is deleted like this, firebase don't genrate new token when we need it)
    // try {
    // await _fcm.deleteToken();

    // } catch (e) {
    // }
  }

  // Listen Methods.
  void _handleForegroundMessage(RemoteMessage message) {
    print("message recieved");

    // Todo: add unseenNotifications to show it as a badget.
    // if (AppConfig().appContext != null) {
    //   AppConfig()
    //       .appContext!
    //       .read<HomeScreenNotifier>()
    //       .unseenNotifications += 1;
    // }
    _pushLocalNotification(message);
  }

  // Local notification logic.
  void _pushLocalNotification(RemoteMessage message) {
    const androidNotificationDetails = AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      channelDescription: 'This channel is used for important notifications.',
      importance: Importance.high,
      priority: Priority.high,
      styleInformation: BigTextStyleInformation(''),
      color: Colors.white,
    );
    const iosNotificationDetails = IOSNotificationDetails();

    const notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );

    _flutterLocalNotificationsPlugin.show(
      _counter++,
      message.notification?.title ?? '',
      message.notification?.body ?? '',
      notificationDetails,
      payload: json.encode(message.data),
    );
  }

  // On Notification Messages Tap Methods.
  Future<void> _onMessageTap(
      {RemoteMessage? message, String? localNotification}) async {
    /// This will lock the execution until main app screen is opened
    await notificationLock.acquire();

    assert((message == null) ^ (localNotification == null),
        "(message == null) ^ (localNotification == null)");

    if (message != null) {
      print('Message handled by FCM');

      _handleNavigation(message.data);
    } else if (localNotification != null) {
      print('Message handled by localNotifications');

      _handleNavigation(json.decode(localNotification));
    }
    notificationLock.release();
  }

  Future<void> _handleBackgrounMessageClicked() async {
    final message = await _fcm.getInitialMessage();
    if (message != null) _onMessageTap(message: message);
  }

  // Navigation method when tap on notification message.
  void _handleNavigation(Map<String, dynamic>? data) {
    print(data);

    if (data != null) {}
  }
}

Future<void> _handleBackgroundMessage(RemoteMessage message) async {
  // print(message);
  try {
    final dir = await getTemporaryDirectory();
    File temp = await File("${dir.path}/temp.txt").create();
    int? backgroundNotifiCount = int.tryParse(await temp.readAsString());
    if (backgroundNotifiCount == null) {
      temp.writeAsString("1");
    } else {
      temp.writeAsString((backgroundNotifiCount + 1).toString());
    }
  } catch (e) {
    print(e);
  }
}
