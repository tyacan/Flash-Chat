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

class MsMessageBulbble extends StatelessWidget {
  final String sender;
  final String text;
  MsMessageBulbble({this.sender, this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(color: cStartColorTween, fontSize: 11.0),
          ),
          Material(
            borderRadius: BorderRadius.circular(9),
            elevation: 4.0,
            color: cEndColorTween,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 8,
              ),
              child: Text(
                text,
                style: TextStyle(color: cStartColorTween),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MsStreamBuilder extends StatelessWidget {
  final Store _store;

  MsStreamBuilder(this._store);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: cSecondaryColor,
            ),
          );
        }
        final messages = snapshot.data.docs;
        List<MsMessageBulbble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message['text'];
          final messageSender = message['sender'];

          final messageWidget = MsMessageBulbble(
            text: messageText,
            sender: messageSender,
          );
          messageBubbles.add(messageWidget);
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 7.0,
              vertical: 14.0,
            ),
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: messageBubbles,
              ),
            ],
          ),
        );
      },
      stream: _store.getStreamCollection(),
    );
  }
}
