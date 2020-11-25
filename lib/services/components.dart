import 'loader.dart';

class MsRoundedMaterialButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  const MsRoundedMaterialButton(
      {Key key, this.text, this.color, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class MsRoundedTextFeild extends StatelessWidget {
  final String hintText;
  final Color borderColor;
  final Function onChanged;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool isLight;

  const MsRoundedTextFeild({
    Key key,
    this.hintText,
    this.borderColor,
    this.onChanged,
    this.textAlign = TextAlign.center,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.isLight = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      textAlign: textAlign,
      onChanged: onChanged,
      decoration: sInputDecoration(hintText: hintText),
    );
  }
}
