import 'package:flutter/material.dart';

class InspoReviewCircle extends StatelessWidget {

  double width;
  double borderWidth;
  double height;

  InspoReviewCircle({Key? key,required this.width,required this.height,required this.borderWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 2),
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: borderWidth,
        ),
      ),
    );
  }
}
