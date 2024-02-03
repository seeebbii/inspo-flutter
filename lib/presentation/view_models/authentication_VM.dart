import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inspo/presentation/notifiers/language.notifier.dart';
import 'package:inspo/utils/base_helper.dart';
import 'package:inspo/utils/logger.dart';
import 'package:phone_number/phone_number.dart';
import 'package:provider/provider.dart';

enum AuthMethod { phone, email }

class AuthenticationScreenVM extends ChangeNotifier {
  var authenticationKey = GlobalKey<FormState>();

  // Fields Error Messages Map
  Map<dynamic, dynamic> fieldsErrorMessages = {
    'email': '',
    'email_valid': false,
    'fullName': '',
    'fullName_valid': false,
    'phone': '',
    'phone_valid': false,
    'oldPassword': '',
    'oldPassword_valid': false,
    'password': '',
    'password_valid': false,
    'rePassword': '',
    'rePassword_valid': false,
    'otp': '',
    'otp_valid': false,
    'invitationCode' : '',
    'invitationCode_valid' : false,
  };

  void changedField({required String key, dynamic value}) {
    fieldsErrorMessages[key] = value;
    notifyListeners();
  }

  void clearErrorFields({bool silent = false}) {
    fieldsErrorMessages['email'] = '';
    fieldsErrorMessages['email_valid'] = false;
    fieldsErrorMessages['fullName'] = '';
    fieldsErrorMessages['fullName_valid'] = false;
    fieldsErrorMessages['phone'] = '';
    fieldsErrorMessages['phone_valid'] = false;
    fieldsErrorMessages['oldPassword'] = '';
    fieldsErrorMessages['oldPassword_valid'] = false;
    fieldsErrorMessages['password'] = '';
    fieldsErrorMessages['password_valid'] = false;
    fieldsErrorMessages['rePassword'] = '';
    fieldsErrorMessages['rePassword_valid'] = false;
    fieldsErrorMessages['otp'] = '';
    fieldsErrorMessages['otp_valid'] = false;
    if (silent) return;
    notifyListeners();
  }

  bool editMode = false;

  void changeEditMode({bool silent = false, bool buttonDelay = true}) {
    // Set the busy state to true
    if(buttonDelay) stateBusy = true;
    editMode = !editMode;
    if (silent) return;
    notifyListeners();
    if(buttonDelay){
      Future.delayed(const Duration(milliseconds: 800), (){
        stateBusy = false;
        notifyListeners();
      });
    }
  }

  // Local Text Field Controllers for each field For manage Profile Edit Mode
  // Previous Values for each field
  TextEditingController manageProfileFullNameController =
      TextEditingController();
  TextEditingController manageProfilePhoneController = TextEditingController();
  TextEditingController manageProfileEmailController = TextEditingController();

  // Initial Values for each field
  void initializeManageProfileControllers() {
    manageProfileFullNameController.text = fullNameController.text.trim();
    manageProfilePhoneController.text = phoneController.text.trim();
    manageProfileEmailController.text = emailController.text.trim();
  }

  // Reset Values for each field
  void resetManageProfileControllers() {
    fullNameController.text = manageProfileFullNameController.text.trim();
    phoneController.text = manageProfilePhoneController.text.trim();
    emailController.text = manageProfileEmailController.text.trim();
  }

  late PhoneNumber currentPhoneNumber;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _instagramController = TextEditingController();
  final TextEditingController _tiktokController = TextEditingController();
  final TextEditingController _xController = TextEditingController();

  TextEditingController _otpController = TextEditingController();
  TextEditingController _linkInvitationCodeController = TextEditingController();

  TextEditingController get emailController => _emailController;

  TextEditingController get fullNameController => _fullNameController;

  TextEditingController get phoneController => _phoneController;

  TextEditingController get oldPasswordController => _oldPasswordController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get rePasswordController => _rePasswordController;

  TextEditingController get otpController => _otpController;

  TextEditingController get bioController => _bioController;


  TextEditingController get instagramController => _instagramController;

  TextEditingController get tiktokController => _tiktokController;

  TextEditingController get xController => _xController;

  // Focus Nodes
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _fullNameFocusNode = FocusNode();
  final FocusNode _middleNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _oldPasswordFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _rePasswordFocusNode = FocusNode();
  final FocusNode _otpFocusNode = FocusNode();

  // FOR CHANGING PASSWORD ONLY
  final FocusNode changePasswordOldPasswordFocusNode = FocusNode();
  final FocusNode changePasswordNewPasswordFocusNode = FocusNode();
  final FocusNode changePasswordRePasswordFocusNode = FocusNode();

