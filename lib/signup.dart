import 'package:flutter/material.dart';
import 'package:to_do_app/authentication/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/tasks/task_page.dart';
import 'package:to_do_app/widgets/button.dart';
import 'package:to_do_app/widgets/component.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
 
}

class _SignupState extends State<Signup> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String confirmPasswordError ='';
   
  /*   void validateConfirmPassword() {
    if (confirmPasswordController.text != passwordController.text) {
      setState(() {
        confirmPasswordError = 'Passwords do not match';
      });
    } else {
      setState(() {
        confirmPasswordError = '';
      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 10),

              Image.asset(
                'assets/images/bg.jpg',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 30),

              /// EMAIL
              Component(
                controller: emailController,
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                iconData: Icons.mail_lock_outlined,
                labelText: 'Email',
                maxLength: 60,
              ),
               if (authProvider.emailError.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                         authProvider.emailError,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                 ),
                  ),

              const SizedBox(height: 30),

              /// PASSWORD
              Component(
                controller: passwordController,
                textInputType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                iconData: Icons.remove_red_eye,
                labelText: 'Password',
                obscureText: true,
                maxLength: 30,
              ),
               if (authProvider.passwordError.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                         authProvider.passwordError,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                 ),
                  ),
              const SizedBox(height: 30),

              /// CONFIRM PASSWORD
              Component(
                controller: confirmPasswordController,
                textInputType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                iconData: Icons.remove_red_eye,
                labelText: 'Confirm Password',
                obscureText: true,
                maxLength: 30,
              ),
              if (confirmPasswordError.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                         confirmPasswordError,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                 ),
                  ),


              const SizedBox(height: 20),

              /// SIGN UP BUTTON
                CustomeButton(
                  text: authProvider.isLoading? 'Signing Up' : 'Sign Up',
                   onPressed: authProvider.isLoading ? null: () async{

                    //  Confirm password validation
                    if (confirmPasswordController.text !=
                     passwordController.text) {
                      setState(() {
                       confirmPasswordError = 'Passwords do not match';
                        });
                        return;
                        } else {
                        setState(() {
                        confirmPasswordError = '';
                      });
                    }
                    await authProvider.signUp(
                       emailController.text.trim(),
                       passwordController.text.trim(),
                    );
                     //No Error 
                    if(authProvider.errorMessage.isEmpty && 
                    authProvider.emailError.isEmpty &&
                    authProvider.passwordError.isEmpty){
                      if (!mounted) return;
                      Navigator.pushReplacement(
                       context,
                       MaterialPageRoute(builder: (_) => const TaskPage()),
                    );
                   }
                   }, 
                     backgroundColor: Colors.blueGrey, 
                      textColor: Colors.white,),
                 

              const SizedBox(height: 15),

              /// BACK TO LOGIN
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Already have an account? Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
