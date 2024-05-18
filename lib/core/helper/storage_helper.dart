import 'package:movie_catalog/core/resource/local_storage/local_storage.dart';

class StorageHelper {

  static bool isLoggedIn(){
    if(LocalStorage.getToken() == null){
      return false;
    }
    return true;
  }

  static removeUserData(){
    LocalStorage.deleteToken();
    LocalStorage.deleteUsername();
    LocalStorage.deleteUserId();
    LocalStorage.deleteEmail();
  }


}
