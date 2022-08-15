
import 'package:adminfirebas/AppRouter/AppRouter.dart';
import 'package:adminfirebas/data/auth_Helper.dart';
import 'package:adminfirebas/data/fireStore_Helper.dart';
import 'package:adminfirebas/views/screens/HomePageScreen.dart';
import 'package:adminfirebas/views/screens/LoginScreen.dart';
import 'package:adminfirebas/views/widgets/successfulregister.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

class AuthProvider extends ChangeNotifier {
  String error = "                                  ";
  bool passwordVisible = true;
  bool value = false;
  bool confirmpasswordVisible = true;
  GlobalKey<FormState> registerKey = GlobalKey();
  GlobalKey<FormState> loginkey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  // TextEditingController emaillogin = TextEditingController();

  TextEditingController passlogin = TextEditingController();

  void toggle() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  void toggle2() {
    confirmpasswordVisible = !confirmpasswordVisible;
    notifyListeners();
  }

  // errors(String name) {
  //   name = " Incorrect Email or Password ";
  //   notifyListeners();
  // }

  nullValidation(String v) {
    if (v.isEmpty || v == null) {
      return "This field is required";
    }
  }

  signIn(String emailAddress, String password,BuildContext context) async {
     if (Provider.of<AuthProvider>(context, listen: false)
                            .loginkey
                            .currentState!
                            .validate()) {
    UserCredential? user =
        await AuthHelper.authHelper.signIn(emailAddress, password);
    if (user != null) {
      AppRoute.PushWithReplacementToWidget(const HomePage());
      email.clear();
      pass.clear();
      error = "";
      notifyListeners();
    } else if (user == null) {
      error = "Incorrect Email or Password ";
      notifyListeners();
    }
    }
  }

  signUp(String emailAddress, String password) async {
    UserCredential credential =
        await AuthHelper.authHelper.signUp(emailAddress, password);
    if (credential != null) {
      AppRoute.PushWithReplacementToWidget(SuccessfulSignUp());
      FireStoreHelper.firestore.addUserToFireBase(
          username.text, credential.user!.email!, credential.user!.uid);
    }
    confirmpassword.clear();
    email.clear();
    pass.clear();
    username.clear();
    notifyListeners();
  }

  checkUser() async {
    await AuthHelper.authHelper.checkUser();
    notifyListeners();
  }

  signOut() async {
    await AuthHelper.authHelper.signOut();
    // AppRoute.PushWithReplacementToWidget(LoginScreen());
    notifyListeners();
  }

  String? password(String? v) {
    if (v!.length < 6) {
      return 'password must be more than 6';
    }
    notifyListeners();
  }

  String? passwordLogin(String? v) {
    if (v!.length < 6) {
      return 'password must be more than 6';
    }
    notifyListeners();
  }

  String? confirmpass(String? v) {
    if (v != pass.text) {
      return 'password is not the same';
    }
    notifyListeners();
  }

  String? userName(String? v) {
    if (v!.length < 4) {
      return 'UserName must be more than 4 letters';
    } else if (v.length > 8) {
      return "UserName must be less than 8 letters";
    }
    notifyListeners();
  }

  String? emailValidator(String? v) {
    if (!isEmail(v!)) {
      return 'invalid email syntax';
    }
    notifyListeners();
  }

  String? emailValidatorlogin(String? v) {
    if (!isEmail(v!)) {
      return 'invalid email syntax';
    }
    notifyListeners();
  }

  String? checkBoxValidator(bool? x) {
    if (!(x!)) {
      return 'you have to accept our conditions first';
    }
    notifyListeners();
  }
}
