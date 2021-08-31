import 'package:firebase_auth/firebase_auth.dart';

class FirebaseaAuthService {
  static final _auth = FirebaseAuth.instance;

  //sign in with email
  Future<User> signInWithEmail(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      //handle exception instead vof throwing exception
      throw FirebaseAuthException(code: e.code);
    }
  }

  //sign up with email
  Future<User> signUpWithEmail(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      //handle exception instead vof throwing exception
      throw FirebaseAuthException(code: e.code);
    }
  }

  //verify email
  Future<void> sendVerifyEmailLink(User? user) async {
    await user!.sendEmailVerification();
  }

  //check if email verified
  bool checkEmailVerification(User? user) {
    return user!.emailVerified ? true : false;
  }

  //sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  //check if user is null
  bool isUserNull() {
    return _auth.currentUser == null ? true : false;
  }

  //auth state changes
  Stream<User?> authStateChanges() async* {
    yield* _auth.authStateChanges();
  }
}
