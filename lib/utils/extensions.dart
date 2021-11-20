import 'package:intl/intl.dart';

extension StringX on String {
  String getFirstWord() {
    try {
      return split(' ').first;
    } catch (e) {
      print(e);
      return '';
    }
  }

  String upperCaseFristLetter() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  double? toDouble({fractionDigits = 2}) {
    try {
      return double.tryParse(
          double?.tryParse(this)!.toStringAsFixed(fractionDigits));
    } catch (e) {
      print(e);
      return null;
    }
  }

  // bool isNotNullOrEmpty() {
  //   String x = this;
  //   return x!=null && this.isNotEmpty;
  // }

  bool isValidEmail() {
    // assert(this != null);
    var regExpEmail =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    return RegExp(regExpEmail).hasMatch(this);
  }

  bool isValidName() {
    return length >= 2;
  }

  bool isValidFullName() {
    bool isValid = false;
    if (trim().split(' ').length >= 2) {
      isValid = true;
    }
    return isValid;
  }

  Map<String, dynamic> getFristNameLastName() {
    var fullNames = this.toString().trim().split(' ');
    var firstName = "";
    var lastName = "";
    fullNames.removeWhere((element) => element.trim() == '');
    firstName = fullNames.first.toString();
    if (fullNames.length > 1) {
      fullNames.removeAt(0);
      lastName = fullNames.reduce((a, b) => a + " " + b);
    }
    return {'first_name': firstName, 'last_name': lastName};
  }

  String getFirstName() {
    try {
      return getFristNameLastName()['first_name'];
    } catch (e) {
      return '-';
    }
  }

  bool isValidPassword() {
    // var regexPassword =
    //     r"^(?=.*[A-Z])(?=.*[0-9])(?=.{8,})(?=.*[!@#$%^&*.])(?=.*[A-Z])";
    // var regexPassword =
    //     r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[\^$*.\[\]{}\(\)?\-“!@#%&/,><\’:;|_~`])\S{8,99}";
    // return RegExp(regexPassword).hasMatch(this);
    return length >= 6;
  }

  String format12H() {
    return DateFormat('hh:mm a').format(DateTime.parse(this));
  }
}

extension DoubleX on double {
  double? toCurrencyUnit() {
    try {
      return double.tryParse(toStringAsFixed(2));
    } catch (e) {
      print(e);
      return 0.0;
    }
  }
}

extension DateTimeX on DateTime {
  bool isToday() {
    var now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  String format12H() {
    return DateFormat('hh:mm a').format(this);
  }

  String format24H() {
    return DateFormat('HH:mm').format(this);
  }

  String formatHumableReadable({bool showTime = false}) {
    return DateFormat('dd MMM yyyy').format(this);
  }

  String format(String format) {
    return DateFormat(format).format(this);
  }

  bool isSameDay(DateTime dateTime) {
    return day == dateTime.day &&
        dateTime.month == month &&
        dateTime.year == year;
  }
}
