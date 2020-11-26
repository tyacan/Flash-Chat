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
