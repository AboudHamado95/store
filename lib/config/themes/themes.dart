import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:store_app/config/themes/color_utils.dart';

import '../../core/constants/style.dart';
import '../../core/utils/font/font_manager.dart';
import '../../core/utils/hex_color.dart';

enum ThemeType {
  xoLight('Light Theme'),
  xoDark('Dark Theme'),
  systemMode('Use System Theme');

  final String name;

  const ThemeType(this.name);
}

final appThemeData = {
  ThemeType.xoLight: AppTheme(
    isDark: false,
    xoRedColor: const Color(0xffE10000),
    redColor: const Color(0xffEE3142),
    taskBottomSheetIconsColor: const Color.fromRGBO(238, 250, 203, 1),
    newTaskDesignColor: const Color(0xffe5edc9),
    greyTaskDeadline: const Color.fromRGBO(101, 101, 101, 1),
    redBadge: const Color(0xffDD2025),
    red: const Color(0xFFD60F0F),
    error: Colors.red.shade900,
    newPrimeColor: const Color(0xFF1097D1),
    hintCircleInAzListView: const Color(0xFF1097D1), // dark : white
    primeColorOfButtonTask: const Color(0xFF1097D1), // dark : green1
    badgeColorInChatItem: const Color(0xFF1097D1), // dark : green2
    buttonsInTask: const Color(0xFF1097D1), // dark : green3
    sendFloatingButton: const Color(0xFF1097D1), // dark : black
    fontColorBlack: const Color(0xFF000000),
    txt: Colors.black,
    blackWhiteColor: Colors.black, // dark : white
    contactDialogGrad2: const Color.fromRGBO(0, 0, 0, 0.32),
    contactDialogGrad3: const Color.fromRGBO(0, 0, 0, 0.5),
    contactDialogGrad1: const Color.fromRGBO(0, 0, 0, 0),
    colorUpdateDialog: const Color.fromRGBO(34, 34, 34, 0.94),
    blackGreyColor: Colors.black,
    basicButtonsToCreateChatOrTask: Colors.black,
    appBarBackGroundChatInfo: Colors.black,
    greyStrong: const Color(0xff151918),
    attachmentProgressBackground: const Color.fromRGBO(0, 0, 0, 0.35),
    deepGrey: const Color(0xff5f5f5f), // dark : white
    fontColorDarkGrey: const Color(0xFF686060),
    fontColorBlackWithOpacity: const Color(0xFF494949),
    popUpMenu: const Color(0xff3A3A3A),
    greyWeak: const Color(0xff909f9c),
    grey: const Color(0xff515d5a),
    fontColorDarkGrey1: const Color(0xFF9A9A9A),
    fontColorWhite: const Color(0xFFFFFFFF),
    fontColorLiteGrey: const Color(0xFFCBCFD3),
    fontColorGrey: const Color(0xFFBCBCBC),
    calendarCell: const Color(0xFFEFEFEF),
    backGroundButton: const Color(0xFFC6C6C6),
    accentTxt: Colors.white,
    bg1: const Color(0xfff1f7f0),
    textFieldGreyColor: const Color(0xffE6E6E6),
    scaffoldBackground: Colors.white,
    accent1: HexColor('#6C47FF'),
    accent1Darker: const Color(0xff006b5a),
    darkGreen: const Color(0xff2F8511),
    accent2: HexColor('#272727'),
    green: const Color(0xFF628303),
    buttonsAtTheTopOfBottomSheet: const Color(0xFF789407),
    calendarCellWithBug: const Color(0xffAEE80A),
    primeColor: const Color(0xffAEE80A),
    selectedTileColor: const Color(0xffAEE80A).withOpacity(0.2),
    commandMessageContainer: const Color(0xffAEE80A).withOpacity(0.4),
    dateCommandMessages: const Color(0xffAEE80A).withOpacity(0.2),
    doneColorInTask: const Color.fromRGBO(40, 206, 13, 1),
    selectingChat: const Color(0xffAEE80A).withOpacity(0.2),
    myTaskColor: const Color(0xFFD2F2A8),
    documentAttachmentBackground: const Color.fromRGBO(191, 222, 151, 1),
    sentMessageDesignColor: const Color.fromRGBO(210, 242, 168, 1),
    voicePlayerForTask: const Color.fromRGBO(210, 242, 168, 1),
    sentTaskOutOfChat: const Color.fromRGBO(210, 242, 168, 1),
    lastMessageRead: const Color(0xff5B5B5B),
    unActiveTabBarIcon: const Color.fromRGBO(255, 255, 255, 0.61),
    appBarActionBackground: const Color(0x5C5C5C7A),
    replyText: const Color.fromRGBO(95, 95, 95, 1),

    chooseAttachmentPopUpAudioButtonBackground:
        const Color.fromRGBO(252, 233, 198, 1),
    chooseAttachmentPopUpCameraButtonBackground:
        const Color.fromRGBO(252, 204, 204, 1),
    chooseAttachmentPopUpContactButtonBackground:
        const Color.fromRGBO(198, 252, 245, 1),
    chooseAttachmentPopUpDocumentButtonBackground:
        const Color.fromRGBO(244, 204, 255, 1),
    chooseAttachmentPopUpImageButtonBackground:
        const Color.fromRGBO(255, 200, 230, 1),
    chooseAttachmentPopUpLocationButtonBackground:
        const Color.fromRGBO(221, 255, 204, 1),

    theColorOfTheThumbForNotRecordedAudio: Colors.orange,
    scrollButtonIconBackground: const Color(0xFF6A6A6A),
    lightGrey: const Color(0xFF979797),
    removedItem: const Color.fromRGBO(185, 188, 178, 1),
    greyText: const Color(0xff5B5B5B),

    photosSearchChipBackgroundColor: const Color.fromRGBO(255, 200, 230, 1),
    videosSearchChipBackgroundColor: const Color.fromRGBO(205, 255, 200, 1),
    linksSearchChipBackgroundColor: const Color.fromRGBO(198, 252, 245, 1),
    audioSearchChipBackgroundColor: const Color.fromRGBO(252, 233, 198, 1),
    documentsSearchChipBackgroundColor: const Color.fromRGBO(244, 204, 255, 1),

    activeTabBarIcon: Colors.white,
    appBarTitle: Colors.white,
    receivedMessageDesignColor: Colors.white,
    replyContainer: Colors.white,
    chatTextFieldBackground: Colors.white,
    scrollButtonBackground: const Color(0xFFD6D5D5),
    darkGrey: const Color(0xFFE7E7E7),
    backgroundContainerIos: const Color(0xffFCFCFC),
    backgroundContactInfoIos: const Color(0xfff5f5f5),
    backgroundContainerLightGrey: const Color(0xFFECECEC),
    settingAccountIosBackground: Colors.white,
    scaffoldBackgroundIos: const Color.fromRGBO(252, 252, 252, 1),
    calendarTodayCell: Colors.white,
    containerAtTopOfBottomSheet: const Color(0xFFE7E7E7),
    scaffoldBackGroundChatInfo: Colors.grey.shade200,
    taskDetailsBackgroundContainer: const Color(0xffE6E6E6),
    backGroundColorOfSendButton: Colors.white,
    backGroundColorOfEditButton: Colors.white,

    backGroundTextFieldIos: const Color.fromRGBO(243, 242, 247, 1),
    settingTileColorIos: const Color(0xfff5f5f5),
    receivedTaskOutOfChat: const Color.fromRGBO(226, 226, 226, 1),
    chatScaffoldBackground: const Color.fromRGBO(244, 240, 217, 1),
    privacyGreyTextIos: const Color(0xf0a3a3a3),
    lineBetweenChats: const Color(0xffa8b3b0),
    documentSearchContainer: const Color.fromRGBO(217, 217, 217, 0.14),
    textFieldReplyContainer:
        const Color.fromRGBO(114, 130, 95, 0.34).withOpacity(0.3),
    unselectedRadioListTile: const Color(0xff515d5a),
    createGroupHintText: const Color(0xff515d5a),
    sizeAndExtensionInDocuments: const Color(0xff5B5B5B),
    subtitleColorInSetting: const Color(0xFF686060),
    textFieldReplayContainerName: const Color(0xff5B5B5B),
    nearPlacesPrefixIconColor: Colors.blueGrey.shade300,
    backGroundContainerInCreateTask: Colors.transparent,
    softGrey: const Color(0xffD9D9D9),
    strongGrey: const Color(0xff4D4D4D),
    superSoftGrey: const Color(0xffBDBDBD),
    textFieldsBorderedColor: const Color.fromRGBO(0, 0, 0, .26),
    darkPrimColor: const Color.fromRGBO(174, 232, 10, 0.26),
    fontDarkPrimeColor: const Color.fromRGBO(120, 148, 7, 1),
    greenDark: const Color.fromRGBO(47, 133, 17, 0.26),
    fontGreenDark: const Color.fromRGBO(47, 133, 17, 1),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Color(0xffE6E6E6),
      filled: true,
      border: InputBorder.none,
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(Corners.lg)),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(Corners.lg)),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(Corners.lg)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(Corners.lg)),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(Corners.lg)),
      ),
    ),
  ),
  ThemeType.xoDark: AppTheme(
    isDark: false,
    redColor: const Color(0xffEE3142),
    xoRedColor: const Color(0xffE10000),
    taskBottomSheetIconsColor: const Color.fromRGBO(238, 250, 203, 1),
    newTaskDesignColor: const Color(0xffe5edc9),
    greyTaskDeadline: const Color.fromRGBO(101, 101, 101, 1),
    redBadge: const Color(0xffDD2025),
    red: const Color(0xFFD60F0F),
    error: Colors.red.shade900,
    newPrimeColor: const Color(0xFF1097D1),
    hintCircleInAzListView: const Color(0xFF1097D1), // dark : white
    primeColorOfButtonTask: const Color(0xFF1097D1), // dark : green1
    badgeColorInChatItem: const Color(0xFF1097D1), // dark : green2
    buttonsInTask: const Color(0xFF1097D1), // dark : green3
    sendFloatingButton: const Color(0xFF1097D1), // dark : black
    fontColorBlack: const Color(0xFF000000),
    txt: Colors.black,
    blackWhiteColor: Colors.black, // dark : white
    contactDialogGrad2: const Color.fromRGBO(0, 0, 0, 0.32),
    contactDialogGrad3: const Color.fromRGBO(0, 0, 0, 0.5),
    contactDialogGrad1: const Color.fromRGBO(0, 0, 0, 0),
    colorUpdateDialog: const Color.fromRGBO(34, 34, 34, 0.94),
    blackGreyColor: Colors.black,
    basicButtonsToCreateChatOrTask: Colors.black,
    appBarBackGroundChatInfo: Colors.black,
    greyStrong: const Color(0xff151918),
    attachmentProgressBackground: const Color.fromRGBO(0, 0, 0, 0.35),
    deepGrey: const Color(0xff5f5f5f), // dark : white
    fontColorDarkGrey: const Color(0xFF686060),
    fontColorBlackWithOpacity: const Color(0xFF494949),
    popUpMenu: const Color(0xff3A3A3A),
    greyWeak: const Color(0xff909f9c),
    grey: const Color(0xff515d5a),
    fontColorDarkGrey1: const Color(0xFF9A9A9A),
    fontColorWhite: const Color(0xFFFFFFFF),
    fontColorLiteGrey: const Color(0xFFCBCFD3),
    fontColorGrey: const Color(0xFFBCBCBC),
    calendarCell: const Color(0xFFEFEFEF),
    backGroundButton: const Color(0xFFC6C6C6),
    accentTxt: Colors.white,
    bg1: const Color(0xfff1f7f0),
    textFieldGreyColor: const Color(0xffE6E6E6),
    scaffoldBackground: Colors.white,
    accent1: HexColor('#6C47FF'),
    accent1Darker: const Color(0xff006b5a),
    darkGreen: const Color(0xff2F8511),
    accent2: HexColor('#272727'),
    green: const Color(0xFF628303),
    buttonsAtTheTopOfBottomSheet: const Color(0xFF789407),
    calendarCellWithBug: const Color(0xffAEE80A),
    primeColor: const Color(0xffAEE80A),
    selectedTileColor: const Color(0xffAEE80A).withOpacity(0.2),
    commandMessageContainer: const Color(0xffAEE80A).withOpacity(0.4),
    dateCommandMessages: const Color(0xffAEE80A).withOpacity(0.2),
    doneColorInTask: const Color.fromRGBO(40, 206, 13, 1),
    selectingChat: const Color(0xffAEE80A).withOpacity(0.2),
    myTaskColor: const Color(0xFFD2F2A8),
    documentAttachmentBackground: const Color.fromRGBO(191, 222, 151, 1),
    sentMessageDesignColor: const Color.fromRGBO(210, 242, 168, 1),
    voicePlayerForTask: const Color.fromRGBO(210, 242, 168, 1),
    sentTaskOutOfChat: const Color.fromRGBO(210, 242, 168, 1),
    lastMessageRead: const Color(0xff5B5B5B),
    unActiveTabBarIcon: const Color.fromRGBO(255, 255, 255, 0.61),
    appBarActionBackground: const Color(0x5C5C5C7A),
    replyText: const Color.fromRGBO(95, 95, 95, 1),

    chooseAttachmentPopUpAudioButtonBackground:
        const Color.fromRGBO(252, 233, 198, 1),
    chooseAttachmentPopUpCameraButtonBackground:
        const Color.fromRGBO(252, 204, 204, 1),
    chooseAttachmentPopUpContactButtonBackground:
        const Color.fromRGBO(198, 252, 245, 1),
    chooseAttachmentPopUpDocumentButtonBackground:
        const Color.fromRGBO(244, 204, 255, 1),
    chooseAttachmentPopUpImageButtonBackground:
        const Color.fromRGBO(255, 200, 230, 1),
    chooseAttachmentPopUpLocationButtonBackground:
        const Color.fromRGBO(221, 255, 204, 1),

    theColorOfTheThumbForNotRecordedAudio: Colors.orange,
    scrollButtonIconBackground: const Color(0xFF6A6A6A),
    lightGrey: const Color(0xFF979797),
    removedItem: const Color.fromRGBO(185, 188, 178, 1),
    greyText: const Color(0xff5B5B5B),

    photosSearchChipBackgroundColor: const Color.fromRGBO(255, 200, 230, 1),
    videosSearchChipBackgroundColor: const Color.fromRGBO(205, 255, 200, 1),
    linksSearchChipBackgroundColor: const Color.fromRGBO(198, 252, 245, 1),
    audioSearchChipBackgroundColor: const Color.fromRGBO(252, 233, 198, 1),
    documentsSearchChipBackgroundColor: const Color.fromRGBO(244, 204, 255, 1),

    activeTabBarIcon: Colors.white,
    appBarTitle: Colors.white,
    receivedMessageDesignColor: Colors.white,
    replyContainer: Colors.white,
    chatTextFieldBackground: Colors.white,
    scrollButtonBackground: const Color(0xFFD6D5D5),
    darkGrey: const Color(0xFFE7E7E7),
    backgroundContainerIos: const Color(0xffFCFCFC),
    backgroundContactInfoIos: const Color(0xfff5f5f5),
    backgroundContainerLightGrey: const Color(0xFFECECEC),
    settingAccountIosBackground: Colors.white,
    scaffoldBackgroundIos: const Color.fromRGBO(252, 252, 252, 1),
    calendarTodayCell: Colors.white,
    containerAtTopOfBottomSheet: const Color(0xFFE7E7E7),
    scaffoldBackGroundChatInfo: Colors.grey.shade200,
    taskDetailsBackgroundContainer: const Color(0xffE6E6E6),
    backGroundColorOfSendButton: Colors.white,
    backGroundColorOfEditButton: Colors.white,

    backGroundTextFieldIos: const Color.fromRGBO(243, 242, 247, 1),
    settingTileColorIos: const Color(0xfff5f5f5),
    receivedTaskOutOfChat: const Color.fromRGBO(226, 226, 226, 1),
    chatScaffoldBackground: const Color.fromRGBO(244, 240, 217, 1),
    privacyGreyTextIos: const Color(0xf0a3a3a3),
    lineBetweenChats: const Color(0xffa8b3b0),
    documentSearchContainer: const Color.fromRGBO(217, 217, 217, 0.14),
    textFieldReplyContainer:
        const Color.fromRGBO(114, 130, 95, 0.34).withOpacity(0.3),
    unselectedRadioListTile: const Color(0xff515d5a),
    createGroupHintText: const Color(0xff515d5a),
    sizeAndExtensionInDocuments: const Color(0xff5B5B5B),
    subtitleColorInSetting: const Color(0xFF686060),
    textFieldReplayContainerName: const Color(0xff5B5B5B),
    nearPlacesPrefixIconColor: Colors.blueGrey.shade300,
    backGroundContainerInCreateTask: Colors.transparent,
    softGrey: const Color(0xffD9D9D9),
    strongGrey: const Color(0xff4D4D4D),
    superSoftGrey: const Color(0xffBDBDBD),
    textFieldsBorderedColor: const Color.fromRGBO(0, 0, 0, .26),
    darkPrimColor: const Color.fromRGBO(174, 232, 10, 0.26),
    fontDarkPrimeColor: const Color.fromRGBO(120, 148, 7, 1),
    greenDark: const Color.fromRGBO(47, 133, 17, 0.26),
    fontGreenDark: const Color.fromRGBO(47, 133, 17, 1),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Color(0xffE6E6E6),
      filled: true,
      border: InputBorder.none,
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(Corners.lg)),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(Corners.lg)),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(Corners.lg)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(Corners.lg)),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(Corners.lg)),
      ),
    ),
  )
};

