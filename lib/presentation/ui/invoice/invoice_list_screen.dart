import 'package:clean_architecture_template/config/router/app_router.dart';
import 'package:clean_architecture_template/utils/extensions/context.extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/dimensions.dart';
import '../../widgets/app_simple_text_field.dart';
import '../../widgets/concept/concept_invoice_item_widget.dart';
import '../../widgets/concept/inspo_concept_view_all_review_item_widget.dart';
import '../../widgets/inspo_button.dart';

class InspoInvoiceListScreen extends StatelessWidget {
  InspoInvoiceListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "INVOICE",
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 21),
            Expanded(
              child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return ConceptInvoiceItemWidget(
                      onTap: (){
                        context.push(AppRouter.invoiceDetailsScreen);
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
