import 'package:flutter/material.dart';
import 'package:gesit/utils/colors.dart';
import 'package:gesit/utils/consts.dart';
import 'package:gesit/viewmodels/user_provider.dart';
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

  @override
  Widget build(BuildContext context) {
    final provider = context.read<UserProvider>();

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
                            onPressed: () async {
                              String res = await provider.loginUser(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                              if (res == "success") {}
                            },
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
