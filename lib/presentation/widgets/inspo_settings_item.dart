import 'package:clean_architecture_template/presentation/widgets/inspo_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';

class InspoSettingsItem extends StatefulWidget {
  bool switchVisible = false;
  bool switchValue = false;
  String name = "";
  VoidCallback? onTap;
  InspoSettingsItem(
      {super.key, this.switchVisible = false, this.name = "", this.onTap});

  @override
  State<InspoSettingsItem> createState() => _InspoSettingsItemState();
}

class _InspoSettingsItemState extends State<InspoSettingsItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            border: Border.all(width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.name,
                  style: Dimensions.customTextStyle(
                    16,
                    FontWeight.w700,
                    Colors.black,
                  ),
                ),
              ),
              Visibility(
                visible: widget.switchVisible,
                child: InspoSwitch(
                  switchValue: widget.switchValue,
                  onTap: (value) {
                    setState(() {
                      widget.switchValue = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