class AppTheme {
  static ThemeType defaultTheme = ThemeType.xoLight;
  static Brightness brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  bool isDark;
  Color blackWhiteColor;
  Color redColor;
  Color xoRedColor;
  Color bg1; //
  Color accent1;
  Color accent1Darker;
  Color green;
  Color accent2;
  Color grey;
  Color greyStrong;
  Color greyWeak;
  Color error;
  Color txt;
  Color accentTxt;
  Color primeColor;
  Color red;
  Color textFieldGreyColor;
  InputDecorationTheme inputDecorationTheme;
  Color popUpMenu;
  Color backGroundButton;
  Color scaffoldBackground;
  Color scaffoldBackgroundIos;
  Color unActiveTabBarIcon;
  Color activeTabBarIcon;
  Color lastMessageRead;
  Color appBarActionBackground;
  Color appBarTitle;
  Color sentMessageDesignColor;
  Color receivedMessageDesignColor;
  Color receivedTaskOutOfChat;
  Color sentTaskOutOfChat;
  Color replyContainer;
  Color replyText;
  Color chatScaffoldBackground;
  Color chatTextFieldBackground;
  Color documentAttachmentBackground;
  Color chooseAttachmentPopUpCameraButtonBackground;
  Color chooseAttachmentPopUpImageButtonBackground;
  Color chooseAttachmentPopUpAudioButtonBackground;
  Color chooseAttachmentPopUpContactButtonBackground;
  Color chooseAttachmentPopUpDocumentButtonBackground;
  Color chooseAttachmentPopUpLocationButtonBackground;
  Color theColorOfTheThumbForNotRecordedAudio;
  Color attachmentProgressBackground;
  Color scrollButtonBackground;
  Color scrollButtonIconBackground;
  Color newPrimeColor;
  Color lightGrey;
  Color darkGrey;
  Color removedItem;
  Color backgroundContainerIos;
  Color greyText;
  Color backgroundContactInfoIos;
  Color backgroundContainerLightGrey;
  Color photosSearchChipBackgroundColor;
  Color videosSearchChipBackgroundColor;
  Color linksSearchChipBackgroundColor;
  Color audioSearchChipBackgroundColor;
  Color documentsSearchChipBackgroundColor;
  Color settingAccountIosBackground;
  Color privacyGreyTextIos;
  Color documentSearchContainer;
  Color fontColorWhite;
  Color fontColorBlack;
  Color fontColorGrey;
  Color fontColorDarkGrey;
  Color fontColorLiteGrey;
  Color fontColorDarkGrey1;
  Color calendarCell;
  Color calendarTodayCell;
  Color calendarCellWithBug;
  Color myTaskColor;
  Color fontColorBlackWithOpacity;
  Color contactDialogGrad1;
  Color contactDialogGrad2;
  Color contactDialogGrad3;
  Color darkGreen;
  Color colorUpdateDialog;
  Color deepGrey;
  Color redBadge;
  Color blackGreyColor;
  Color sizeAndExtensionInDocuments;
  Color lineBetweenChats;
  Color hintCircleInAzListView;
  Color selectedTileColor;
  Color containerAtTopOfBottomSheet;
  Color buttonsAtTheTopOfBottomSheet;
  Color scaffoldBackGroundChatInfo;
  Color appBarBackGroundChatInfo;
  Color primeColorOfButtonTask;
  Color taskDetailsBackgroundContainer;
  Color voicePlayerForTask;
  Color subtitleColorInSetting;
  Color commandMessageContainer;
  Color dateCommandMessages;
  Color doneColorInTask;
  Color buttonsInTask;
  Color badgeColorInChatItem;
  Color selectingChat;
  Color unselectedRadioListTile;
  Color backGroundContainerInCreateTask;
  Color basicButtonsToCreateChatOrTask;
  Color createGroupHintText;
  Color sendFloatingButton;
  Color backGroundColorOfSendButton;
  Color backGroundColorOfEditButton;

