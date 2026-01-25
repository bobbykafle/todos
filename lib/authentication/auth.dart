import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class Auth{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

   User? get currentUser => _firebaseAuth.currentUser;


   Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

   //create signIn with Email and Password 
  Future<String?> signInWithEmailAndPassword({
    required String email,
    required String password,
   }) async{
    if(!email.contains('@')) return "Invalide email formate";
    if(password.length< 8) return "Password is too short";
    try{
      await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
       password: password,
       );
   
     // checking if email is varified or not 
    /* if(!_firebaseAuth.currentUser!.emailVerified){
      await _firebaseAuth.signOut();
      return "Email is not verified";
     }*/
     return null ;
      } on FirebaseAuthException catch (e){
        return e.message ?? "Login Failed";
      }
   
   } 
    
    //signup
  Future<String?> createUserWithEmailAndPassword({
    required String email,
    required String  password,
  }) async{
    if(!email.contains('@')) return "Invalid email formate";
    if (password.length <8) return "Password is too short";
     try{
       //create new user
       UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password,);

        if(!user.user!.emailVerified){
          await user.user!.sendEmailVerification();
        } return null;

     }on FirebaseAuthException catch (e){
      return e.message ;
     }

  }

  // forgot password 
  Future<String?> sendPasswordResetEmail({
    required String email,
  }) async{
    if(!email.contains('@')) return "Invalid email Formate";
     try{
       await _firebaseAuth.sendPasswordResetEmail(
      email: email,);
      return null;
     } on FirebaseAuthException catch(e){
      return e.message;
     } catch(e){
      return e.toString();
     }
   
  }
   //Email Verification  
  Future<String?> sendEmailVarification() async{
    try{
       User? user = _firebaseAuth.currentUser;
    if(user != null && user.emailVerified){
      await user.sendEmailVerification();
      return null;
    } else {
      return 'Email alredy veerified';
    }
    } catch (e){
      return e.toString();
    }
    
  }

  //phone Authentication
  String verificationId ='';

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(String verificationId) codeSentCallback,
  }) async{
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async{
        await _firebaseAuth.signInWithCredential(credential); //Auto Verification
      },

      verificationFailed: (FirebaseAuthException e){
        print('Verification failed: ${e.message}');
      }, 

      codeSent: (String verificationId, int? resendToken){
        this.verificationId = verificationId;
        codeSentCallback(verificationId);
      }, 
      codeAutoRetrievalTimeout: (String verificationId){
        this.verificationId = verificationId;
      },
      );
  }

  //signInWith OTP
   Future<void> signInWithOTP({required String otp}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );
    await _firebaseAuth.signInWithCredential(credential);
  }

  // Anonymous account
   Future<String?> linkAnonymousToEmail({
  required String email,
  required String password,
}) async {
  try {
    final credential = EmailAuthProvider.credential(email: email, password: password);
    await _firebaseAuth.currentUser!.linkWithCredential(credential);
    return null; // success
  } on FirebaseAuthException catch (e) {
    return e.message;
  } catch (e) {
    return e.toString();
  }
}


  // SignIn with Google
    Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize();
      final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();

      if (googleUser == null) return 'Google signIn cancelled';

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;


      if (googleAuth.idToken == null) {
        return 'Failed to get Google credentials';
      }

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken:googleAuth. idToken,
      );

     // Sign in  Firebase with the Google credential
      await _firebaseAuth.signInWithCredential(credential);
      
      return null; // success
    } on FirebaseAuthException catch (e) {
      return e.message; // Firebase-specific errors
    } catch (e) {
      return e.toString(); // Other errors
    }
  }
    
  Future<void> signOut() async{
    await _firebaseAuth.signOut();

  // Sign out from Google as well
  final GoogleSignIn googleSignIn = GoogleSignIn.instance;
    await googleSignIn.signOut();
  }
}







/*   import 'package:firebase_auth/firebase_auth.dart';
class Auth{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  
   User? get currentUser => _firebaseAuth.currentUser;


   Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

   //create signIn with Email and Password 
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
   }) async{
 
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
       password: password,
       );
   
   }
    
    //signup
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String  password,
  }) async{

      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password,);


  // forgot password 
  Future<void> sendPasswordResetEmail({
    required String email,
  }) async{

    
    await _firebaseAuth.sendPasswordResetEmail(
      email: email,);
  }
   //email verified 
  Future<void> sendEmailVarification() async{
    User? user = _firebaseAuth.currentUser;
    if(user != null && user.emailVerified){
      await user.sendEmailVerification();
    }
  }
    
  }
  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }
}*/