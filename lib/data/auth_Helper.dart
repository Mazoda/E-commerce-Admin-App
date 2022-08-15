
import 'package:adminfirebas/AppRouter/AppRouter.dart';
import 'package:adminfirebas/views/screens/FirstScreen.dart';
import 'package:adminfirebas/views/screens/HomePageScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?>  signIn(String emailAddress, String pass) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
          email: emailAddress, password: pass);
          return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  signUp(String email, String pass) async {
    try {   
      UserCredential  credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
  return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  checkUser() async {
    User? user = firebaseAuth.currentUser;
    if (user == null) {
      AppRoute.PushToWidget(FirstScreen());
    } else {
      AppRoute.PushToWidget(HomePage());
    }
  }

  signOut() {
    firebaseAuth.signOut();
  
  }
}
