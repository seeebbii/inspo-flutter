import 'package:clean_architecture_template/presentation/widgets/concept/inspo_concept_calendar_request_item_widget.dart';
import 'package:clean_architecture_template/presentation/widgets/concept/inspo_concept_home_request_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../notifiers/conceptCalendarScreen.notifier.dart';

class ConceptCalendarScreen extends StatelessWidget {
  const ConceptCalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ConceptCalendarScreenNotifier>(
          builder: (context, model, builder) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text("ALL REQUESTS",
                  style: TextStyle(
                      fontFamily: "assets/fonts/Halvetica.ttf",
                      fontWeight: FontWeight.w700,
                      fontSize: 16)),
              SizedBox(height: 6),
              Expanded(
                child: Consumer<ConceptCalendarScreenNotifier>(
                    builder: (context, model, builder) {
                  return ListView.builder(
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InspoConceptHomeRequestItemWidget(),
                            SizedBox(height: 8,)
                          ],
                        );
                      });
                }),
              )
            ],
          ),
        );
      }),
    );
  }
}
