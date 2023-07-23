import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InspoSettingsItem extends StatefulWidget {
  bool switchVisible = false;
  bool switchValue = false;
  String name = "";
  VoidCallback? onTap;
  InspoSettingsItem({this.switchVisible = false,this.name = "",this.onTap});

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
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            border: Border.all(width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              Visibility(
                visible: widget.switchVisible,
                child: Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    value: widget.switchValue,
                    activeColor: Colors.black,
                    onChanged: (newValue) {
                      setState(() {
                        widget.switchValue = newValue;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
