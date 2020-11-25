import '../services/loader.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
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
                    },
                    isLight: true,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  MsRoundedTextFeild(
                    obscureText: true,
                    hintText: 'Enter your password.',
                    onChanged: (value) {
                      //Do something with the user input.
                    },
                    isLight: true,
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  MsRoundedMaterialButton(
                    text: 'Log In',
                    color: cSecondaryColor,
                    onPressed: () {
                      //TODO: Implement login functionality.
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
