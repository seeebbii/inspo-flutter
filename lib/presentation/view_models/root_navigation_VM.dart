import 'package:flutter/cupertino.dart';
import 'package:inspo/presentation/ui/root/calendar/calendar.root.screen.dart';
import 'package:inspo/presentation/ui/root/dashboard/dashboard.root.screen.dart';
import 'package:inspo/presentation/ui/root/settings/settings.root.screen.dart';

class RootNavigationVM extends ChangeNotifier {

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final PageController _pageController = PageController(initialPage: 0, keepPage: true);
  PageController get pageController => _pageController;

  void animateToPage(int index) {
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  void onPageChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  List<Widget> screens = [
    const DashboardRootScreen(),
    const CalendarRootScreen(),
    const SettingsRootScreen(),
  ];

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

}