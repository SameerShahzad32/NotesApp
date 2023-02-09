import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class NotesAppFirebaseUser {
  NotesAppFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

NotesAppFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<NotesAppFirebaseUser> notesAppFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<NotesAppFirebaseUser>(
      (user) {
        currentUser = NotesAppFirebaseUser(user);
        return currentUser!;
      },
    );
