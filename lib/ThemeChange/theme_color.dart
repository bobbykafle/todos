import 'package:flutter/material.dart';

class ThemeColor{
  // Scaffold
  static Color background(BuildContext context) =>
      Theme.of(context).scaffoldBackgroundColor;

  // appBar 
  static Color appBarBg(BuildContext context) =>
      Theme.of(context).appBarTheme.backgroundColor ?? Colors.transparent;

  // Card & Container background
  static Color cardBg(BuildContext context) =>
      Theme.of(context).cardColor;

  // Primary text
  static Color text(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;

  // Icon color
  static Color icon(BuildContext context) =>
      Theme.of(context).iconTheme.color ?? Colors.black;

  // LinearProgressIndicator color
  static Color progressIndicator(BuildContext context) =>
      Theme.of(context).colorScheme.primary;

  // Secondary text
  static Color secondaryText(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium?.color ?? Colors.grey;


  //Dreae backgroung
 static Color drawerBg(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
      ? Colors.grey[100]! : Colors.grey[900]!; 

   // Drawer text
  static Color drawerText(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
        ? Colors.black : Colors.white;  

    // Drawer icon
  static Color drawerIcon(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
        ? Colors.black : Colors.white; 

    // Shades of gray for subtle backgrounds
  static Color lightGray(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? Colors.grey[200]! : Colors.grey[800]!;

  static Color darkGray(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? Colors.grey[600]! : Colors.grey[300]!;
}
