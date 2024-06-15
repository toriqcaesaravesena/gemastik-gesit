// ignore_for_file: unused_import, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gesit/utils/colors.dart';
import 'package:gesit/utils/consts.dart';
import 'package:gesit/viewmodels/user_provider.dart';
import 'package:gesit/views/shared/custom_snackbar.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _loginUser() async {
  if (_emailController.text.trim().isEmpty && _passwordController.text.trim().isEmpty) {
    CustomSnackbarLogin.showSnackBarError(context, "Email dan Kata Sandi tidak boleh kosong!");
  } else if (_emailController.text.trim().isEmpty) {
    CustomSnackbarLogin.showSnackBarError(context, "Email tidak boleh kosong!");
  } else if (_passwordController.text.trim().isEmpty) {
    CustomSnackbarLogin.showSnackBarError(context, "Kata Sandi tidak boleh kosong!");
  } else if (_isValidEmail(_emailController.text.trim())) {
    try {
      await UserProvider().signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-disabled':
          CustomSnackbarLogin.showSnackBarError(context, "Akun anda dinonaktifkan oleh administrator");
          break;
        case 'channel-error':
          CustomSnackbarLogin.showSnackBarError(context, "Data tidak boleh kosong!");
          break;
        case 'user-not-found':
          CustomSnackbarLogin.showSnackBarError(context, "Email yang anda masukkan tidak terdaftar sebagai pengguna");
          break;
        case 'too-many-requests':
          CustomSnackbarLogin.showSnackBarError(context, "Terlalu banyak permintaan, coba lagi nanti");
          break;
        case 'network-request-failed':
          CustomSnackbarLogin.showSnackBarError(context, "Terdapat kesalahan dalam jaringan, coba lagi nanti");
          break;
        case 'invalid-credential':
          CustomSnackbarLogin.showSnackBarError(context, "Alamat email dan kata sandi yang anda masukan salah");
          break;
        default:
          CustomSnackbarLogin.showSnackBarError(context, '${e.code}: ${e.message}');
      }
    }
  } else {
    CustomSnackbarLogin.showSnackBarError(context, "Email Tidak Terdaftar");
  }
}

bool _isValidEmail(String email) {
  return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Image(
              image: AssetImage("assets/images/signin.png"),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Center(
                          child: Text("Masuk",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w700)),
                        ),
                        const SizedBox(height: 20,),
                        InputTextField(
                          icon: Icons.email,
                          textEditingController: _emailController,
                          hintText: "Email",
                          textInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 24),
                        InputTextField(
                          icon: Icons.lock,
                          textEditingController: _passwordController,
                          hintText: "Kata Sandi",
                          textInputType: TextInputType.text,
                          isPass: true,
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _loginUser,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text(
                              "Masuk",
                              style: TextStyle(color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
