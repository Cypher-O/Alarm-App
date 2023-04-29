// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:package_info/package_info.dart';
//
// class RingtoneManagerScreen extends StatefulWidget {
//   @override
//   _RingtoneManagerScreenState createState() => _RingtoneManagerScreenState();
// }
//
// class _RingtoneManagerScreenState extends State<RingtoneManagerScreen> {
//   late String _ringtoneManagerPackageName;
//
//   @override
//   void initState() {
//     super.initState();
//     _getRingtoneManagerPackageName();
//   }
//
//   Future<void> _getRingtoneManagerPackageName() async {
//     try {
//       PackageInfo packageInfo = await PackageInfo.fromPlatform();
//       String packageName ="";
//       if (Theme.of(context).platform == TargetPlatform.android) {
//         // Use the Android package name of the default alarm ringtone manager app
//         packageName = 'com.android.deskclock';
//       } else if (Theme.of(context).platform == TargetPlatform.iOS) {
//         // Use the iOS URL scheme of the default alarm ringtone manager app
//         packageName = 'clock://';
//       }
//       setState(() {
//         _ringtoneManagerPackageName = packageName;
//       });
//     } catch (e) {
//       print('Failed to get package name of ringtone manager app: $e');
//     }
//   }
//
//   void _openRingtoneManager() async {
//     if (_ringtoneManagerPackageName != null) {
//       if (await canLaunch(_ringtoneManagerPackageName)) {
//         await launch(_ringtoneManagerPackageName);
//       } else {
//         print('Failed to launch $_ringtoneManagerPackageName');
//       }
//     } else {
//       print('Failed to open ringtone manager: package name is null');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: Text('Ringtone Manager'),
//   //     ),
//   //     body: Center(
//   //       child: ElevatedButton(
//   //         onPressed: _openRingtoneManager,
//   //         child: Text('Open Ringtone Manager'),
//   //       ),
//   //     ),
//   //   );
//
// }
