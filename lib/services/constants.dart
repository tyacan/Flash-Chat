import 'loader.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

// colors
const Color cStartColorTween = Color(0xFF00203D);
const Color cEndColorTween = Color(0xFF8FE9CD);
const Color cPrimaryColor = Colors.blueAccent;
const Color cSecondaryColor = Colors.lightBlueAccent;

// styles
InputDecoration sInputDecoration({hintText, isLight = false}) {
  hintText = hintText == null ? 'Input a text here' : hintText;
  isLight = isLight == null ? false : isLight;
  return InputDecoration(
    hintText: hintText,
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: isLight ? cSecondaryColor : cPrimaryColor, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: isLight ? cSecondaryColor : cPrimaryColor, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );
}

// assets paths
const String logoPath = 'resources/images/logo.png';
