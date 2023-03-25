import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quantum_ui/constant/constant.dart';
import 'package:quantum_ui/view/auth.dart';
import 'package:quantum_ui/view/homepage.dart';

class AuthController extends GetxController {
  static AuthController authInstance = Get.find();
  late Rx<User?> firebaseUser;
  @override
  void onReady() {
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
    super.onReady();
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      // user logged in
      Get.offAll(() => const Homepage());
    } else {
// user is null or not logged in
      Get.offAll(() => const Auth());
    }
  }

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken, idToken: gAuth.idToken);

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.toString(),
      ));
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.toString(),
      ));
    }
  }

  void register(String email, String password) {
    try {
      auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.toString(),
      ));
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.toString(),
      ));
    }
  }

  void login(String email, String password) {
    try {
      auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.toString(),
      ));
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.toString(),
      ));
    }
  }

  void signOut() {
    try {
      auth.signOut();
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.toString(),
      ));
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.toString(),
      ));
    }
  }
}
