import '../services/loader.dart';

// Usage: Navigator.pushNamed(context, '/your-route-name');
Map<String, Widget Function(BuildContext)> msRoutes = {
  WelcomeScreen.id: (context) => WelcomeScreen(),
  RegistrationScreen.id: (context) => RegistrationScreen(),
  LoginScreen.id: (context) => LoginScreen(),
  ChatScreen.id: (context) => ChatScreen(),
};