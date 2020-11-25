import '../services/loader.dart';

class Authentication {
  final String password;
  final String email;
  final BuildContext context;
  final String routeToNamedNavigator;

  FirebaseAuth _auth = FirebaseAuth.instance;
  User currentUser;

  Authentication({
    this.email,
    this.password,
    this.context,
    this.routeToNamedNavigator,
  });

  /// Tries to create a new user account with the given email address and
  /// password.
  ///
  /// A [FirebaseAuthException] maybe thrown with the following error code:
  /// - **email-already-in-use**:
  ///  - Thrown if there already exists an account with the given email address.
  /// - **invalid-email**:
  ///  - Thrown if the email address is not valid.
  /// - **operation-not-allowed**:
  ///  - Thrown if email/password accounts are not enabled. Enable
  ///    email/password accounts in the Firebase Console, under the Auth tab.
  /// - **weak-password**:
  ///  - Thrown if the password is not strong enough.
  Future<void> register(
    email,
    password,
    context,
    routeToNamedNavigator,
  ) async {
    print('==========try register==========');
    try {
      // return type for newUser is UserCredential;
      final newUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (newUser != null) {
        Navigator.pushNamed(context, routeToNamedNavigator);
        print('==========register done==========');
        return newUser;
      }
    } catch (e) {
      print(e);
    }
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        currentUser = user;
        print('Logged in user: ' + currentUser.toString());
        /*
        I/flutter (29805): Logged in user: User(
          displayName: null,
          email: muathye@gmail.com,
          emailVerified: false,
          isAnonymous: false,
          metadata: UserMetadata(
            creationTime: 2020-11-25 20:39:24.653,
            lastSignInTime: 2020-11-25 20:39:24.653
          ),
          phoneNumber: null,
          photoURL: null,
          providerData,
          [
            UserInfo(
              displayName: null,
              email: muathye@gmail.com,
              phoneNumber: null,
              photoURL: null,
              providerId: password,
              uid: muathye@gmail.com
            )
          ],
          refreshToken: ,
          tenantId: null,
          uid: q0AppRlOPGOLlPIgC8etqlkurb52
          )
        */
      }
    } catch (e) {
      print("==========user error==========");
      print(e);
    }
  }
}
