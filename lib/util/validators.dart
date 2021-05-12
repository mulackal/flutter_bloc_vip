/*
 * Copyright (c) 2021, Vipin.
 */

class Validator {
  Validator._();

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  static bool isValidMobile(String data) {
    if(data.trim().isNotEmpty){
      if(data.trim().contains(".") || data.trim().contains("-"))
        return data.length == 10;
      else
        return true;
    }
    return false ;
  }

  static bool isValidText(String data) {
    return data.trim().isNotEmpty;
  }
  static bool isValidNumber(String data) {
    if(data.trim().isNotEmpty){
      if(data.trim().contains(".") || data.trim().contains("-") || data.trim().contains(","))
        return false;
            else
              return true;
    }
    return false ;
  }

  static bool isValidNull(Object data) {
    return data != null ? true : false;
  }

}
