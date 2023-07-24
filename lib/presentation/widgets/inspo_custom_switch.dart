import 'package:flutter/material.dart';

class InspoSwitch extends StatefulWidget {
  const InspoSwitch({super.key, this.switchValue = false, this.onTap});

  final bool switchValue;
  final ValueChanged<bool>? onTap;

  @override
  State<InspoSwitch> createState() => _InspoSwitchState();
}

class _InspoSwitchState extends State<InspoSwitch> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.6,
      child: Switch(
        value: widget.switchValue,
        activeColor: Colors.white,
        inactiveThumbColor: Colors.black,
        activeTrackColor: Colors.black,
        trackOutlineColor: MaterialStateProperty.all(Colors.black),
        onChanged: widget.onTap,
      ),
    );
  }
}
