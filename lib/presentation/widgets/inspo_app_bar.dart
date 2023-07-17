import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InspoAppBar extends StatelessWidget {
  const InspoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 22,
                margin: EdgeInsets.only(left: 27,top: 15),
                child: Text(
                  "INSPO",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900
                  ),
                ),
              ),
              Row(
                children: [

                ],
              )
            ],
          ),
          Divider(
            height: 20,
            thickness: 3,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
