import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:to_do_app/ThemeChange/theme_color.dart';
import 'package:to_do_app/home.dart';
import 'package:to_do_app/widgets/app_text.dart';
import 'package:to_do_app/widgets/button.dart';

 class ConfirmOtp extends StatefulWidget {
  const ConfirmOtp({super.key});

  @override
  State<ConfirmOtp> createState() => _ConfirmOtpState();
}

class _ConfirmOtpState extends State<ConfirmOtp> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String validPin ='1234';
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
    backgroundColor: ThemeColor.background(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60,horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Center(
              child: 
              const SizedBox(
                height: 50,
              ),
            ),

                   AppText(text:
                     "Confirm OTP",
                     fontSize: 20,
                     ),
                    const SizedBox(
                      height: 50,
                    ),

                    AppText(text: "Enter the OTP sent in your Phone No",
                    fontSize: 16,
                    
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                  _pinInputForm(),
           ]  
        ),
      ),
    ),
    );
  }



  _pinInputForm() {
    return Form(
      key: formkey,
      child: Column(
      children: [Pinput(
        length:4,
        validator: (value){
          if(value == validPin){
            return null;
          }
          else{
            return "PIN is incorrect";
          }
        },

       onCompleted: (pin){
        if(pin == validPin){
         //optional auto-submit 
        }
       },

      ),
      const SizedBox(
        height: 20,
      ),

      CustomeButton(
        text: 'Sign In', 
        onPressed: (){
          Navigator.push(context,
          MaterialPageRoute(builder: (_)
          => MyHomePage(),),);
        },
         backgroundColor: Colors.blue, 
         textColor: Colors.white)
      
        ],
    ),
    );
  }
  }