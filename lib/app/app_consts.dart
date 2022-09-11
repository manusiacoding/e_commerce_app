import 'package:flutter/material.dart';
import 'package:saldah_shop/size_config.dart';

class AppColors {
  static const Color darkGrey = Color.fromRGBO(64, 64, 64, 1);
  static const Color lightGrey = Color.fromRGBO(176, 176, 176, 1);
  static const Color grey = Color.fromRGBO(97, 97, 97, 1);
  static const Color darkWhite = Color.fromRGBO(246, 246, 246, 1);
  static const kPrimaryColor = Color(0xFFD95284);
  static const kPrimaryLightColor = Color(0xFF2E2E2E);
}

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kNameNullError = "Please Enter your name";
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

// API
const baseURL = 'https://crosamo.com/api';
const loginURL = '$baseURL/login';
const registerURL = '$baseURL/register';
const logoutURL = '$baseURL/logout';
const userURL = '$baseURL/user';
const productURL = '$baseURL/products';
const commentURL = '$baseURL/comments';

const serverError = 'Server Error';
const unauthorized = 'Unauthrorized';
const somethingWentWrong = 'Something Went Wrong, Try Again!';
