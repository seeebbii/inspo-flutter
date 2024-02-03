import 'package:flutter/material.dart';
import 'package:inspo/presentation/ui/root/dashboard/widgets/choice_list_tile.widget.dart';
import 'package:inspo/presentation/widgets/app_appbar.dart';
import 'package:inspo/utils/dimensions.dart';

class DashboardRootScreen extends StatefulWidget {
  const DashboardRootScreen({super.key});

  @override
  State<DashboardRootScreen> createState() => _DashboardRootScreenState();
}

class _DashboardRootScreenState extends State<DashboardRootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        showAction: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimensions.tinyVerticalSpaces),
        child: ListView.builder(
          itemCount: 15,
            itemBuilder: (_, index){
              return const ChoiceListTile();
            }
        ),
      ),
    );
  }

}
