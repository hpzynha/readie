// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../widgets/dialogs/alert_dialog.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      //Captura a exceção especifica do firebaseAuth
      if (e.code == 'email-already-in-use') {
        //exibir o popup informantdo que o e-mail já está cadastrado
        showErrorMessage(context, 'errorDialog.emailAlreadyInUse'.tr());
      } else if (e.code == "user-not-found" || e.code == 'wrong-password') {
        showErrorMessage(
          context,
          'errorMessageDialog.invalidCredentials'.tr(),
        );
      } else if (e.code == 'invalid-email') {
        showErrorMessage(
          context,
          'errorMessageDialog.invalidEmail'.tr(),
        );
      } else {
        showErrorMessage(
          context,
          'errorMessageDialog.genericError'.tr(),
        );
      }
    } catch (e) {
      showErrorMessage(
        context,
        'errorMessageDialog.genericError'.tr(),
      );
    }
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser == null) {
        return null;
      }

      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      return null;
    }
  }

  signOut() {
    _firebaseAuth.signOut();
  }

  void showErrorMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return customShowAlertDialog(
          title: 'errorMessageDialog.titleDialog'.tr(),
          content: message,
          buttonText: 'errorMessageDialog.buttonDialog'.tr(),
          onPress: () => Navigator.pop(context),
        );
      },
    );
  }
}
