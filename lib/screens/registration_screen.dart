import '../services/loader.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'RegistrationScreen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  bool showSpinning = false;
  @override
  void initState() {
    showSpinning = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Authentication _auth = Authentication();
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinning,
        child: SafeArea(
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
                        print(email + ' | ' + password);
                        setState(() {
                          showSpinning = true;
                        });
                        await _auth.register(
                          email,
                          password,
                          context,
                          ChatScreen.id,
                        );
                        // TODO: Ask why is this working (Stoping showSpinner) !!!!!
                        setState(() {
                          showSpinning = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
