import 'package:clean_architecture_template/presentation/widgets/inspo_button.dart';
import 'package:clean_architecture_template/presentation/widgets/inspo_notification_item.dart';
import 'package:flutter/material.dart';

class InspoNotificationScreen extends StatefulWidget {
  const InspoNotificationScreen({Key? key}) : super(key: key);

  @override
  State<InspoNotificationScreen> createState() =>
      _InspoNotificationScreenState();
}

class _InspoNotificationScreenState extends State<InspoNotificationScreen> {
  final List<String> _filteredList = ["APPROVED", "DENIED", "COVERED"];
  String _selectedFilter = "APPROVED";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            SizedBox(
              height: 25,
              width: MediaQuery.of(context).size.width,
              child: Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: _filteredList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InspoButton(
                              width: 100,
                              height: 30,
                              marginLeft: 3,
                              text: _filteredList[index],
                              buttonRadius: 12,
                              borderWidth: 2,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              buttonColor:
                                  _selectedFilter == _filteredList[index]
                                      ? Colors.black
                                      : Colors.white,
                              textColor: _selectedFilter == _filteredList[index]
                                  ? Colors.white
                                  : Colors.black,
                              onPressed: () {
                                setState(() {
                                  _selectedFilter = _filteredList[index];
                                });
                              },
                            );
                          }),
                    ),
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: Image.asset("assets/images/ic_filter.png"),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              // Wrap ListView.builder with Expanded
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return const InspoNotificationItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
