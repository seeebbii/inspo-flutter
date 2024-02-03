import 'package:flutter/material.dart';
import 'package:inspo/presentation/widgets/app_appbar.dart';

class CalendarRootScreen extends StatefulWidget {
  const CalendarRootScreen({super.key});

  @override
  State<CalendarRootScreen> createState() => _CalendarRootScreenState();
}

class _CalendarRootScreenState extends State<CalendarRootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        showAction: true,
      ),
    );
  }

}
