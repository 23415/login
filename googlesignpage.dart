import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googlesignin = GoogleSignIn();
  GoogleSignInAccount? _User;
  GoogleSignInAccount? get User => _User;

  Future googleLogin() async {
    final googleUser = await googlesignin.signIn();
    if (googleUser == null) return;
    _User = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);

    notifyListeners();
  }
}
