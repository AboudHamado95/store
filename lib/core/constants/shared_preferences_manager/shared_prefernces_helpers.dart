import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_prefernces_keys.dart';


class SharedPreferncesFunc {
  static final SharedPreferncesFunc _instanceKey = SharedPreferncesFunc._internalKey();

  factory SharedPreferncesFunc() => _instanceKey;

  SharedPreferncesFunc._internalKey();
  
  static Future<void>appSectionsSaver(String jsonString)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPreferncesKeys.appSectionsSaver, jsonString);
  }

   static Future<String?>appSectionsRetriever()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result =prefs.getString(SharedPreferncesKeys.appSectionsSaver);
    return result;
  }

 static Future<void>attemptResendNumberSaver(int attemptNumber )async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(SharedPreferncesKeys.attemptNumberOfResendCodeRequest, attemptNumber);
 }

 static Future<int?>attemptResendNumberRetriever()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(SharedPreferncesKeys.attemptNumberOfResendCodeRequest);
 }

 static Future<void>isTimerWorkingSaver(bool isWorking )async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SharedPreferncesKeys.isResendCodeTimerWorking, isWorking);
 }

 static Future<bool?>isTimerWorkingRetriever()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPreferncesKeys.isResendCodeTimerWorking);
 }

 static Future<void>endTimeOFTimerSaver(int endingTimeMilliSec )async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(SharedPreferncesKeys.endTimeOfTheRunningTimer, endingTimeMilliSec);
 }

 static Future<int?>endTimeOFTimerRetriever()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(SharedPreferncesKeys.endTimeOfTheRunningTimer);
 }

 static Future<void>requestResendCodeDateTimeSaver()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(SharedPreferncesKeys.requestResendCodeDateTime, DateTime.now().millisecondsSinceEpoch);
 }
 static Future<int?>requestResendCodeDateTimeRetreiver()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(SharedPreferncesKeys.requestResendCodeDateTime);
 }

  // static Future setLastTimeOfViewDialog(DateTime? date) async {
  //   int time = TimeHelpers.getMSFromLocalDate(date ?? DateTime.now().toLocal());
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   try {
  //     prefs.setInt(SharedPreferncesKeys.kLastTimeViewUpdateDialog, time);
  //   } on Exception {
  //     if (kDebugMode) {
  //       print('Exception');
  //     }
  //   }
  // }

  static Future<void> selectedDialCodeSaver({required String dialCode}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPreferncesKeys.kDialCodeKey, dialCode);
  }

  static Future<String?> selectedDialCodeRetriever() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = prefs.getString(SharedPreferncesKeys.kDialCodeKey);
    return result;
  }
  /// this function is whis list saver
  /// used to save list of strings in the shared preferences
  static Future<void> wishListSaver(List<String> listOfProductData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(SharedPreferncesKeys.kWishList, listOfProductData);
  }
  /// wishlist retriever gets all the 
  /// products saved by the user in the wishlist
  static Future<List<String>> wishListRetriever() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> wishlist = prefs.getStringList(SharedPreferncesKeys.kWishList) ?? [];
    return wishlist;
  }
  /// this function is reponsable to save the product in the wishlist
  static Future<void> saveProductDataInWishlist({required String productDataJson}) async {
    List<String> wishlist = await wishListRetriever();
    wishlist.add(productDataJson);
    wishListSaver(wishlist);
  }
  ///  used to remove the product from wishlist
  static Future<void> removeProductDataInWishlist({required String productDataJson}) async {
    List<String> wishlist = await wishListRetriever();
    wishlist.removeWhere((element) => element == productDataJson);
    wishListSaver(wishlist);
  }
 /// saves the selected section id in the shared prefernces
  static Future<void> setSelectedSectionId({required int sectionId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(SharedPreferncesKeys.kSelectedSectionId, sectionId);
  }
 /// gets the selected section id from the shared prefernces
  static Future<int?> getSelectedSectionId() async {
    int? selectedSectionId;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      selectedSectionId = prefs.getInt(SharedPreferncesKeys.kSelectedSectionId);
    } on Exception {
      debugPrint('exception');
    }
    return selectedSectionId;
  }
  /// save the selected section name in the shared prefernces
  static Future<void> setSelectedSectionName({required String sectionName}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPreferncesKeys.kSectionName, sectionName);
  }
  
  /// gets the selected section name in the shared prefernces
  static Future<String?> getSelectedSectionName() async {
    String? selectedSectionName;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      selectedSectionName = prefs.getString(SharedPreferncesKeys.kSectionName);
    } on Exception {
      debugPrint('exception');
    }
    return selectedSectionName;
  }

  static Future<void> setUserIsNewOrNot({required bool isNew}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SharedPreferncesKeys.kUserIsNew, isNew);
  }

  /// to save user who is using the app
  /// this function is used when the sign up sucessed and the verify account process 
//   static Future<void> setUser({required User user}) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final userTojson = user.toJson();
//     final json = jsonEncode(userTojson);
//     prefs.setString(SharedPreferncesKeys.kUserKey, json);
//   }
// /// to retrieve the saved user
//   static Future<User?> getUser() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final userString = prefs.getString(SharedPreferncesKeys.kUserKey);
//     if (userString == null) {
//       return null;
//     } else {
//       final user = jsonDecode(userString);
//       final userModel = User.fromJson(user);
//       return userModel;
//     }
//   }
  /// to get if the user is new 
  /// if resutl of this function is null 
  /// that mean the user is new
  static Future<bool?> getUserIsNew() async {
    bool? userIsNew;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      userIsNew = prefs.getBool(SharedPreferncesKeys.kUserIsNew);
    } on Exception {
      debugPrint('exception');
    }
    return userIsNew;
  }

  /// save the app languange 
  static Future<void> setAppLanguage({required String language}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPreferncesKeys.kSelectedLanguageKey, language);
  }

  static Future<String?> getAppLanguage() async {
    String? language;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      language = prefs.getString(SharedPreferncesKeys.kSelectedLanguageKey);
    } on Exception {
      debugPrint('exception');
    }
    return language;
  }
  /// set the app country
  static Future<void> setAppCountry({required String country}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPreferncesKeys.kSelectedCountryKey, country);
  }
  /// to get the app country
  static Future<String?> getAppCountry() async {
    String? country;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      country = prefs.getString(SharedPreferncesKeys.kSelectedCountryKey);
    } on Exception {
      debugPrint('exception');
    }
    return country;
  }
  /// used to save the token 
  /// this used when the login succeeded or when the verify account process is done
  static Future<void> setToken({required String token}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPreferncesKeys.kTokenKey, token);
  }

  /// used to get the token 
  static Future<String?> getToken() async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      token = prefs.getString(SharedPreferncesKeys.kTokenKey);
    } on Exception {
      debugPrint('exception');
    }
    return token;
  }
 
 /// used to get if the user is guest
 /// used at the beginnig of the app
  static Future<bool?> getUserIsGuest() async {
    bool? userIsGuest;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      userIsGuest = prefs.getBool(SharedPreferncesKeys.kGuestKey);
    } on Exception {
      debugPrint('exception');
    }
    return userIsGuest;
  }
  /// used when the user taps on continue as guest
  static Future<void> setUserIsGuest({required bool isGuest}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SharedPreferncesKeys.kGuestKey, isGuest);
  }
}
