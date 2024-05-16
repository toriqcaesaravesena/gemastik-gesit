import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String username;
  final String email;
  final int phone;
  final String date;

  const UserModel({
    required this.uid,
    required this.username,
    required this.email,
    required this.phone,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "username": username,
    "email": email,
    "phone": phone,
    "date": date,
  };

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>?; // Handle null safety

    if (snapshot == null) {
      
      return const UserModel(
        uid: '',
        username: 'Guest',
        email: 'guest@example.com',
        phone: 0,
        date: '',
      );
    }

    return UserModel(
      uid: snapshot['uid'] ?? '',
      username: snapshot['username'] ?? 'Guest',
      email: snapshot['email'] ?? 'guest@example.com',
      phone: snapshot['phone'] ?? 0,
      date: snapshot['date'] ?? '',
    );
  }
}
