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

  /// Attempts to sign in a user with the given email address and password.
  ///
  /// If successful, it also signs the user in into the app and updates
  /// any [authStateChanges], [idTokenChanges] or [userChanges] stream
  /// listeners.
  ///
  /// **Important**: You must enable Email & Password accounts in the Auth
  /// section of the Firebase console before being able to use them.
  ///
  /// A [FirebaseAuthException] maybe thrown with the following error code:
  /// - **invalid-email**:
  ///  - Thrown if the email address is not valid.
  /// - **user-disabled**:
  ///  - Thrown if the user corresponding to the given email has been disabled.
  /// - **user-not-found**:
  ///  - Thrown if there is no user corresponding to the given email.
  /// - **wrong-password**:
  ///  - Thrown if the password is invalid for the given email, or the account
  ///    corresponding to the email does not have a password set.
  Future<void> login(
    email,
    password,
    context,
    routeToNamedNavigator,
  ) async {
    print('==========try login==========');
    try {
      // return type for newUser is UserCredential;
      final newUser = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (newUser != null) {
        Navigator.pushNamed(context, routeToNamedNavigator);
        print('==========login done==========');
        return newUser;
      }
    } catch (e) {
      print(e);
    }
  }

  /// Signs out the current user.
  ///
  /// If successful, it also updates
  /// any [authStateChanges], [idTokenChanges] or [userChanges] stream
  /// listeners.
  void logout(context) {
    print('==========try logout==========');
    try {
      // return type for newUser is UserCredential;
      _auth.signOut();
      Navigator.pop(context);
      print('==========logout done==========');
    } catch (e) {
      print(e);
    }
  }

  dynamic getCurrentUser({userData}) {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        currentUser = user;
        switch (userData) {
          case 'displayName':
            {
              return currentUser.displayName;
            }
            break;

          case 'email':
            {
              return currentUser.email;
            }
            break;

          case 'emailVerified':
            {
              return currentUser.emailVerified;
            }
            break;

          case 'isAnonymous':
            {
              return currentUser.isAnonymous;
            }
            break;

          case 'creationTime':
            {
              return currentUser.metadata.creationTime;
            }
            break;

          case 'lastSignInTime':
            {
              return currentUser.metadata.lastSignInTime;
            }
            break;

          case 'phoneNumber':
            {
              return currentUser.phoneNumber;
            }
            break;

          case 'photoURL':
            {
              return currentUser.photoURL;
            }
            break;

          default:
            {
              return currentUser;
            }
        }
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
