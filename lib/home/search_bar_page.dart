import 'package:flutter/material.dart';
import 'package:to_do_app/ThemeChange/theme_color.dart';
class SearchBarPage extends StatelessWidget {
  const SearchBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                decoration: BoxDecoration(
                  border: BoxBorder.all(
                    width:1.0,
                    color:  ThemeColor.lightGray(context),
                    ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  textAlign: TextAlign.left, 
                  style: TextStyle(
                    fontSize: 15,
                   color: ThemeColor.text(context), 
                  ),
                 decoration: InputDecoration(
                    hintText: "search...",
                    
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search,
                    color: ThemeColor.icon(context),
                    size: 15,),
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 40,
                      minHeight: 40,
                    )
                  ),
                 
                ),
              );
  }
}