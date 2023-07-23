import 'package:clean_architecture_template/presentation/widgets/inspo_past_coverage_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InspoPastCoverageScreen extends StatelessWidget {
  const InspoPastCoverageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 16,left: 33,right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      GoRouter.of(context).refresh();
                    },
                    child: Container(
                      width: 38,
                      height: 28,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2
                          ),
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Icon(
                          Icons.arrow_back_sharp
                      ),
                    ),
                  ),
                  Text(
                    "PAST COVERAGE",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    width: 16,
                    height: 16,
                    child: Image.asset("assets/images/ic_filter.png"),
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context,builder){
                      return InspoPastCoverageItem();
                    }
                )
            )
          ],
        ),
      ),
    );
  }
}
