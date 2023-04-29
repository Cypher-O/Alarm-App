import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// dynamic hour, enabled;
// class alarmItemClass extends StatelessWidget {
//   const alarmItemClass({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return alarmItem();
//   }
// }

Widget alarmItem(hour, enabled) {
  return Padding(
    padding: const EdgeInsets.all(17.0),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  hour,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceSansPro'),
                ),
                Row(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        'Sun',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        'Mon',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        'Tue',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const MyWidget()
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          height: 1.0,
          width: double.maxFinite,
          child: Container(
            color: Colors.white30,
          ),
        )
      ],
    ),
  );
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: switchValue,
      onChanged: (bool value) {
        setState(() {
          switchValue = value;
        });
        // print(value);
      },
      activeColor: const Color(0xFF50A6D6),
    );
  }
}
