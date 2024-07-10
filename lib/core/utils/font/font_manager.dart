import 'dart:io';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/enums.dart';
import '../../constants/style.dart';
class FontManagerStyles {
 
  static double scaleFactorFunc() {
    double screenWidth = StoreGlobal().size.width;
    double screenHeight = StoreGlobal().size.height;

    double scaleFactor;

    // if(screenHeight>=700&&screenHeight<890){
    //   scaleFactor=1;
    // }else if(screenHeight<700){
    //   scaleFactor = screenHeight / (2 * screenWidth);
    // }else{
    //   //scaleFactor =  screenWidth/screenHeight;
    //
    //   scaleFactor = screenHeight / (2 * screenWidth);
    //
    // }
    // if(scaleFactor<0.6){
    //   scaleFactor=0.98;
    // }
    // //scaleFactor=screenHeight*0.0015;
    if (screenHeight >= 700 && screenHeight <= 900) {
      scaleFactor = 1;
    } else if (screenHeight > 500 && screenHeight < 700) {
      scaleFactor = 0.98;
    } else if (screenHeight <= 500) {
      scaleFactor = 1.01;
    } else if (screenHeight > 900 && screenHeight <= 1300) {
      scaleFactor = 1.02;
    } else if (screenHeight > 1300 && screenHeight < 1500) {
      scaleFactor = 0.58;
    } else if (screenHeight > 1400) {
      scaleFactor = 0.55;
    } else {
      scaleFactor = 1;
    }
    // if (kDebugMode) {
    //   print("${scaleFactor}/////////////${screenHeight}//////////////////");
    // }
    scaleFactor.toStringAsFixed(2);

    return scaleFactor.toDouble();
  }

  static double fontSize(double baseFontSize) {
    double scaleFactor = scaleFactorFunc();
    return baseFontSize * scaleFactor;
  }

  /// Fonts Family which will be used in whole app
  static const montserrat = 'Montserrat';

  /// ********************FONT SIZ|ES******************///
  static double scale = 5.sp * (StoreGlobal().textScaleOfDevice);

  /// defferent font size
  final appFontSize = {
    FontSize.small: fontSize(scale * 11 * 0.9),
    FontSize.medium: fontSize(scale * 11),
    FontSize.large: fontSize(scale * 11 * 1.3),
  };
  static double s7 = fontSize(7.5 * scale);
  static double s8 = fontSize(8 * scale);

  static double s9 = fontSize(9 * scale);

  static double s10 = fontSize(10 * scale);

  static double s10h = fontSize(10.5 * scale);
  
  static double s11 = fontSize(11 * scale);

  static double s12 = fontSize(12 * scale);

  static double s13 = fontSize(13 * scale);
  static double s14 = fontSize(14 * scale);
  static double s15 = fontSize(15 * scale);

  static double s16 = fontSize(16 * scale);

  static double s18 = fontSize(18 * scale);
  static double s20 = fontSize(20 * scale);

  static double s24 = fontSize(24 * scale);

  static double s30 = fontSize(30 * scale);

  static double s48 = fontSize(48 * scale);

  static double s88 = fontSize(88 * scale);

  /// *************************** Android && IOS Text Style**********************//
  /// ************The Main TextStyle in XO app***************************///
  static const TextStyle mainTextStyle = TextStyle(
    fontFamily: montserrat,
    decoration: TextDecoration.none,
    letterSpacing: 0,
    height: 1,
  );

  /// text style for title screen in android
  static TextStyle get androidTitleScreen => mainTextStyle.copyWith(
        fontSize: s14,
        fontWeight: FontWeight.w500,
      );

  /// text styles for empty content
  static TextStyle get emptyContent => mainTextStyle.copyWith(
      fontSize: s12, fontWeight: FontWeight.w500, height: 1.16);

  /// text styles for the tabs in android pages
  static TextStyle get tabControllerInMainScreen => mainTextStyle.copyWith(
      fontSize: s10, fontWeight: FontWeight.w400, height: 1.16);

  /// text styles for the text in buttons
  static TextStyle get btnText => mainTextStyle.copyWith(
      color: Colors.white,
      fontSize: s11, fontWeight: FontWeight.w500, height: 1.29);

  /// text styles for the text in small buttons
  static TextStyle get smallBtnText => mainTextStyle.copyWith(
      fontSize: s10, fontWeight: FontWeight.w500, height: 1.29);

  /// text styles for the text in search result
  static TextStyle get filterInSearch => mainTextStyle.copyWith(
      fontSize: s10, fontWeight: FontWeight.w400, height: 1.29);

  /// text styles for the chats name

  static TextStyle get nameChats => mainTextStyle.copyWith(
      fontSize: fontSize(StoreGlobal().textScaleOfDevice * 17.sp),
      fontWeight: FontWeight.lerp(FontWeight.w400, FontWeight.w500, 1),
      height: 1.29);

