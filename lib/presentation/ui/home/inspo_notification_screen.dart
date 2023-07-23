import 'package:clean_architecture_template/presentation/widgets/inspo_button.dart';
import 'package:clean_architecture_template/presentation/widgets/inspo_notification_item.dart';
import 'package:flutter/material.dart';

class InspoNotificationScreen extends StatefulWidget {
  const InspoNotificationScreen({Key? key}) : super(key: key);

  @override
  State<InspoNotificationScreen> createState() => _InspoNotificationScreenState();
}

class _InspoNotificationScreenState extends State<InspoNotificationScreen> {

  final List<String> _filteredList  = [
    "APPROVED",
    "DENIED",
    "COVERED"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 7,right: 14),
            height: 30,
            width: MediaQuery.of(context).size.width,
            child: Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: _filteredList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return InspoButton(
                            width: 100,
                            height: 30,
                            marginLeft: 3,
                            marginTop: 6,
                            text: _filteredList[index],
                            buttonRadius: 12,
                            borderWidth: 2,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            buttonColor: Colors.white,
                            textColor: Colors.black,
                          );
                        }
                    ),
                  ),
                  Container(
                    width: 16,
                    height: 16,
                    child: Image.asset("assets/images/ic_filter.png"),
                  )
                ],
              ),
            ),
          ),
          Expanded( // Wrap ListView.builder with Expanded
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return InspoNotificationItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
