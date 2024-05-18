import 'dart:convert';

import 'package:get_storage/get_storage.dart';

class LocalStorage {
  /// use this to [saveToken] to local storage
  static saveToken(String tokenValue) {
    return GetStorage().write("token", tokenValue);
  }

  /// use this to [getToken] from local storage
  static getToken() {
    return GetStorage().read("token");
  }

  /// use this to [deleteToken] from local storage
  static deleteToken() {
    return GetStorage().remove("token");
  }


  static saveEmail(String emailValue) {
    return GetStorage().write("email", emailValue);
  }

  /// use this to [getToken] from local storage
  static getEmail() {
    return GetStorage().read("email");
  }

  /// use this to [deleteToken] from local storage
  static deleteEmail() {
    return GetStorage().remove("email");
  }


  /// use this to [saveUserId] to local storage
  static saveUserId(int userId) {
    return GetStorage().write("userId", userId);
  }

  /// use this to get [getUserId] from local storage
  static getUserId() {
    return GetStorage().read("userId");
  }

  static deleteUserId() {
    return GetStorage().remove("userId");
  }

  /// use this to [saveUsername] to local storage
  static saveUsername(String userName) {
    return GetStorage().write('name', userName);
  }

  /// use this to [getUsername] from local storage
  static getUsername() {
    return GetStorage().read('name');
  }

  /// use this to [deleteUsername] from local storage
  static deleteUsername() {
    return GetStorage().remove("name");
  }

  static saveRememberStatus(List rememberStatus) {
    return GetStorage().write('rememberStatus', rememberStatus);
  }

  static getRememberStatus() {
    return GetStorage().read('rememberStatus');
  }

  static deleteRememberStatus() {
    return GetStorage().remove('rememberStatus');
  }

  static saveUserType(List<String>? userType) {
    return GetStorage().write('userType', userType);
  }

  static getUserType() {
    return GetStorage().read('userType');
  }

  static deleteUserType() {
    return GetStorage().remove('userType');
  }

  static saveTimeFormat(String? timeFormat) {
    return GetStorage().write('timeFormat', timeFormat);
  }

  static getTimeFormat() {
    return GetStorage().read('timeFormat');
  }

  static deleteTimeFormat() {
    return GetStorage().remove('timeFormat');
  }

  static saveLanguage(String? language) {
    return GetStorage().write('language', language);
  }

  static getLanguage() {
    return GetStorage().read('language');
  }

  static deleteLanguage() {
    return GetStorage().remove('language');
  }

  static saveListWithGetStorage(String storageKey, List<dynamic> storageValue) async =>
      await GetStorage().write(storageKey, jsonEncode(storageValue));

  /// read from storage
  static readWithGetStorage(String storageKey) => GetStorage().read(storageKey);

  static localSaveDList(List<dynamic> listNeedToSave) {
    /// getting all saved data
    String oldSavedData = readWithGetStorage('saveList');

    /// in case there is saved data
    if (oldSavedData != null) {
      /// create a holder list for the old data
      List<dynamic> oldSavedList = jsonDecode(oldSavedData);

      /// append the new list to saved one
      oldSavedList.addAll(listNeedToSave);

      /// save the new collection
      return saveListWithGetStorage('saveList', oldSavedList);
    } else {
      /// in case of there is no saved data -- add the new list to storage
      return saveListWithGetStorage('saveList', listNeedToSave);
    }
  }

  /// read from the storage
  static readLocalSavedList(String s) => readWithGetStorage('saveList');

  /// it is saves event id from calendar event creation with trip id of the trip
  static saveCalendarEventID(String storageKey, List<dynamic> storageValue) async =>
      await GetStorage().write(storageKey, jsonEncode(storageValue));

  /// it reads the events id of saved calendar event
  static readCalendarEventID(String storageKey) => GetStorage().read(storageKey);
}
