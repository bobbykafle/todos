import 'package:flutter/material.dart';
import 'package:to_do_app/otp.dart';
import 'package:to_do_app/widgets/button.dart';
import 'package:to_do_app/widgets/component.dart';

class ForgotPasswordPage extends StatelessWidget {
  final emailController = TextEditingController();
   ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Forgot Password'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'Enter your email or phone no to reset password',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 40),
            Component(
              controller: emailController, 
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done, 
              iconData: Icons.email_outlined, 
              labelText: 'Email or Phone no.'),
            const SizedBox(height: 30),

            CustomeButton(
              text: 'Send OTP',
               onPressed: (){
                Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => ConfirmOtp(),
                  ),
                  );
               }, backgroundColor: Colors.blueAccent, 
               textColor: Colors.white,), 
          
          ],
        ),
      ),
    );
  }
}
