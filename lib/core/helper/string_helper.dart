import 'package:intl/intl.dart';

class StringHelper {





  static String hideEmail(String email) {
    if (email.isEmpty) {
      return email;
    }

    final List<String> parts = email.split('@');
    if (parts.length != 2) {
      return email;
    }

    final String username = parts[0];
    final String domain = parts[1];
    const int visibleCharacters = 1; // Number of characters to keep visible

    String maskedUsername = '';
    for (int i = 0; i < username.length; i++) {
      if (i < visibleCharacters || i >= username.length - visibleCharacters) {
        maskedUsername += username[i];
      } else {
        maskedUsername += '*';
      }
    }

    return '$maskedUsername@$domain';
  }

  static String unMask(String val) {
  return val.replaceAll(RegExp(r'\D'), '');
  }

 static String formatDate(DateTime dateString) {
    // Parse the string to a DateTime object
   // DateTime dateTime = DateTime.parse(dateString);

    // Format the DateTime object to the desired format
    String formattedDate = DateFormat('MMMM d, yyyy').format(dateString);

    // Return the formatted date
    return formattedDate;
  }


}