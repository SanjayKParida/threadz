import 'package:ecommerce_app/screens/auth_views/login_screen.dart';
import 'package:ecommerce_app/screens/navigation_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //APP WOULD BE NOTIFIED
    _user.bindStream(auth.userChanges());

    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => NavigationScreen());
    }
  }

  void register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Error Occurred :/',
        duration: Duration(milliseconds: 900),
      ));
    }
  }

  void signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Login Failed :/',
        duration: Duration(milliseconds: 900),
      ));
    }
  }

  void logout() {
    try {
      auth.signOut();
    } catch (e) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Error Occurred :/',
        duration: Duration(milliseconds: 900),
      ));
    }
  }
}

class AuthService {
  //GOOGLE SIGN IN
  signInWithGoogle() async {
    //OPEN UP THE ACCOUNTS LIST
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //AUTHENTICATION REQUEST FROM GOOGLE
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //CREATE NEW USER CREDENTIALS
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    //SIGN IN USER
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
