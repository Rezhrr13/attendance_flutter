import 'package:attendancce/shared/theme_style.dart';
import 'package:attendancce/ui/pages/Home/history_menu.dart';
import 'package:attendancce/ui/pages/Home/live_attendance.dart';
import 'package:attendancce/ui/pages/Home/notifications_menu.dart';
import 'package:attendancce/ui/pages/Home/main_page.dart';
import 'package:attendancce/ui/pages/login_account.dart';
import 'package:attendancce/ui/pages/parent_data.dart';
import 'package:attendancce/ui/pages/personal_data.dart';
import 'package:attendancce/ui/pages/profile_menu.dart';
import 'package:attendancce/ui/pages/Onboard/register_menu.dart';
import 'package:attendancce/ui/pages/Home/request_attendance.dart';
import 'package:attendancce/ui/pages/Home/home_menu.dart';
import 'package:attendancce/ui/pages/Onboard/on_boarding.dart';
import 'package:attendancce/ui/pages/Onboard/signin_menu.dart';
import 'package:attendancce/ui/pages/Onboard/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cron/cron.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AwesomeNotifications().initialize(null, // icon for your app notification
      [
        NotificationChannel(
            channelKey: 'key1',
            channelName: 'Proto Coders Point',
            channelDescription: "Notification example",
            defaultColor: const Color(0XFF9050DD),
            ledColor: Colors.white,
            playSound: true,
            enableLights: true,
            enableVibration: true)
      ]);
  final cron = Cron();
  cron.schedule(Schedule.parse('1 8 * * *'), () async {
    print('clock in');
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'key1',
            title: 'Reminder',
            body:
                'You haven`t clock in today, please clock in now. Don`t forget ! have a nice day'));
  });
  cron.schedule(Schedule.parse('1 15 * * *'), () async {
    print('clock out');
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'key1',
            title: 'Reminder',
            body:
                'You haven`t Clock Out today, please clock in now. Don`t forget ! have a nice day'));
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: bgNeutral,
        appBarTheme: AppBarTheme(
            backgroundColor: bgNeutral,
            elevation: 0,
            centerTitle: false,
            iconTheme: IconThemeData(
              color: icLight,
            ),
            titleTextStyle: primaryText.copyWith(
              fontSize: 16,
              fontWeight: semibold,
            )),
      ),
      routes: {
        ///ONBOARD
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnBoarding(),
        '/signin': (context) => const SignIn(),
        '/register': (context) => const Register(),

        ///HOME
        '/home': (context) => const Home(),
        '/reqAttendance': (context) => const RequestAttendance(),
        '/notification': (context) => const Notifications(),
        '/LiveAttendance': (context) => const LiveAttendance(),
        '/history': (context) => const HistoryMenu(),

        ///PROFILE
        '/Profile': (context) => const Profile(),
        '/Personal': (context) => const Personaldata(),
        '/Parent': (context) => const ParentDate(),
        '/LoginAcc': (context) => const LoginAccount(),

        //NAVIGATION BOTTOM
        '/Nav': (context) => const MainPage(),
      },
    );
  }
}
