import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:probot/env.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../config.dart';
import '../../utils/general_utils.dart';

class SignInController extends GetxController {
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> signInGlobalKey = GlobalKey<FormState>();

  String? userNameGoogle = "";
  String? userName = "";
  bool obscureText = true;

  //password obscure
  onObscure() {
    obscureText = !obscureText;
    update();
  }

  // SignIn With Google Method
  Future signInWithGoogle() async {
    appCtrl.isGuestLogin = false;
    appCtrl.storage.write(session.isGuestLogin, false);
    log("message");
    isLoading = true;
update();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    User? user = (await auth.signInWithCredential(credential)).user;
    update();
    userNameGoogle = user!.email;
    isLoading = false;
    update();
    appCtrl.storage.write("userName", userNameGoogle);
    appCtrl.storage.write("name", user.displayName);
    await checkData();
    Get.offAllNamed(routeName.selectLanguageScreen);
  }

  // Sign In With Email & Password Method
  signInMethod() async {
    appCtrl.isGuestLogin = false;
    appCtrl.storage.write(session.isGuestLogin, false);
    if (signInGlobalKey.currentState!.validate()) {
      isLoading = true;
      update();
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString());

        var signIn = FirebaseAuth.instance.currentUser;
        userName = signIn!.email;
        update();
        isLoading = false;
        appCtrl.storage.write("userName", userName);
        appCtrl.storage.write("name", signIn.displayName);
        await checkData();
        Get.offAllNamed(routeName.selectLanguageScreen);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          isLoading = false;
update();
          snackBarMessengers(message: appFonts.wrongPassword);
        } else if (e.code == 'user-not-found') {
          isLoading = false;
          update();
          snackBarMessengers(message: appFonts.userNotFound);
        }
      } catch (e) {
        isLoading = false;
        update();
        snackBarMessengers(message: appFonts.unknownError);
      }
    }
  }

  //sign in with apple
  signInWithApple() async {
    appCtrl.isGuestLogin = false;
    appCtrl.storage.write(session.isGuestLogin, false);
    isLoading = true;
    update();
    try {
      final rawNonce = generateNonces();
      final nonce = sha256ofString(rawNonce);

      // Request credential for the currently signed in Apple account.
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      log("CRED : $appleCredential");
      final oauthCredential = OAuthProvider("apple.com").credential(
          idToken: appleCredential.identityToken,
          rawNonce: rawNonce,
          accessToken: appleCredential.authorizationCode);

      log("AUTH : $oauthCredential");
      update();

      await FirebaseAuth.instance
          .signInWithCredential(oauthCredential)
          .then((value) async {
        var signIn = FirebaseAuth.instance.currentUser;
        userName = signIn!.email;
        isLoading = false;
        update();

        appCtrl.storage.write("userName", userName);
        appCtrl.storage.write("name", signIn.displayName);
        await checkData();
        Get.offAllNamed(routeName.selectLanguageScreen);
      });
      update();
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      update();

      snackBarMessengers(message: e.code);
    } catch (e) {
      isLoading = false;
      update();

      log("ERROR CATHC ; $e");
    }
  }

  checkData() async {
    await FirebaseFirestore.instance
        .collection("userSubscribe")
        .where("email", isEqualTo: appCtrl.storage.read("userName"))
        .limit(1)
        .get()
        .then((value) {
      log("DATA : ${value.docs.isEmpty}");
      if (value.docs.isNotEmpty) {
        appCtrl.envConfig["chatTextCount"] = value.docs[0].data()["chatCount"];
        appCtrl.envConfig["imageCount"] = value.docs[0].data()["imageCount"];
        appCtrl.envConfig["textCompletionCount"] =
            value.docs[0].data()["textCompletionCount"];
        appCtrl.storage.write(session.envConfig, appCtrl.envConfig);
        appCtrl.envConfig = appCtrl.storage.read(session.envConfig);
      } else {
        appCtrl.envConfig = environment;
        appCtrl.storage.write(session.envConfig, appCtrl.envConfig);
        appCtrl.envConfig = appCtrl.storage.read(session.envConfig);
      }
    });
  }

  @override
  void onClose() {
    signInGlobalKey.currentState;
    // TODO: implement onClose
    super.onClose();
  }
}
