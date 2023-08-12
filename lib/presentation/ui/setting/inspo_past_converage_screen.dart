import 'package:clean_architecture_template/presentation/widgets/inspo_past_coverage_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/dimensions.dart';

class InspoPastCoverageScreen extends StatelessWidget {
  const InspoPastCoverageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "PAST COVERAGE",
          style: Dimensions.customTextStyle(
            16,
            FontWeight.w600,
            Colors.black,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.5, top: 15, bottom: 15),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.arrow_back_sharp, size: 20),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 12.5),
              width: 16,
              height: 16,
              child: Image.asset("assets/images/ic_filter.png"),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return InspoPastCoverageItem(
                    times: index,
                  );
                }),
          )
        ],
      ),
    );
  }
}
