import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gesit/models/user_model.dart';
import 'package:gesit/views/auth/signin_page.dart';

class UserProvider with ChangeNotifier {

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool get isSignedIn => _auth.currentUser != null;

  UserModel? _user;

  UserModel? get getUser => _user;

  Future<UserModel?> getUserDetails() async {
    if (_auth.currentUser != null) {
      User currentUser = _auth.currentUser!;
      DocumentSnapshot snap = await _fireStore.collection('users').doc(currentUser.uid).get();
      return UserModel.fromSnap(snap);
    } else {
      log("Tidak ada pengguna yang masuk.");
      return null;
    }
  }

  Future<void> refreshUser() async {
    UserModel? user = await getUserDetails();
    if (user != null) {
      _user = user;
    } else {
      const SignInPage();
    }
    notifyListeners();
  }

  // Login User
  Future<void> loginUser(
      {required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    notifyListeners();
  }

  // Sign Out User
  Future<void> signOutUser() async {
    await _auth.signOut();
    notifyListeners();
  }
}