  /// text styles for last message in chat item

  static TextStyle get lastMessageInChatItem => mainTextStyle.copyWith(
      fontSize: Platform.isIOS == true ? s11 : fontSize(scale * 9),
      fontWeight: FontWeight.w500,
      height: 1.29);

  /// text styles for badge text in chat item

  static TextStyle get badgeText => mainTextStyle.copyWith(
      fontSize: Platform.isIOS == true ? s11 : s10,
      fontWeight: FontWeight.w400,
      height: 1.29);

  /// text styles for title name in chat

  static TextStyle get titleNameInChat => mainTextStyle.copyWith(
      fontSize: Platform.isIOS == true ? s12 : s11,
      fontWeight: FontWeight.w500,
      height: 1.29);

  /// text styles for status in chat
  static TextStyle get statusInChat => mainTextStyle.copyWith(
      fontSize: s8,
      fontWeight: Platform.isIOS == true ? FontWeight.w400 : FontWeight.w300,
      fontStyle: Platform.isIOS == true ? FontStyle.normal : FontStyle.italic,
      height: 1.29);

  /// text styles for text in more menu
  static TextStyle get itemsInMenuMore => mainTextStyle.copyWith(
      fontSize: s10, fontWeight: FontWeight.w400, height: 1.29);

  /// text styles for message text field
  static TextStyle get messageToSendTextField => mainTextStyle.copyWith(
      fontSize: s12, fontWeight: FontWeight.w400, height: 1.29);

  /// text styles for hint text
  static TextStyle get hintTextInTextField => mainTextStyle.copyWith(
      fontSize: s10, fontWeight: FontWeight.w400, height: 1.29);

  /// text styles for counter
  static TextStyle get counterText => mainTextStyle.copyWith(
      fontSize: s10, fontWeight: FontWeight.w400, height: 1.29);

  /// text styles for text controller
  static TextStyle get textInTextField => mainTextStyle.copyWith(
      fontSize: s11,
      fontWeight: FontWeight.w400,
      letterSpacing: -.05,
      height: 1.29);

  /// text styles for title text in listTile
  static TextStyle get titleInListTile => mainTextStyle.copyWith(
      fontSize: Platform.isIOS == true ? s12 : s11,
      fontWeight: Platform.isIOS == true ? FontWeight.w600 : FontWeight.w400,
      height: 1.29);

  /// text styles for title text in listTile
  static TextStyle get boldTitleInListTile => mainTextStyle.copyWith(
      fontSize: Platform.isIOS == true ? s13 : s12,
      fontWeight: FontWeight.w600,
      height: 1.29);

  /// text styles for sub title text in listTile
  static TextStyle get subtitleInListTile => mainTextStyle.copyWith(
      fontSize: Platform.isIOS == true ? s11 : s10,
      fontWeight: FontWeight.w300,
      height: 1.29);

  /// text styles for name in profile
  static TextStyle get nameInProfile => mainTextStyle.copyWith(
      fontSize: Platform.isIOS == true ? s14 : s12,
      fontWeight: Platform.isIOS == true ? FontWeight.w500 : FontWeight.w700,
      height: 1.29);

  /// text styles for status in profile
  static TextStyle get statusInProfile => mainTextStyle.copyWith(
      fontSize: Platform.isIOS == true ? s12 : s11,
      fontWeight: Platform.isIOS == true ? FontWeight.w500 : FontWeight.w400,
      height: 1.29);

  /// text styles for contact name
  static TextStyle get contactName => mainTextStyle.copyWith(
      fontSize: s11,
      fontWeight: Platform.isIOS == true ? FontWeight.w600 : FontWeight.w500,
      height: 1.29);

  /// text styles for phone number
  static TextStyle get phoneNum => mainTextStyle.copyWith(
      fontSize: s13, fontWeight: FontWeight.w400, height: 1.29);

  /// text styles for subHeaders
  static TextStyle get subHeaders => mainTextStyle.copyWith(
      fontSize: s11,
      fontWeight: Platform.isIOS == true ? FontWeight.w500 : FontWeight.w400,
      height: 1.29);

  /// text styles for message text
  static TextStyle get messageText => mainTextStyle.copyWith(
      fontSize: Platform.isIOS == true ? s12 : s11,
      fontWeight: FontWeight.lerp(FontWeight.w300, FontWeight.w400, 0.5),
      decorationThickness: 1);

  /// text styles for dialog title
  static TextStyle get dialogTitle => mainTextStyle.copyWith(
      fontSize: s14, fontWeight: FontWeight.w500, height: 1.29);

  /// options in dialog
  static TextStyle get optionInDialog => mainTextStyle.copyWith(
      fontSize: s10, fontWeight: FontWeight.w400, height: 1.29);

