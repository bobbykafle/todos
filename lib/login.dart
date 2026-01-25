// ignore_for_file: unused_local_variable, use_build_context_synchronously
import 'package:to_do_app/authentication/auth_provider.dart';
import 'package:to_do_app/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/forgect_password.dart';
import 'package:to_do_app/tasks/task_page.dart';
import 'package:to_do_app/widgets/button.dart';
import 'package:to_do_app/widgets/component.dart';
class Login extends StatefulWidget {
  
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  bool _isCheckboxChecked = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
    
  /*ignore: unused_field
  final Auth _auth = Auth();
  bool isLogin = true;
  bool isLoading = false; // true when firebase is proocess
    //Helper to show SnackBar 
    void _showSnack(String message){
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(message)));
    }

    //Helper to clear input field 
    void _clearFields(){
      emailController.clear();
      passwordController.clear();
     }

     //Signle function for login And Signup 
     Future <void> _submit() async{
      setState(() => isLoading = true);
     try{
      if(isLogin){
        await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(), 
          password: passwordController.text.trim(),
          );
          _showSnack('Login Sucessfully!');
      } else{
        await _auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(), 
          password: passwordController.text.trim(),
          );
          _showSnack('Account Created Sucessfully!');
      }
         _clearFields();
     } on FirebaseAuthException catch(e){
      _showSnack(e.message?? 'Something went wrong');
     } finally{
      setState(() => isLoading = false);
     }
     }

     //Toggle between login  and signup 
     void toggleForm() => setState(()=> isLogin = !isLogin);
     
      onPressed: _submit,// single function handles both login/signup
      child:Text(isLogin? 'Login' : 'Sign Up',
     */
  /*before code 
  Future<void> login() async{
     setState(() => isLoading = true);
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful!')),
      );

      // Clear fields
      emailController.clear();
      passwordController.clear();
   
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }   finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> signUp() async{
     setState(() => isLoading = true);
    try{
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        );
          ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account created successfully!')),
      );

      // Clear fields
      emailController.clear();
      passwordController.clear();
    } on FirebaseAuthException catch (e){
      setState((){
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      }
      );
    } finally {
      setState(() => isLoading = false);
  }
  }

   // TOGGLE LOGIN/SIGNUP
  void toggleForm() {
    setState(() {
      isLogin = !isLogin; // switch mode 
    });
  }*/
  @override
  Widget build(BuildContext context) {
   final authProvider = context.watch<AuthProvider>(); //listen to the provider 

    return Scaffold(
      
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 09.0, horizontal: 15.0),
          child: Column(
              
              children: [
                const SizedBox(
                  height: 250,
                  ),
                //Image.asset(
                   //'assets/images/bg.jpg',
                   //height: 250,
                    //width: double.infinity,
                    //fit: BoxFit.cover, ),
                
                const SizedBox(
                  height: 30,
                ),
                
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

                 const SizedBox(
                  height: 30,
                ),
                
        
                Component(
                controller: passwordController,
                 textInputType: TextInputType.visiblePassword, 
                 textInputAction: TextInputAction.done, 
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

        
              const SizedBox(
                  height: 20,
                ),
                 Row(
                  children: [
                    Checkbox(
                      
                      value: _isCheckboxChecked,

                      onChanged: (value){
                        setState(() {
                          _isCheckboxChecked = value!;
                        });
                      }), 
                      const Text('Remember me',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        
                      ),),
                      Spacer(),
                      TextButton(
                        onPressed: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder:  (context) => ForgotPasswordPage()),
                            
                            ); },
                        child: Text('Forgot password',
                         style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        
                      ),
                        ),
                        ),
                        
                  ],
                  
                 ),
                 const SizedBox(
                  height: 10,
                 ),
         
                 
                CustomeButton(
                  text: authProvider.isLoading? 'Signing In' : 'Sign In',
                   onPressed: authProvider.isLoading ? null: () async{
                    await authProvider.signIn(
                       emailController.text.trim(),
                       passwordController.text.trim(),
                    );
                     //No Error 
                    if(authProvider.errorMessage.isEmpty && authProvider.passwordError.isEmpty){
                     /*  ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(
                          content: Text(authProvider.errorMessage),
                          backgroundColor: Colors.redAccent,
              ),
            );
                    } else {// Navigate only if login succeeds*/
                      if (!mounted) return;
                      Navigator.pushReplacement(
                       context,
                       MaterialPageRoute(builder: (_) => TaskPage()),
            );
          }
       }, 
                     backgroundColor: Colors.blueGrey, 
                      textColor: Colors.white,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text("Don't have account?",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),),

                          
                      TextButton(
                        onPressed: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder:  (context) => const Signup()),
                            
                            ); },
                        child: Text('SignUp',
                         style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        
                      ),
                        ),
                        ),


                        ],
                      )
            

              ],
            
        
              
             
            ),
        
        ),
      ),
      
        
    );
  }
}