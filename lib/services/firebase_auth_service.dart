import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel_app/models/user_model.dart';

class FirebaseaAuthService {
  static final _auth = FirebaseAuth.instance;

  //sign in with email
  Future<UserModel> signInWithEmail(String email, String password) async {
    try {
      //sign in
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      //check email verif
      bool isVerifired = this.checkEmailVerification(userCredential.user);
      //sign in or give error
      if (isVerifired)
        return UserModel(user: userCredential.user);
      else {
        //sign out
        await this.signOut();
        //throw error instead this
        return UserModel.unverifiedEmail();
      }
    } on FirebaseAuthException catch (e) {
      //handle exception
      return UserModel.failure(errorMessage: e.code);
    }
  }

  //sign up with email
  Future<UserModel> signUpWithEmail(String email, String password) async {
    try {
      //sign up
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //send email link
      await this.sendVerifyEmailLink(userCredential.user);
      //sign out so that user can sign in again after email verification
      await this.signOut();
      return UserModel.sentEmailLink();
    } on FirebaseAuthException catch (e) {
      //handle exception
      throw UserModel.failure(errorMessage: e.code);
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

  //google sign in
  Future<UserModel> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();

      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCred =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return UserModel(user: userCred.user);
    } catch (e) {
      print(e.toString());
      return UserModel.failure(errorMessage: e.toString());
    }
  }
}
