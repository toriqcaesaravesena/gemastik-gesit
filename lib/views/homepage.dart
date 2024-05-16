import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gesit/utils/colors.dart';
import 'package:gesit/viewmodels/user_provider.dart';
import 'package:gesit/views/pages/user_profile/profile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                IconButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.account_circle,
                    size: 40,
                  ),
                ),
                const SizedBox(width: 10 * 10),
                const Text(
                  "Distrik 1",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  await Provider.of<UserProvider>(context, listen: false)
                      .signOutUser();
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      width: double.infinity,
                      height: 10 * 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: buttonColor),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 24,
                              color: whiteColor,
                            ),
                            Text("   Jl. Malioboro - Yogjakarta",
                                style: TextStyle(
                                    color: whiteColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Container(
                        width: double.infinity,
                        height: 10 * 15,
                        // color: Colors.red,
                        decoration: BoxDecoration(
                          color: darkBlueColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Ambil Sekarang !",
                                      style: TextStyle(
                                          color: whiteColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18)),
                                  const Text("Tempat Sampah Penuh",
                                      style: TextStyle(
                                          color: whiteColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          letterSpacing: -0.5)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        // Logic Button
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: buttonColor),
                                      child: const Text(
                                        "Lihat Sekarang",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ))
                                ],
                              ),
                              SizedBox(
                                  width: 10 * 10,
                                  height: 10 * 10,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: buttonColor,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: const Center(
                                        child: Text("80%",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600))),
                                  ))
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("Menu Utama",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 10 * 18,
                          height: 10 * 15,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage("assets/images/temukan_lokasi.png"),
                                  ),
                                  SizedBox(height: 5,),
                                  Center(child: Text("Temukan Lokasi"))
                                ],
                              ),
                            ),
                          ),
                        ),
                        
                      ])
                ],
              ),
            ),
          )),
    );
  }
}
