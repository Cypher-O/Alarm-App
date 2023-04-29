import 'dart:async';

import 'package:alarm/alarm.dart';
import 'package:alarm_app/widgets/alarm_item.dart';
import 'package:alarm_app/widgets/circle_day.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

bool isChecked = false;

class AddAlarm extends StatefulWidget {
  const AddAlarm({Key? key}) : super(key: key);

  _AddAlarmState createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  late TimeOfDay _selectedTime;
  late ValueChanged<TimeOfDay> selectTime;
  late String _ringtoneManagerPackageName;
  String _selectedSound = "";
  bool _vibrate = false;
  late List<bool> _daysOfWeek;
  List<Alarm> alarms = [];
  List<String> alarmsList = [];

  // final _soundKey = 'sound';
  // final _vibrateKey = 'vibrate';
  // final _daysKey = 'days';
  SharedPreferences? _prefs;
  
  @override
  void initState() {
    _selectedTime = const TimeOfDay(hour: 12, minute: 00);
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        // _prefs = prefs;
        // _loadData();
      });
    });
  }

  // Future<void> _loadData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final hour = prefs.getInt('hour') ?? 12;
  //   final minute = prefs.getInt('minute') ?? 0;
  //   _selectedTime = TimeOfDay(hour: hour, minute: minute);
  //   _daysOfWeek =
  //       prefs.getStringList('daysOfWeek')?.map((e) => e == 'true').toList() ??
  //           List.generate(7, (index) => false);
  //   _selectedSound = prefs.getString('selectedSound') ?? '';
  //   _vibrate = prefs.getBool('vibrate') ?? false;
  //   setState(() {});
  // }

  Future<void> _selectSound(BuildContext context) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result != null) {
      setState(() {
        _selectedSound = result.files.single.path!;
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('selectedSound', _selectedSound);
    }
  }

  // Future<void> _saveData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('selectedTime', _selectedTime.format(context));
  //   await prefs.setBool('monday', false /* TODO: replace with actual value */);
  //   await prefs.setBool('tuesday', false /* TODO: replace with actual value */);
  //   await prefs.setBool('wednesday', false /* TODO: replace with actual value */);
  //   await prefs.setBool('thursday', false /* TODO: replace with actual value */);
  //   await prefs.setBool('friday', false /* TODO: replace with actual value */);
  //   await prefs.setBool('saturday', false /* TODO: replace with actual value */);
  //   await prefs.setBool('sunday', false /* TODO: replace with actual value */);
  //   await prefs.setString('selectedSound', _selectedSound);
  //   await prefs.setBool('vibrate', _vibrate);
  // }

  // Future <void> _saveData() async {
  //   if (_prefs != null) {
  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('selectedTime', _selectedTime.format(context));
  //     await prefs.setBool('mon', CircleDay._daysOfWeek[0].isSelected);
  //     await prefs.setBool('tue', CircleDay._daysOfWeek[1].isSelected);
  //     await prefs.setBool('wed', CircleDay._daysOfWeek[2].isSelected);
  //     await prefs.setBool('thu', CircleDay._daysOfWeek[3].isSelected);
  //     await prefs.setBool('fri', CircleDay._daysOfWeek[4].isSelected);
  //     await prefs.setBool('sat', CircleDay._daysOfWeek[5].isSelected);
  //     await prefs.setBool('sun', CircleDay._daysOfWeek[6].isSelected);
  //     await prefs.setString('sound', _selectedSound);
  //     await prefs.setBool('vibrate', _vibrate);
  //   }
  // }

  // void _onTap() async {
  //   setState(() {
  //     isChecked = !isChecked;
  //     _daysOfWeek[dayOfWeek] = isChecked;
  //   });
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setStringList('daysOfWeek', _daysOfWeek.map((e) => e.toString()).toList());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000F1C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF000F1C),
        elevation: 40.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            Text(
              'ADD',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            SizedBox(width: 5),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 60.0,
              ),
              GestureDetector(
                child: Text(
                  _selectedTime.format(context),
                  style: const TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  _selectTime(context);
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    CircleDay('S', false),
                    CircleDay('M', false),
                    CircleDay('T', false),
                    CircleDay('W', false),
                    CircleDay('T', false),
                    CircleDay('F', false),
                    CircleDay(
                      'S',
                      false,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              SizedBox(
                height: 2.0,
                child: Container(
                  color: Colors.white30,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("i have been tapped");
                },
                child: ListTile(
                  leading: const Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  ),
                  title: const Text('Alarm Tone',
                      style: TextStyle(color: Colors.white)),
                  subtitle: Text(path.basename(_selectedSound),
                      style: const TextStyle(
                        color: Colors.white,
                      )),
                  trailing: IconButton(
                    icon: const Icon(Icons.music_note),
                    color: Colors.white,
                    onPressed: () => _selectSound(context),
                  ),
                ),
              ),
              SizedBox(
                height: 2.0,
                child: Container(
                  color: Colors.white30,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  setState(
                    () {
                      isChecked = !isChecked;
                      _vibrate = isChecked;
                    },
                  );
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('vibrate', _vibrate);
                  if (_vibrate) {
                    Vibration.vibrate();
                  }
                },
                child: ListTile(
                  leading: Icon(
                    isChecked ? Icons.check_box : Icons.check_box_outline_blank,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Vibrate',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 2.0,
                child: Container(
                  color: Colors.white30,
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  fixedSize: const Size(130, 45),
                  backgroundColor: Theme.of(context).accentColor,
                  padding: const EdgeInsets.all(10.0),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                  elevation: 8,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  // print(_saveData());
                  // _saveData();
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   // return alarmItem();
                  // }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Save"),
                    Icon(
                      Icons.save,
                      size: 17.0,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        backgroundColor: Colors.white,
        child: Icon(
          Icons.delete,
          size: 20.0,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _selectedTime);
    setState(() {
      _selectedTime = picked!;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('hour', _selectedTime.hour);
    await prefs.setInt('minute', _selectedTime.minute);
  }
}

class _daysOfWeek {
  String name;
  bool isSelected;

  _daysOfWeek({required this.name, this.isSelected = false});
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      // checkColor: isChecked ? const Color(0xFF50A6D6) : Colors.blue,
      // activeColor: isChecked ? Colors.green : Colors.blue,
      onChanged: (value) {
        setState(() {
          isChecked = value!;
          if (isChecked) {
            Vibration.vibrate(duration: 1000);
          }
        });
      },
    );
  }
}