  bool setupProfileCheckBoxValue = false;

  void changeSetupProfileCheckBoxValue(bool val){
    setupProfileCheckBoxValue = val;
    notifyListeners();
  }

  // ROLE 0 -> INFLUENCER
  // ROLE 1 -> CONCEPT

  int roleSelected = 0;

  void changeRoleSelected(int val){
    roleSelected = val;
    notifyListeners();
  }

  bool darkModeSwitchValue = false;

  void changeDarkModeSwitchValue(bool val){
    darkModeSwitchValue = val;
    notifyListeners();
  }

  bool notificationSwitchValue = false;

  void changeNotificationSwitchValue(bool val){
    notificationSwitchValue = val;
    notifyListeners();
  }

  // Getters for the Focus Nodes
  FocusNode get emailFocusNode => _emailFocusNode;

  FocusNode get fullNameFocusNode => _fullNameFocusNode;

  FocusNode get middleNameFocusNode => _middleNameFocusNode;

  FocusNode get lastNameFocusNode => _lastNameFocusNode;

  FocusNode get usernameFocusNode => _usernameFocusNode;

  FocusNode get phoneFocusNode => _phoneFocusNode;

  FocusNode get oldPasswordFocusNode => _oldPasswordFocusNode;

  FocusNode get passwordFocusNode => _passwordFocusNode;

  FocusNode get rePasswordFocusNode => _rePasswordFocusNode;

  FocusNode get otpFocusNode => _otpFocusNode;

  // Country Code Controller
  String phoneCountryCodeWithPlus = '+965';
  String phoneCountryCodeWithoutPlus = '965';
  bool stateBusy = false;

  bool _isOldPassVisible = true;
  bool _isPassVisible = true;
  bool _isRePassVisible = true;
  int _authMethodRadioValue = 1;
  int _genderRadioValue = 1;

  DateTime currentDob = DateTime.now();

  AuthMethod authMethod = AuthMethod.phone;

  void setOtpController(TextEditingController controller) {
    _otpController = controller;
    notifyListeners();
  }

  void resetOtpController() {
    _otpController.clear();
    notifyListeners();
  }

  bool get isOldPassVisible => _isOldPassVisible;

  bool get isPassVisible => _isPassVisible;

  bool get isRePassVisible => _isRePassVisible;

  int get authRadioValue => _authMethodRadioValue;

  int get genderRadioValue => _genderRadioValue;
  bool keepLoggedIn = true;

  // Availability Check Variables
  bool usernameCheckInProgress = false;
  bool usernameAvailable = false;

  bool phoneNumberCheckInProgress = false;
  bool phoneNumberAvailable = false;

  bool emailCheckInProgress = false;
  bool emailAvailable = true;

  int resendOtpSeconds = 90; // 1 minute 30 seconds in total
  Duration resendOtpDuration = const Duration(minutes: 1, seconds: 30);
  Timer? otpTimer;

// For Resending the OTP after 1 minute and 30 seconds
  void startTimer() {
    if (otpTimer != null) {
      otpTimer?.cancel();
      otpTimer = null;
    }
    resendOtpSeconds = 90;
    resendOtpDuration = const Duration(minutes: 1, seconds: 30);
    notifyListeners();
    const oneSec = Duration(seconds: 1);
    otpTimer = Timer.periodic(oneSec, (Timer timer) {
      if (resendOtpSeconds < 1) {
        otpTimer?.cancel();
        otpTimer = null;
      } else {
        // Decrementing the seconds from the duration of 1 minute and 30 seconds
        resendOtpDuration -= const Duration(seconds: 1);
        resendOtpSeconds -= 1;
        notifyListeners();
      }
    });
  }

  void stopTimer() {
    otpTimer?.cancel();
    otpTimer = null;
  }

  void setCountryCode(String str) {
    if (str.isEmpty || str == null) return;
    phoneCountryCodeWithPlus = str;
    // Remove the plus sign from the country code
    phoneCountryCodeWithoutPlus = str.substring(1);
    notifyListeners();
  }

  void setButtonBusyState(bool state) {
    stateBusy = state;
    notifyListeners();
  }

  void clearControllers() {
    _emailController.clear();
    _fullNameController.clear();
    _phoneController.clear();
    _oldPasswordController.clear();
    _passwordController.clear();
    _rePasswordController.clear();
  }

  void setControllersData(userModel){
    // log("SETTING CONTROLLERS DATA :${userModel.toJson()}");
    _emailController.text = userModel.emailAddress ?? "";
    _fullNameController.text = userModel.fullName ?? "";
    _phoneController.text = userModel.contactNumber ?? "";
    setCountryCode(userModel.contactCode ?? "+973");
  }

