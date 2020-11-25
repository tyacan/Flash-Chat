import '../services/loader.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'RegistrationScreen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // Authentication _auth = Authentication();

  /// * src => https://firebase.flutter.dev/docs/overview/
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) {
        print('onMessage called: $message');
      },
      onResume: (Map<String, dynamic> message) {
        print('onResume called: $message');
      },
      onLaunch: (Map<String, dynamic> message) {
        print('onLaunch called: $message');
      },
    );
    firebaseMessaging.getToken().then((token) {
      print('FCM Token: $token');
    });
  }

  void reg() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "muathye1@gmail.com",
        password: "SuperSecretPassword!",
      );
      print(userCredential.toString());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  /// * ./src => https://firebase.flutter.dev/docs/overview/

  /// * https://firebase.flutter.dev/docs/auth/usage
  FirebaseAuth auth = FirebaseAuth.instance;

  /// * ./https://firebase.flutter.dev/docs/auth/usage

  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    /// * src => https://firebase.flutter.dev/docs/overview/
    // Show error message if initialization failed
    if (_error) {
      print('erorr init');
      // return SomethingWentWrong();
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      print('init load');
      // return Loading();
    }

    /// * ./src => https://firebase.flutter.dev/docs/overview/

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: logoPath,
                    child: Container(
                      height: 200.0,
                      child: Image.asset(logoPath),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  MsRoundedTextFeild(
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Enter your email',
                    onChanged: (value) {
                      //Do something with the user input.
                      email = value;
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  MsRoundedTextFeild(
                    obscureText: true,
                    hintText: 'Enter your password',
                    onChanged: (value) {
                      //Do something with the user input.
                      password = value;
                    },
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  MsRoundedMaterialButton(
                    text: 'Register',
                    color: cPrimaryColor,
                    onPressed: () async {
                      //TODO: Implement registration functionality.
                      print(email + ' | ' + password);
                      // await _auth.register(
                      //   email,
                      //   password,
                      //   context,
                      //   ChatScreen.id,
                      // );

                      // try {
                      //   final FirebaseUser newUser = await FirebaseAuth.instance
                      //       .createUserWithEmailAndPassword(
                      //           email: email, password: password);
                      //   if (newUser != null) {
                      //     Navigator.pushNamed(context, ChatScreen.id);
                      //     return newUser;
                      //   }
                      // } catch (e) {
                      //   print(e);
                      // }

                      // try {
                      //   UserCredential userCredential = await FirebaseAuth
                      //       .instance
                      //       .createUserWithEmailAndPassword(
                      //     email: email,
                      //     password: password,
                      //   );
                      // } on FirebaseAuthException catch (e) {
                      //   if (e.code == 'weak-password') {
                      //     print('The password provided is too weak.');
                      //   } else if (e.code == 'email-already-in-use') {
                      //     print('The account already exists for that email.');
                      //   }
                      // } catch (e) {
                      //   print(e);
                      // }
                      setState(() {
                        reg();
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
