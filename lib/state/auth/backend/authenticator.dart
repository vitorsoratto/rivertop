import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rivertop/state/auth/constants/constants.dart';
import 'package:rivertop/state/auth/models/auth_result.dart';
import 'package:rivertop/state/posts/typedefs/user_id.dart';
import 'package:rivertop/util.dart';

class Authenticator {
  User? get user => FirebaseAuth.instance.currentUser;

  UserId? get userId => user?.uid;
  bool get isAlreadySignedIn => userId != null;
  String get displayName => user?.displayName ?? '';
  String? get email => user?.email ?? '';

  Future<AuthResult> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
        Constants.emailScope,
      ]);

      final signInAccount = await googleSignIn.signIn();

      if (signInAccount == null) {
        return AuthResult.aborted;
      }

      final googleAuth = await signInAccount.authentication;
      final oauthCredentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(oauthCredentials);
      return AuthResult.success;
    } catch (e) {
      e.log();
      return AuthResult.failure;
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}
