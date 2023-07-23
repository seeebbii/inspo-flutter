import 'package:flutter/material.dart';

class InspoPastCoverageItem extends StatelessWidget {
  const InspoPastCoverageItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 110,
          margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
          child: Image.asset("assets/images/sample2.png"),
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(
            "GOOD CUP",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700
            ),
          ),
        ),
      ],
    );
  }
}
