import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  const AuthUser({
    required this.uid,
    required this.email,
  });

  final String uid;
  final String email;
}

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthUser? _userFromFirebase(User? user) {
    if (user == null || user.email == null) {
      return null;
    }
    return AuthUser(
      uid: user.uid,
      email: user.email!,
    );
  }

  Stream<AuthUser?> get onAuthStateChanged {
    return _firebaseAuth
        .authStateChanges()
        .map((event) => _userFromFirebase(event));
  }
}