  Color nearPlacesPrefixIconColor;
  Color backGroundTextFieldIos;
  Color textFieldReplyContainer;
  Color textFieldReplayContainerName;
  Color settingTileColorIos;
  Color softGrey;
  Color strongGrey;
  Color superSoftGrey;
  Color textFieldsBorderedColor;
  Color darkPrimColor;
  Color fontDarkPrimeColor;
  Color greenDark;
  Color fontGreenDark;
  Color greyTaskDeadline;
  Color newTaskDesignColor;
  Color taskBottomSheetIconsColor;

  /// Default constructor
  AppTheme({
    required this.redColor,
    required this.xoRedColor,
    required this.taskBottomSheetIconsColor,
    required this.greyTaskDeadline,
    required this.fontGreenDark,
    required this.greenDark,
    required this.fontDarkPrimeColor,
    required this.blackWhiteColor,
    required this.backGroundTextFieldIos,
    required this.sentTaskOutOfChat,
    required this.blackGreyColor,
    required this.isDark,
    required this.theColorOfTheThumbForNotRecordedAudio,
    required this.redBadge,
    required this.backGroundButton,
    required this.popUpMenu,
    required this.green,
    required this.primeColor,
    required this.bg1,
    required this.red,
    required this.accent1,
    required this.accent1Darker,
    required this.accent2,
    required this.grey,
    required this.greyStrong,
    required this.greyWeak,
    required this.error,
    required this.txt,
    required this.accentTxt,
    required this.inputDecorationTheme,
    required this.textFieldGreyColor,
    required this.scaffoldBackground,
    required this.lastMessageRead,
    required this.unActiveTabBarIcon,
    required this.activeTabBarIcon,
    required this.appBarActionBackground,
    required this.appBarTitle,
    required this.sentMessageDesignColor,
    required this.receivedMessageDesignColor,
    required this.replyContainer,
    required this.replyText,
    required this.receivedTaskOutOfChat,
    required this.chatScaffoldBackground,
    required this.chatTextFieldBackground,
    required this.documentAttachmentBackground,
    required this.chooseAttachmentPopUpAudioButtonBackground,
    required this.chooseAttachmentPopUpCameraButtonBackground,
    required this.chooseAttachmentPopUpContactButtonBackground,
    required this.chooseAttachmentPopUpDocumentButtonBackground,
    required this.chooseAttachmentPopUpImageButtonBackground,
    required this.chooseAttachmentPopUpLocationButtonBackground,
    required this.attachmentProgressBackground,
    required this.scrollButtonBackground,
    required this.scrollButtonIconBackground,
    required this.darkGrey,
    required this.lightGrey,
    required this.removedItem,
    required this.backgroundContainerIos,
    required this.greyText,
    required this.backgroundContactInfoIos,
    required this.backgroundContainerLightGrey,
    required this.photosSearchChipBackgroundColor,
    required this.videosSearchChipBackgroundColor,
    required this.linksSearchChipBackgroundColor,
    required this.audioSearchChipBackgroundColor,
    required this.documentsSearchChipBackgroundColor,
    required this.settingAccountIosBackground,
    required this.privacyGreyTextIos,
    required this.backGroundColorOfEditButton,
    required this.documentSearchContainer,
    required this.scaffoldBackgroundIos,
    required this.fontColorWhite,
    required this.calendarCell,
    required this.calendarCellWithBug,
    required this.fontColorBlackWithOpacity,
    required this.fontColorDarkGrey,
    required this.fontColorDarkGrey1,
    required this.fontColorGrey,
    required this.fontColorLiteGrey,
    required this.fontColorBlack,
    required this.myTaskColor,
    required this.contactDialogGrad1,
    required this.contactDialogGrad2,
    required this.contactDialogGrad3,
    required this.darkGreen,
    required this.newPrimeColor,
    required this.colorUpdateDialog,
    required this.deepGrey,
    required this.sizeAndExtensionInDocuments,
    required this.calendarTodayCell,
    required this.lineBetweenChats,
    required this.hintCircleInAzListView,
    required this.selectedTileColor,
    required this.containerAtTopOfBottomSheet,
    required this.buttonsAtTheTopOfBottomSheet,
    required this.scaffoldBackGroundChatInfo,
    required this.appBarBackGroundChatInfo,
    required this.primeColorOfButtonTask,
    required this.taskDetailsBackgroundContainer,
    required this.voicePlayerForTask,
    required this.subtitleColorInSetting,
    required this.commandMessageContainer,
    required this.dateCommandMessages,
    required this.buttonsInTask,
    required this.doneColorInTask,
    required this.badgeColorInChatItem,
    required this.selectingChat,
    required this.unselectedRadioListTile,
    required this.backGroundContainerInCreateTask,
    required this.basicButtonsToCreateChatOrTask,
    required this.sendFloatingButton,
    required this.backGroundColorOfSendButton,
    required this.createGroupHintText,
    required this.textFieldReplyContainer,
    required this.textFieldReplayContainerName,
    required this.settingTileColorIos,
    required this.nearPlacesPrefixIconColor,
    required this.softGrey,
    required this.strongGrey,
    required this.superSoftGrey,
    required this.textFieldsBorderedColor,
    required this.darkPrimColor,
    required this.newTaskDesignColor,
  });

