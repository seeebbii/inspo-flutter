import 'package:clean_architecture_template/presentation/widgets/concept/inspo_concept_home_review_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../notifiers/conceptCalendarScreen.notifier.dart';
import '../../../widgets/concept/inspo_concept_calendar_request_item_widget.dart';
import '../../../widgets/concept/inspo_concept_view_all_review_item_widget.dart';

class ConceptViewAllReviewsScreen extends StatelessWidget {
  const ConceptViewAllReviewsScreen({Key? key}) : super(key: key);

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
                  Text("ALL REVIEWS",
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
                                return InspoConceptViewAllReviewItemWidget();
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
