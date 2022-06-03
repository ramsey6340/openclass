import 'package:flutter/material.dart';

const kColorPrimary = Color(0xFF7b3f7b);
const kColorSecondary = Color(0xFF4F4949);
const kColorForgotPassword = Color(0xFF73AFF6);
const kColorError = Color(0xFFE31037);
const kColorPrimarySecond = Color(0xFFFB59FB);
const kColorCancel = Color(0xFFAC1733);
const kColorAppBar = Color(0xFF161515);
const kColorComposant = Color(0xFF090808);
const kColorBackground = Color(0xFF292424);
const kColorIcon = Color(0xFF99AAB5);
const kColorSearch = Color(0xFF4F4949);
const kColorDrawer = Color(0xFF111010);
const AssetImage ImageBackgroundLogin = AssetImage('assets/images/backgroung.jpg');
const BoxDecoration backgroundConfig = BoxDecoration(
  image: DecorationImage(
    image: ImageBackgroundLogin,
    fit: BoxFit.cover,
  ),
);
const Widget ? appBarConfig = Image(
  image: ImageBackgroundLogin,
  fit: BoxFit.cover,
);

TextStyle headerFontSize = TextStyle(fontSize: 32);
TextAlign headerTextAlign = TextAlign.center;
TextStyle subHeaderFontSize = TextStyle(fontSize: 20);
TextAlign subHeaderTextAlign = TextAlign.center;
final  kOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: BorderSide(color: Colors.white),
);

final kOtpInputDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 20),
    enabledBorder: kOutlineInputBorder,
  focusedBorder: kOutlineInputBorder,
  border: kOutlineInputBorder,
);

final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Entrer votre email";
const String kInvalidEmailError = "Entrer un email valide";
const String kPassNullError = "Entrer votre mot de passe";
const String kShortPassError = "Le mot de passe est trop court";
const String kInvalidPassError = "Mot de passe incorrecte";
const String kPrenomNullError = "Entrer votre prenom";
const String kNomNullError = "Entrer cotre nom";
const String kNumberNullError = "Entrer votre numero de téléphone";
