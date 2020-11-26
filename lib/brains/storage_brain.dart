import '../services/loader.dart';

class Store {
  final String sender;
  final String message;
  final String collection;
  final BuildContext context;

  FirebaseFirestore _store = FirebaseFirestore.instance;
  User currentUser;

  Store({
    this.sender,
    this.message,
    this.collection = 'messages',
    this.context,
  });

  void add(message) {
    _store.collection('messages').add({
      'text': message,
      'sender': Authentication().getCurrentUser(userData: 'email'),
      'user_added_at': Timestamp.now(),
      // TODO: Use Network Time Protocol (NTP)
      // This doesn't solve all the problems 
      // (The timestamp is generated at call-time,
      // not when it reaches the server),
      // but when we only need consistent timestamps in relation to our clients,
      // this solution works.
      'ntp_local_added_at': '', // used to show time for the current user
      'ntp_gmt_added_at': '', // used to order messages
    });
  }

  void getMessages() async {
    final messages = await _store.collection(collection).get();
    for (var message in messages.docs) {
      print(message.data);
    }
  }

  void messagesStream() async {
    await for (var snapshot in _store.collection(collection).snapshots())
    for (var message in snapshot.docs) {
      print(message.data);
    }
  }

  Stream<dynamic> getStreamCollection() {
    Stream<dynamic> streamCollection = _store.collection(collection).snapshots();
    return streamCollection;
  }
}
