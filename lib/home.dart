import 'dart:async';

import 'package:alarm_app/shapes_painter.dart';
import 'package:alarm_app/widgets/alarm_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late String _timeString;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);

    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Container(
            padding: const EdgeInsets.only(top: 50),
            color: Theme.of(context).primaryColor,
            child: TabBar(
              controller: _tabController,
              indicatorColor: Theme.of(context).accentColor,
              indicatorWeight: 4.0,
              tabs: const [
                Tab(
                  icon: Icon(Icons.access_time),
                  text: 'Clock',
                ),
                Tab(icon: Icon(Icons.alarm), text: 'Alarm'),
                Tab(icon: Icon(Icons.hourglass_empty), text: 'Timer'),
                Tab(icon: Icon(Icons.timer), text: 'Stopwatch'),
              ],
            ),
          ),
        ),
        body: Container(
          color: Theme.of(context).primaryColor,
          child: TabBarView(
            controller: _tabController,
            children: [
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomPaint(
                        painter: ShapesPainter(),
                        child: Container(
                          height: 500,
                        ),
                      ),
                    ),
                    Text(
                      _timeString.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SourceSansPro'),
                    )
                  ],
                ),
              ),
              ListView(
                children:  <Widget>[
                  // alarmItem(),
                  // alarmItem(_timeString, true),
                  // alarmItem(_timeString, false),
                  alarmItem(_timeString, false),
                ],
              ),
              const Icon(Icons.hourglass_empty),
              const Icon(Icons.timer),
            ],
          ),
        ),
        floatingActionButton: _bottomButtons(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  FloatingActionButton? _bottomButtons() {
    return _tabController.index == 1
        ? FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, '/add-alarm'),
            backgroundColor: const Color(0xFF50A6D6),
            child: const Icon(
              Icons.add,
              size: 20.0,
            ),
          )
        : null;
  }
}
