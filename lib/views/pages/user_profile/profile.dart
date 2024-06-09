// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:gesit/utils/colors.dart';
import 'package:gesit/viewmodels/user_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text(
          "Data Diri",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
              child: CircleAvatar(
            radius: 65,backgroundColor: blueColor,
            // child: const Image(image: AssetImage("assets/images/profile.png")),
          )),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text("Ave Senadi Prayogo",
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: -1,
                    fontWeight: FontWeight.w600)),
          ),
          const Center(
            child: Text("Petugas Sampah Malioboro",
                style: TextStyle(
                    fontSize: 16,
                    letterSpacing: -0.3,
                    fontWeight: FontWeight.w400)),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: 10 * 8,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: lightBlueColor,
                                radius: 24,
                                child: const Icon(Icons.person, color: profileColor,),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 150,
                                    // color: Colors.grey,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Nama Lengkap",
                                          style: TextStyle(
                                              letterSpacing: -0.3,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Ave Senadi Prayogo",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: greyColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 57),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          size: 40,
                                          color: greyColor,
                                        )),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                      width: double.infinity,
                      height: 10 * 8,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: lightBlueColor,
                                radius: 24,
                                child: const Icon(Icons.email, color: profileColor,),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 150,
                                    // color: Colors.grey,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Alamat Email",
                                          style: TextStyle(
                                              letterSpacing: -0.3,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "distrika@gmail.com",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: greyColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 57),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          size: 40,
                                          color: greyColor,
                                        )),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                      width: double.infinity,
                      height: 10 * 8,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: lightBlueColor,
                                radius: 24,
                                child: const Icon(Icons.phone_iphone, color: profileColor,),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 150,
                                    // color: Colors.grey,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Nomor Telepon",
                                          style: TextStyle(
                                              letterSpacing: -0.3,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "081338064099",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: greyColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 57),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          size: 40,
                                          color: greyColor,
                                        )),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                      width: double.infinity,
                      height: 10 * 8,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: lightBlueColor,
                                radius: 24,
                                child: const Icon(Icons.date_range, color: profileColor,),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 150,
                                    // color: Colors.grey,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Tanggal Lahir",
                                          style: TextStyle(
                                              letterSpacing: -0.3,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "04 Maret 2004",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              letterSpacing: -0.5,
                                              color: greyColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 57),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          size: 40,
                                          color: greyColor,
                                        )),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Provider.of<UserProvider>(context, listen: false)
                          .signOutUser();
                    },
                    child: SizedBox(
                        width: double.infinity,
                        height: 10 * 8,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: lightBlueColor,
                                  radius: 24,
                                  child: const Icon(Icons.exit_to_app, color: profileColor),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                      width: 150,
                                      // color: Colors.grey,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Keluar",
                                            style: TextStyle(
                                                letterSpacing: -0.3,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 57),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            size: 40,
                                            color: greyColor,
                                          )),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
