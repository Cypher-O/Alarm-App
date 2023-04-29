// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
class _daysOfWeek {
  String name;
  bool isSelected;

  _daysOfWeek({required this.name, this.isSelected = false});
}

class CircleDay extends StatefulWidget {
  final String day;
  final bool isActive;

  const CircleDay(this.day, this.isActive, {super.key});

  @override
  _CircleDayState createState() => _CircleDayState();
}

class _CircleDayState extends State<CircleDay> {
  bool _isEnabled = true;
  Color _color = Colors.transparent;

  @override
  void initState() {
    super.initState();
    if (widget.isActive) {
      _color = const Color(0xFF50A6D6);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isEnabled) {
          setState(() {
            // _color = Colors.green;
            _color = const Color(0xFF50A6D6);
            _isEnabled = false;
          });
        } else {
          setState(() {
            _color = Colors.transparent;
            _isEnabled = true;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          width: 40,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _color,
          ),
          child: Center(
            child: Text(
              widget.day,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
