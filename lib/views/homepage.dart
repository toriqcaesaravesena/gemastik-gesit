import 'package:flutter/material.dart';
import 'package:gesit/models/category_model.dart';
import 'package:gesit/utils/colors.dart';
import 'package:gesit/viewmodels/user_provider.dart';
import 'package:gesit/views/pages/information/information_page.dart';
import 'package:gesit/views/pages/pickup_trash/pickup_trash_page.dart';
import 'package:gesit/views/pages/user_profile/profile.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;

  var percentage1 = 90;
  var percentage2 = 20;
  var percentage3 = 100;
  var percentage4 = 70;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
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
          title: const Text(
            "Distrik 1",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
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
                      color: buttonColor,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 24,
                            color: whiteColor,
                          ),
                          Text(
                            "   Jl. Malioboro - Yogjakarta",
                            style: TextStyle(
                              color: whiteColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: double.infinity,
                    height: 10 * 15,
                    decoration: BoxDecoration(
                      color: darkBlueColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Ambil Sekarang !",
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "Tempat Sampah Penuh",
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CircularPercentIndicator(
                            radius: 50.0,
                            lineWidth: 10.0,
                            animation: true,
                            animationDuration: 2000,
                            percent: 70 / 100,
                            center: const Text(
                              "70%",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            progressColor: buttonColor,
                            circularStrokeCap: CircularStrokeCap.round,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Menu Utama",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const PickUpPage()),
                          );
                        },
                        child: SizedBox(
                          width: 10 * 18,
                          height: 10 * 15,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 20,
                              ),
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage(
                                      "assets/images/temukan_lokasi.png",
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Flexible(
                                    child: Center(
                                      child: Text(
                                        "Temukan Lokasi",
                                        style: TextStyle(
                                          height: 1,
                                          letterSpacing: -0.5,
                                          color: whiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          // context.go("/informasi");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const InformationPage()),
                          );
                        },
                        child: SizedBox(
                          width: 10 * 18,
                          height: 10 * 15,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: orangeColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 20,
                              ),
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage(
                                      "assets/images/informasi.png",
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Center(
                                    child: Text(
                                      "Informasi",
                                      style: TextStyle(
                                        height: 1,
                                        letterSpacing: -0.5,
                                        color: whiteColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  "Menu Lainnya",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 10 * 5,
                  color: greyLightColor,
                  child: Wrap(
                    spacing: 3,
                    children: List.generate(
                      categoryData.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              activeIndex = index;
                              for (var category in categoryData) {
                                category.active = false;
                              }
                              categoryData[index].active = true;
                            });
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: 90,
                              height: 50,
                              decoration: BoxDecoration(
                                color: categoryData[index].active
                                    ? orangeColor
                                    : greyLightColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  categoryData[index].name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: categoryData[index].active
                                        ? whiteColor
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Center(
                    child: categoryData[activeIndex].view,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
