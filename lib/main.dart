import './services/loader.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: msRoutes,
    );
  }
}