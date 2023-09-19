import 'package:flutter/material.dart';

class InspoConceptPaymentBottomSheet extends StatelessWidget {

  InspoConceptPaymentBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      width: double.infinity,
      height: double.infinity,
      color: Colors.amber,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 20),
          ),
          Expanded(
            child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 20),
          ),)
        ],
      ),
    );
  }
}
