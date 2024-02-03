import 'dart:convert';
import 'dart:developer';

import 'package:inspo/data/source/local/hive_database.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class LanguageNotifier extends ChangeNotifier {
  // final LanguageRepository languageRepository;
  // LanguageNotifier({required this.languageRepository});
  //
  // late LanguageModel? languageModel = LanguageModel();
  // late LanguageRecords selectedLanguage = LanguageRecords();
  //
  // Future<void> fetchLanguage() async {
  //   // Get the language from the local database
  //   if(HiveDatabase.appContentBox.get(HiveDatabase.languagesKey) != null){
  //     setupLanguageFlow();
  //   }
  //   var result = await languageRepository.fetchLanguage();
  //   result.fold((language) {
  //     languageModel = language;
  //     // Store the language in the local database
  //     HiveDatabase.appContentBox.put(HiveDatabase.languagesKey, languageModel);
  //
  //     setupLanguageFlow();
  //
  //   }, (failure) async {
  //     setupLanguageFlow();
  //   });
  // }
  //
  // void changeAppLanguageOnStartup(String languageCode){
  //   LanguageRecords startupLanguage = languageModel!.languageRecords!.firstWhere((element) => element.code == languageCode,);
  //   if(startupLanguage.code != null){
  //     Log.d("Startup language: ${startupLanguage.code}");
  //     selectedLanguage = startupLanguage;
  //     HiveDatabase.appContentBox.put(HiveDatabase.selectedLanguage, selectedLanguage);
  //     notifyListeners();
  //   }
  // }
  //
  // void changeLanguage(LanguageRecords language, {bool recallAppContent = true, BuildContext? context}) async {
  //   selectedLanguage = language;
  //   HiveDatabase.appContentBox.put(HiveDatabase.selectedLanguage, selectedLanguage);
  //   // Call change app language API
  //   var changeLanguageResult = await languageRepository.changeLanguage(languageCode: language.code ?? "en");
  //   if(changeLanguageResult.success != null){
  //     Log.d('Language changed response: ${changeLanguageResult.toJson()}');
  //   }
  //   // Store the language in the local database
  //   HiveDatabase.appContentBox.put(HiveDatabase.languagesKey, languageModel);
  //   notifyListeners();
  //
  //   // Calling the terms and about APIs again to get the new language
  //   if(recallAppContent){
  //     AppContentNotifier appContentNotifier = context!.read<AppContentNotifier>();
  //     appContentNotifier.fetchAppTerms(currentSelectedLangCode: selectedLanguage.code ?? "en");
  //     appContentNotifier.fetchAppAbout(currentSelectedLangCode: selectedLanguage.code ?? "en");
  //     appContentNotifier.fetchAppFaqs(currentSelectedLangCode: selectedLanguage.code ?? "en");
  //     appContentNotifier.fetchSupportSubjects(currentSelectedLangCode: selectedLanguage.code ?? "en");
  //   }
  //   // Re-fetching user notifications as the language has changed
  //   NotificationNotifier notificationNotifier = context!.read<NotificationNotifier>();
  //   notificationNotifier.fetchUserNotifications(context);
  // }
  //
  // void setupLanguageFlow() async {
  //   languageModel = HiveDatabase.appContentBox.get(HiveDatabase.languagesKey);
  //   // Check if the language is not empty
  //   if(languageModel?.languageRecords != null && languageModel!.languageRecords!.isNotEmpty){
  //     // Check if the user has already selected a language
  //     if(HiveDatabase.appContentBox.get(HiveDatabase.selectedLanguage) !=  null){
  //       // Get the selected language from the local database
  //       selectedLanguage = HiveDatabase.appContentBox.get(HiveDatabase.selectedLanguage);
  //       // Update the language with the server copy and save again in the local database
  //       selectedLanguage = languageModel!.languageRecords!.firstWhere((element) => element.code == selectedLanguage.code);
  //       HiveDatabase.appContentBox.put(HiveDatabase.selectedLanguage, selectedLanguage);
  //       notifyListeners();
  //     }else{
  //       // Select the first language from the server response
  //       selectedLanguage = languageModel!.languageRecords!.first;
  //       HiveDatabase.appContentBox.put(HiveDatabase.selectedLanguage, selectedLanguage);
  //       notifyListeners();
  //     }
  //   }else{
  //     // Initialize the language list from local app files in case its empty
  //     LanguageModel localFileLanguageModel = LanguageModel(languageRecords: []);
  //
  //     Map<dynamic, dynamic> localRecordsMap = {
  //       "dictionary": '',
  //       "code": "en",
  //       "name": "English",
  //       "direction": "ltr"
  //     };
  //
  //     // Adding English to the Records list
  //     Map<dynamic, dynamic> fallBackLanguageEnglish = await BaseHelper.readJsonFile('langs/en.json');
  //     localRecordsMap['dictionary'] = jsonEncode(fallBackLanguageEnglish);
  //     localFileLanguageModel.languageRecords!.add(LanguageRecords.fromJson(localRecordsMap));
  //     // Adding Arabic to the Records list
  //     Map<dynamic, dynamic> fallBackLanguageArabic = await BaseHelper.readJsonFile('langs/ar.json');
  //     localRecordsMap['dictionary'] = jsonEncode(fallBackLanguageArabic);
  //     localRecordsMap['code'] = 'ar';
  //     localRecordsMap['name'] = 'Arabic';
  //     localRecordsMap['direction'] = 'rtl';
  //     localFileLanguageModel.languageRecords!.add(LanguageRecords.fromJson(localRecordsMap));
  //
  //     // Replacing the local list with the notifier list
  //     languageModel = localFileLanguageModel;
  //     HiveDatabase.appContentBox.put(HiveDatabase.languagesKey, languageModel);
  //     notifyListeners();
  //
  //
  //     // Select the language from the local file
  //     LanguageRecords? prevLang = HiveDatabase.appContentBox.get(HiveDatabase.selectedLanguage);
  //     String? langCode = prevLang?.code ?? 'en';
  //     Map<dynamic, dynamic> fallbackLang = langCode == 'en' ? fallBackLanguageEnglish : fallBackLanguageArabic;
  //     fallbackLang = {
  //       "dictionary": jsonEncode(fallbackLang),
  //       "code": langCode,
  //       "name": langCode == 'en' ? "English" : "Arabic",
  //       "direction": langCode == 'en' ? "ltr" : "rtl"
  //     };
  //     LanguageRecords fallbackLanguage = LanguageRecords.fromJson(fallbackLang);
  //     changeLanguage(fallbackLanguage, recallAppContent: false);
  //   }
  // }
  //
  // TextDirection getDirectionality({String? direction = 'ltr'}){
  //   switch(direction){
  //     case 'ltr':
  //       return TextDirection.ltr;
  //     case 'rtl':
  //       return TextDirection.rtl;
  //     default:
  //       return TextDirection.ltr;
  //   }
  // }

}