  void clearOTPController(){
    _otpController.clear();
    notifyListeners();
  }

  // void getCurrentCountryLocale() async {
  //   Locale? locale = await Devicelocale.currentAsLocale;
  //   debugPrint(locale?.countryCode);
  //   countryCodeStr = locale?.countryCode ?? "IQ";
  //   notifyListeners();
  // }

  void updateUsernameCheckInProgress(bool value) {
    usernameCheckInProgress = value;
    notifyListeners();
  }

  void updateUserNameAvailability(bool value) {
    usernameAvailable = value;
    notifyListeners();
  }

  void updatePhoneNumberCheckInProgress(bool value) {
    phoneNumberCheckInProgress = value;
    notifyListeners();
  }

  void updatePhoneNumberAvailability(bool value) {
    phoneNumberAvailable = value;
    notifyListeners();
  }

  void updateEmailCheckInProgress(bool value) {
    emailCheckInProgress = value;
    notifyListeners();
  }

  void updateEmailAvailability(bool value) {
    emailAvailable = value;
    notifyListeners();
  }

  void updateKeepLoggedIn(bool val) {
    keepLoggedIn = val;
    notifyListeners();
  }

  void setOldPassVisibility() {
    _isOldPassVisible = !_isOldPassVisible;
    notifyListeners();
  }

  void setPassVisibility() {
    _isPassVisible = !_isPassVisible;
    notifyListeners();
  }

  void setRePassVisibility() {
    _isRePassVisible = !_isRePassVisible;
    notifyListeners();
  }

  void changeMethod({required int value}) {
    _authMethodRadioValue = value;
    if (value == 1) {
      authMethod = AuthMethod.phone;
    } else {
      authMethod = AuthMethod.email;
    }
    notifyListeners();
  }

  void changeGender({required int value}) {
    _genderRadioValue = value;
    notifyListeners();
  }

  void resetValues() {
    _emailController.clear();
    _passwordController.clear();
    _rePasswordController.clear();
  }

  // void setPhoneNumber(PhoneNumber? str) {
  //   phoneNumberWithoutCountryCode = str?.number.toString() ?? "";
  //   countryCode = str?.countryCode.toString() ?? "";
  //   notifyListeners();
  // }

  Future<bool> validatePhoneNumber(
      String countryCode, String myPhoneNumber) async {
    try {
      PhoneNumberUtil phoneNumberUtil = PhoneNumberUtil();
      // Validate my phone number with country code
      PhoneNumber phoneNumber = await phoneNumberUtil.parse(
        countryCode + myPhoneNumber,
      );

      currentPhoneNumber = phoneNumber;
      // print("Phone number is valid: ${phoneNumber.toString()}");

      bool validated =
          await phoneNumberUtil.validate(phoneNumber.international);

      return validated;
    } catch (e) {
      Log.e('Failed to parse phone number: $e');
      return false;
    }
  }

  Future<void> extraPasswordValidations({
    required BuildContext context,
    bool focus = true,
  }) async {
    LanguageNotifier languageNotifier = Provider.of(context, listen: false);
    Map<dynamic, dynamic>? dictionary ;
    RegExp regex = RegExp(BaseHelper.strongPasswordRegExp);

    // Reg ex checks
    if (!regex.hasMatch(_passwordController.text.trim())) {
      fieldsErrorMessages['password_valid'] = false;
      fieldsErrorMessages['password'] = dictionary?['password_should_contain'] ?? '';
      notifyListeners(); //"Password should contain:";

      if (_passwordController.text.trim().length < 8) {
        fieldsErrorMessages['password'] = '${dictionary?['password_minimum_characters'] ?? ""}';
        fieldsErrorMessages['password_valid'] = false;
        if(focus) {
          changePasswordNewPasswordFocusNode.requestFocus();
        }
      }

      if (!RegExp(BaseHelper.passwordUppercaseRegExp)
          .hasMatch(_passwordController.text.trim())) {
        fieldsErrorMessages['password'] = fieldsErrorMessages['password'] +
                '\n' +
                dictionary?['password_uppercase_character'] ??
            ''; //"\n1 uppercase character";
        fieldsErrorMessages['password_valid'] = false;
        if(focus) {
          changePasswordNewPasswordFocusNode.requestFocus();
        }
      }
      if (!RegExp(BaseHelper.passwordLowercaseRegExp)
          .hasMatch(_passwordController.text.trim())) {
        fieldsErrorMessages['password'] = fieldsErrorMessages['password'] +
                '\n' +
                dictionary?['password_lowercase_character'] ??
            ''; //"\n1 lowercase character";
        fieldsErrorMessages['password_valid'] = false;
        if(focus) {
          changePasswordNewPasswordFocusNode.requestFocus();
        }
      }
      if (!RegExp(BaseHelper.passwordNumericRegExp)
          .hasMatch(_passwordController.text.trim())) {
        fieldsErrorMessages['password'] = fieldsErrorMessages['password'] +
                '\n' +
                dictionary?['password_numeric_character'] ??
            ''; //"\n1 numeric character";
        fieldsErrorMessages['password_valid'] = false;
        if(focus) {
          changePasswordNewPasswordFocusNode.requestFocus();
        }
      }
      if (!RegExp(BaseHelper.passwordSpecialRegExp)
          .hasMatch(_passwordController.text.trim())) {
        fieldsErrorMessages['password'] = fieldsErrorMessages['password'] +
                '\n' +
                dictionary?['password_special_character'] ??
            ''; //"\n1 special character";
        fieldsErrorMessages['password_valid'] = false;
        if(focus) {
          changePasswordNewPasswordFocusNode.requestFocus();
        }
      }
    } else {
      fieldsErrorMessages['password'] = '';
      fieldsErrorMessages['password_valid'] = true;
    }
    notifyListeners();
  }