  ThemeData get themeData {
    var t = ThemeData.from(
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      colorScheme: ColorScheme(
          brightness: isDark ? Brightness.dark : Brightness.light,
          primary: accent1,
          primaryContainer: accent1Darker,
          secondary: accent2,
          secondaryContainer: ColorUtils.shiftHsl(accent2, -.2),
          background: bg1,
          surface: scaffoldBackground,
          onBackground: txt,
          onSurface: txt,
          onError: txt,
          onPrimary: accentTxt,
          onSecondary: accentTxt,
          error: error),
    );

    return t.copyWith(
        bottomSheetTheme: BottomSheetThemeData(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(Corners.xl))),
            backgroundColor: Colors.white),
        textTheme: const TextTheme()
            .apply(
              displayColor: isDark ? Colors.white : Colors.black,
              bodyColor: isDark ? Colors.white : Colors.black,
              fontFamily: FontManagerStyles.montserrat,
            )
            .copyWith(
              labelMedium: isDark
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Colors.black),
              titleLarge: isDark
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Colors.black),
              headlineSmall: isDark
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Colors.black),
              headlineMedium: isDark
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Colors.black),
              headlineLarge: isDark
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Colors.black),
              titleMedium: isDark
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Colors.black),
              labelLarge: isDark
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Colors.black),
              displayLarge: isDark
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Colors.black),
              bodyMedium: isDark
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Colors.black),
              labelSmall: isDark
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Colors.black),
              bodyLarge: isDark
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Colors.black),
              displayMedium: isDark
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Colors.black),
              displaySmall: isDark
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Colors.black),
              bodySmall: isDark
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Colors.black),
              titleSmall: isDark
                  ? const TextStyle(color: Colors.white)
                  : const TextStyle(color: Colors.black),
            ),
        // pageTransitionsTheme: PageTransitionsTheme(
        //   builders: {
        //     TargetPlatform.iOS: CupertinoWillPopScopePageTransionsBuilder(),
        //   },
        // ),

        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,

            ///TODO add font family
          ),
        ),
        radioTheme: RadioThemeData(
            fillColor: MaterialStateColor.resolveWith(
                (states) => unselectedRadioListTile)),
        switchTheme: SwitchThemeData(
            thumbColor:
                MaterialStateColor.resolveWith((states) => Colors.white),
            trackColor:
                MaterialStateColor.resolveWith((states) => Colors.grey)),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          border: UnderlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xffD8D8D8), width: 0.4.w),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xffD8D8D8), width: 0.4.w),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xffD8D8D8), width: 0.4.w),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xffD8D8D8), width: 0.4.w),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xffD8D8D8), width: 0.4.w),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xffD8D8D8), width: 0.4.w),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
            side: BorderSide.none,
            fillColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return txt;
              } else {
                return softGrey;
              }
            })),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: greyWeak,
          selectionHandleColor: Colors.transparent,
          cursorColor: accent1,
        ),
        scaffoldBackgroundColor: scaffoldBackground,
        buttonTheme: ButtonThemeData(
          buttonColor: txt,
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(color: txt),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(txt),
          backgroundColor: MaterialStateProperty.all(txt),
        )),
        highlightColor: Colors.transparent,
        toggleableActiveColor: accent1);
  }

  Color shift(Color c, double d) =>
      ColorUtils.shiftHsl(c, d * (isDark ? -1 : 1));
}
