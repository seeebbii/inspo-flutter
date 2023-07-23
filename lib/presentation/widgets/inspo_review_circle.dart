import 'package:flutter/material.dart';

class InspoReviewCircle extends StatelessWidget {
  const InspoReviewCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.only(top: 10),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),
          ),
        );
  }
}
