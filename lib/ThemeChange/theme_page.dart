// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:to_do_app/ThemeChange/theme_chenge.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/ThemeChange/theme_color.dart';
 class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChenge = Provider.of<ThemeChenge>(context);
    
    return  Scaffold(
      backgroundColor: ThemeColor.background(context),
      appBar: AppBar(
        title:Text("choose your Theme"),
      ),
      
      body: SafeArea(
       child: Center(
          child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal:40),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25), 
              decoration: BoxDecoration(
              color: ThemeColor.cardBg(context),
               borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).brightness == Brightness.light
                      ? Colors.blue.withOpacity(0.4) : Colors.deepPurple.withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
            
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RadioListTile<ThemeMode>(
                    title: Center(child: const Text("LightMode")),
                    value:ThemeMode.light,
                    // ignore: deprecated_member_use
                    groupValue: themeChenge.themeMode,
                    // ignore: deprecated_member_use
                    onChanged: (ThemeMode? val){
                      if (val != null){
                        themeChenge.setTheme(val);
                      }
                    },
                  ),
              
                    const SizedBox(height: 15,),
              
                    RadioListTile<ThemeMode>(
                    title: Center(child: const Text("DarkMode")),
                    value:ThemeMode.dark,
                    // ignore: deprecated_member_use
                    groupValue: themeChenge.themeMode,
                    // ignore: deprecated_member_use
                    onChanged: (ThemeMode? val){
                      if (val != null){
                        themeChenge.setTheme(val);
                      }
                    },
                  ),
              
                  const SizedBox(height:15),
              
                  RadioListTile<ThemeMode>(
                    title: Center(child: const Text("SystemMode")),
                    value:ThemeMode.system,
                    // ignore: deprecated_member_use
                    groupValue: themeChenge.themeMode,
                    // ignore: deprecated_member_use
                    onChanged: (ThemeMode? val){
                      if (val != null){
                        themeChenge.setTheme(val);
                      }
                    },
                  ),
                ],
              
                    ),
            ),
          ),
        )),
    );
  }
}