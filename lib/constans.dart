import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

Color whiteColor = Color(0xFFFFFFFF);
Color yellowColor = Color(0xFFFBBC05);

Color buttonColor = Color(0xFFFBBC05);
Color buttonColorWhite = Color(0xFFFFFFFF);
Color AbuColor = Color(0xFFD8DADC);

TextStyle Poppinstyle = GoogleFonts.dmSans(
  color: whiteColor,
  fontWeight: FontWeight.w900,
);

TextStyle Interstyle = GoogleFonts.dmSans(
  color: whiteColor,
);
TextStyle Interrstyle = GoogleFonts.dmSans(
  color: AbuColor,
);
TextStyle Interrrstyle = GoogleFonts.dmSans(
  color: yellowColor,
);

FontWeight bold = FontWeight.w900;

const String tprofileimage = "lib/data/profile.png";

<<<<<<< Updated upstream
class Dimension {
  static double get screenHeight => Get.context!.height;
  static double get screenWidth => Get.context!.width;

  // Detail
  static double get popularfoodimgsize => screenHeight / 2.41;
}
=======
//-- Profile Images
const String tProfilepicImage = "lib/data/profilepic.jpg";

//-- Profile Screen - Text
const String tProfile = "Profile";
const String eEditProfile = "Edit Profile";
const String tLogoutDialogHeading = "Logout";
const String tProfileHeading = "CueBall";
const String tProfileSubHeading = "bila cantik";
//-- Menu
const String tMenu5 = tLogoutDialogHeading;
const String tMenu1 = "Settings";
const String tMenu4 = "Information";
const String tMenu2 = "Billing Details";
const String tMenu3 = "User Management";

//-- Update Profile Screen - Text
const String tDelete = "Delete";
const String tJoined = "Joined";
const String tJoinedAt = "jaman penjajahan";

>>>>>>> Stashed changes