  /// date and time
  static TextStyle get dateAndTime => mainTextStyle.copyWith(
      fontSize: Platform.isIOS == false ? s10 : s12,
      fontWeight: FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.5));

  /// attachment name
  static TextStyle get attachmentName => mainTextStyle.copyWith(
      fontSize: s10, fontWeight: FontWeight.w400, height: 1.29);

  /// sender && receiver name
  static TextStyle get senderName => mainTextStyle.copyWith(
      fontSize: s11,
      fontWeight: FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.5),
      height: 1.29);

  ///  notes and stickHeaders
  static TextStyle get noteTexts => mainTextStyle.copyWith(
      fontSize: s9, fontWeight: FontWeight.w400, height: 1.29);

  /// just text style
  static TextStyle get justTextAndroid => mainTextStyle.copyWith(
      fontSize: s10, fontWeight: FontWeight.w500, height: 1.29);

  /// result of search actions
  static TextStyle get resultOfSearch => mainTextStyle.copyWith(
      fontSize: s18, fontWeight: FontWeight.w400, height: 1.16);

  ///confirm text
  static TextStyle get confirmTextAndroid => mainTextStyle.copyWith(
      fontSize: s10, fontWeight: FontWeight.w400, height: 1.29);

  ///number  text
  static TextStyle get numberText => mainTextStyle.copyWith(
      fontSize: Platform.isIOS == true ? s12 : s11,
      fontWeight: FontWeight.w400,
      height: 1.29);

  ///size Of Attachment text style
  static TextStyle get sizeOfAttachment => mainTextStyle.copyWith(
      fontSize: s9, fontWeight: FontWeight.w400, height: 1.29);

  ///Loading  text
  static TextStyle get loadingText => mainTextStyle.copyWith(
      fontSize: s10, fontWeight: FontWeight.w400, height: 1.29);

  /// description for something
  static TextStyle get description => mainTextStyle.copyWith(
      fontSize: s8, fontWeight: FontWeight.w400, height: 1.29);

  /// Body text in container
  static TextStyle get bodyTextInContainer => mainTextStyle.copyWith(
      fontSize: s10, fontWeight: FontWeight.w500, height: 1.29);

        static TextStyle get tasksMessagesFont => mainTextStyle.copyWith(
      fontSize: s10, fontWeight: FontWeight.w500, height: 1.29);


  /// task name  text
  static TextStyle get taskName => mainTextStyle.copyWith(
      fontSize: s14, fontWeight: FontWeight.w400, height: 1.29);

  /// ********************IOS Text Style*****************//
  ///  ios title screen
  static TextStyle get iOSTitleScreen => mainTextStyle.copyWith(
      fontWeight: FontWeight.w600, height: 1.29, fontSize: s20);

  /// text buttons in IOS
  static TextStyle get iosTextBtn => mainTextStyle.copyWith(
      fontSize: s12, fontWeight: FontWeight.w500, height: 1.29);

  /// slidable text icon
  static TextStyle get slideTextIcon => mainTextStyle.copyWith(
      fontSize: s9, fontWeight: FontWeight.w400, height: 1.29);

  /// tab bar items
  static TextStyle get tabBarText => mainTextStyle.copyWith(
      fontSize: s10, fontWeight: FontWeight.w500, height: 1.29);

  /// the items in bottom navigation bar
  static TextStyle get itemsInNavBar => mainTextStyle.copyWith(
      fontSize: s9, fontWeight: FontWeight.w500, height: 1.29);

  /// items in long press dialog
  static TextStyle get itemsInLongPressDialog => mainTextStyle.copyWith(
      fontSize: s13, fontWeight: FontWeight.w500, height: 1.29);

  /// just text in IOS
  static TextStyle get justTextIos => mainTextStyle.copyWith(
      fontSize: s11, fontWeight: FontWeight.w400, height: 1.29);

  ///   title of bottom sheet in ios
  static TextStyle get titleBottomSheet => mainTextStyle.copyWith(
      fontSize: s15, fontWeight: FontWeight.w600, height: 1.29);

  ///   ios input text field
  static TextStyle get inputTextFieldIos => mainTextStyle.copyWith(
      fontSize: s11, fontWeight: FontWeight.w500, height: 1.29);

  ///   big litters  like hint text
  static TextStyle get hintTextIos => mainTextStyle.copyWith(
      fontSize: s12, fontWeight: FontWeight.w400, height: 1.29);

  ///  status in calls
  static TextStyle get statusCall => mainTextStyle.copyWith(
      fontSize: s12, fontWeight: FontWeight.w400, height: 1.29);

  ///  confirm text ios

  static TextStyle get confirmTextIos => mainTextStyle.copyWith(
      fontSize: s11, fontWeight: FontWeight.w500, height: 1.29);
}
