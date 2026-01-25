import 'package:flutter/material.dart';
// ignore: must_be_immutable
class Component extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final IconData iconData;
  final String labelText;
  Function()? onIconButtonPressed;
  bool obscureText;
  final int? maxLength;

 Component({
    super.key,
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    required this.iconData ,
    required this.labelText,
    this.onIconButtonPressed,
    this.obscureText = false,
    this.maxLength,
    
    });

  @override
  State<Component> createState() => _ComponentState();
}

class _ComponentState extends State<Component> {
  late bool _obscure;

  @override
 void initState(){
  super.initState();
  _obscure = widget.obscureText;
 }


  @override
  Widget build(BuildContext context) {
    return TextField(
                  controller: widget.controller,
                  textInputAction: widget.textInputAction,
                  keyboardType: widget.textInputType,
                  obscureText: _obscure,
                  maxLength: widget.maxLength,
                  style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  labelText: widget.labelText,
                   suffixIcon:widget.obscureText? IconButton(
                    onPressed: (){
                      setState(() {
                        _obscure = !_obscure;
                      });
                    }, 
                    icon: Icon(
                      _obscure ? Icons.remove_red_eye : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    ): Icon(widget.iconData, color: Colors.white),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                ),
      
              ) ;
  }
}