  Future<void> validateFields({
    String? value,
    required final BuildContext context,
    final bool passwordValidation = false,
    bool isEmail = false,
    bool isFullName = false,
    bool isPhone = false,
    bool isOldPassword = false,
    bool isPassword = false,
    bool isRePassword = false,
    bool isOtp = false,
    bool isInvitationCode = false,
  }) async {
    LanguageNotifier languageNotifier = Provider.of(context, listen: false);
    Map<dynamic, dynamic>? dictionary ;
    // Switch Case For Error Messages

    switch (isInvitationCode) {
      case true:
        if (_linkInvitationCodeController.text.trim().isEmpty) {
          fieldsErrorMessages['invitationCode'] = dictionary?['invalid_code'] ?? '';
          fieldsErrorMessages['invitationCode_valid'] = false;
        } else if(_linkInvitationCodeController.text.trim().length < 5){
          fieldsErrorMessages['invitationCode'] = dictionary?['invalid_code'] ?? '';
          fieldsErrorMessages['invitationCode_valid'] = false;
        }
        else {
          fieldsErrorMessages['invitationCode'] = '';
          fieldsErrorMessages['invitationCode_valid'] = true;
        }
        break;
      default:
        break;
    }

    switch (isOtp) {
      case true:
        if (_otpController.text.trim().isEmpty) {
          fieldsErrorMessages['otp_valid'] = false;
        } else if (_otpController.text.trim().length < 4) {
          fieldsErrorMessages['otp_valid'] = false;
        } else {
          fieldsErrorMessages['otp_valid'] = true;
        }
        break;
      default:
        break;
    }

    switch (isOldPassword) {
      case true:
        if (_oldPasswordController.text.trim().isEmpty) {
          fieldsErrorMessages['oldPassword'] =
              '${dictionary?['password_should_contain_minimum'] ?? ""}';
          fieldsErrorMessages['oldPassword_valid'] = false;
          _oldPasswordFocusNode.requestFocus();
        } else {
          if (_oldPasswordController.text.trim().length < 8) {
            fieldsErrorMessages['oldPassword'] =
                '${dictionary?['password_short'] ?? ""}';
            fieldsErrorMessages['oldPassword_valid'] = false;
            _oldPasswordFocusNode.requestFocus();
          } else {
            fieldsErrorMessages['oldPassword'] = '';
            fieldsErrorMessages['oldPassword_valid'] = true;
          }
        }
        break;
      default:
        break;
    }

    switch (isRePassword) {
      case true:
        if (_rePasswordController.text.trim().isEmpty) {
          fieldsErrorMessages['rePassword'] =
              '${dictionary?['password_should_contain_minimum'] ?? ""}';
          fieldsErrorMessages['rePassword_valid'] = false;
          if (passwordValidation) {
            changePasswordRePasswordFocusNode.requestFocus();
          } else {
            rePasswordFocusNode.requestFocus();
          }
        } else if (_rePasswordController.text.trim() !=
            _passwordController.text.trim()) {
          fieldsErrorMessages['rePassword'] =
              '${dictionary?['passwords_dont_match'] ?? ""}';
          fieldsErrorMessages['rePassword_valid'] = false;
          if (passwordValidation) {
            changePasswordRePasswordFocusNode.requestFocus();
          } else {
            rePasswordFocusNode.requestFocus();
          }
        } else {
          fieldsErrorMessages['rePassword'] = '';
          fieldsErrorMessages['rePassword_valid'] = true;
        }
        break;
      default:
        break;
    }

    switch (isPassword) {
      case true:
        if (_passwordController.text.trim().isEmpty) {
          fieldsErrorMessages['password'] =
              '${dictionary?['password_should_contain_minimum'] ?? ""}';
          fieldsErrorMessages['password_valid'] = false;
          passwordFocusNode.requestFocus();

        } else {
          if (_passwordController.text.trim().length < 8) {
            fieldsErrorMessages['password'] =
                '${dictionary?['password_short'] ?? ""}';
            fieldsErrorMessages['password_valid'] = false;
            passwordFocusNode.requestFocus();
          } else {
            fieldsErrorMessages['password'] = '';
            fieldsErrorMessages['password_valid'] = true;
          }
        }
        break;
      default:
        break;
    }

    switch (isEmail) {
      case true:
        if (_emailController.text.trim().isEmpty) {
          fieldsErrorMessages['email'] =
              '${dictionary?['email_is_required'] ?? ""}';
          fieldsErrorMessages['email_valid'] = false;
          emailFocusNode.requestFocus();
        } else if (!RegExp(BaseHelper.emailAddressRegExp)
            .hasMatch(_emailController.text.trim())) {
          fieldsErrorMessages['email'] =
              '${dictionary?['invalid_email'] ?? ""}';
          fieldsErrorMessages['email_valid'] = false;
          emailFocusNode.requestFocus();
        } else {
          fieldsErrorMessages['email'] = '';
          fieldsErrorMessages['email_valid'] = true;
        }
        break;
      default:
        break;
    }

    switch (isFullName) {
      case true:
        if (_fullNameController.text.trim().isEmpty) {
          fieldsErrorMessages['fullName'] =
              '${dictionary?['full_name_required'] ?? ""}';
          fieldsErrorMessages['fullName_valid'] = false;
          fullNameFocusNode.requestFocus();
        } else {
          if (_fullNameController.text.trim().contains(' ') == false) {
            fieldsErrorMessages['fullName'] =
                '${dictionary?['please_enter_first_surname'] ?? ""}';
            fieldsErrorMessages['fullName_valid'] = false;
            fullNameFocusNode.requestFocus();
            break;
          }
          if (_fullNameController.text.trim().length < 8) {
            fieldsErrorMessages['fullName'] =
                '${dictionary?['please_enter_first_surname'] ?? ""}';
            fieldsErrorMessages['fullName_valid'] = false;
            fullNameFocusNode.requestFocus();
            break;
          }
          fieldsErrorMessages['fullName'] = '';
          fieldsErrorMessages['fullName_valid'] = true;
        }
        break;
      default:
        break;
    }

    switch (isPhone) {
      case true:
        bool isPhoneValid = await validatePhoneNumber(
            phoneCountryCodeWithPlus, _phoneController.text.trim());
        if (_phoneController.text.trim().isEmpty) {
          fieldsErrorMessages['phone'] =
              '${dictionary?['phone_number_required'] ?? ""}';
          fieldsErrorMessages['phone_valid'] = false;
          phoneFocusNode.requestFocus();
        } else if (isPhoneValid != true) {
          fieldsErrorMessages['phone'] =
              '${dictionary?['invalid_phone_number'] ?? ""}';
          fieldsErrorMessages['phone_valid'] = false;
          phoneFocusNode.requestFocus();
        } else {
          fieldsErrorMessages['phone'] = '';
          fieldsErrorMessages['phone_valid'] = true;
        }
        break;
      default:
        break;
    }

    // Log.i(fieldsErrorMessages);
    notifyListeners();
  }

// void setTextFieldsForEditProfile(AuthModel auth) {
//   usernameAvailable = true;
//
//   _emailController.text.trim() = auth.data?.user?.email ?? "";
//   _nameController.text.trim() = auth.data?.user?.fullName ?? "";
//   _usernameController.text.trim() = auth.data?.user?.username ?? "";
//   // To check if the username is changed aur not
//   oldUsername = auth.data?.user?.username ?? "";
//
//   _phoneController.text.trim() = auth.data?.user?.phoneNumber ?? "";
//   _bioController.text.trim() = auth.data?.user?.description ?? "";
//   _websiteController.text.trim() = auth.data?.user?.website ?? "";
//   _dobController.text.trim() = auth.data?.user?.dob ?? "";
//   _genderRadioValue = auth.data!.user!.gender == "Male" ? 1 : 2;
// }
}
