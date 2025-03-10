import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var cred = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // cred.;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      } else if (e.code == 'invalid-credential') {
        throw Exception('An error occurred hehe');
      } else {
        throw Exception('An error occurred');
      }
    }
  }

  static Future<void> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      } else {
        throw Exception('An error occurred');
      }
    }
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Stream<User?> get authStateChanges =>
      FirebaseAuth.instance.authStateChanges();
}
