import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gesit/models/category_model.dart';
import 'package:gesit/utils/colors.dart';
import 'package:gesit/viewmodels/trash_provider.dart';
import 'package:gesit/views/pages/information/information_page.dart';
import 'package:gesit/views/pages/pickup_trash/pickup_trash_page.dart';
import 'package:gesit/views/pages/user_profile/profile.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:gesit/views/shared/container_menu_lainnya.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;

  String location = "Memuat Lokasi...";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TrashProvider>(context, listen: false).fetchAllPercentages();
    });
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (!mounted) return;
      setState(() {
        location = "Location services are disabled.";
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (!mounted) return;
        setState(() {
          location = "Location permissions are denied.";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (!mounted) return;
      setState(() {
        location = "Location permissions are permanently denied.";
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    _getPlaceName(position.latitude, position.longitude);
  }

  Future<void> _getPlaceName(double lat, double long) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
      Placemark place = placemarks[0];
      if (!mounted) return;
      setState(() {
        location = "${place.locality}";
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        location = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
              icon: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.account_circle,
                  size: 40,
                ),
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
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: buttonColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 24,
                            color: whiteColor,
                          ),
                          Text(
                            location,
                            style: const TextStyle(
                              color: whiteColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              overflow: TextOverflow.fade,
                            ),
                            maxLines: 1,
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
                    height: 150,
                    decoration: BoxDecoration(
                      color: darkBlueColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Consumer<TrashProvider>(
                      builder: (context, trashProvider, child) {
                        final percentage1 = trashProvider.percentage1;
                        final percentage2 = trashProvider.percentage2;
                        final percentage3 = trashProvider.percentage3;
                        final percentage4 = trashProvider.percentage4;
                        final percentageTotal = percentage1 +
                            percentage2 +
                            percentage3 +
                            percentage4;
                        final percentageAvg = percentageTotal / 4;
                        return Padding(
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
                                percent: percentageAvg / 100,
                                center: Text(
                                  "${percentageAvg.toInt()}%",
                                  style: const TextStyle(
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
                        );
                      },
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
                          width: 170,
                          height: 150,
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
                                    image: AssetImage(
                                        "assets/images/temukan_lokasi.png"),
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const InformationPage()),
                          );
                        },
                        child: SizedBox(
                          width: 170,
                          height: 150,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: orangeColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "assets/images/informasi.png"),
                                  ),
                                  SizedBox(height: 10),
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
                  height: 50,
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
                              width: 85,
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
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Center(
                    child: Consumer<TrashProvider>(
                      builder: (context, trashProvider, child) {
                        final percentage1 = trashProvider.percentage1;
                        final percentage2 = trashProvider.percentage2;
                        final percentage3 = trashProvider.percentage3;
                        final percentage4 = trashProvider.percentage4;

                        List<Widget> containerMenuLainnyaList = [
                          ContainerMenuLainnya(
                            title: "Tempat Sampah A",
                            status: percentage1 == 0
                                ? "Status Kosong"
                                : percentage1 >= 70
                                    ? "Status Penuh"
                                    : "Status Terisi",
                            percentage: percentage1.toInt(),
                            color: percentage1 == 0
                                ? greenIconColor
                                : percentage1 >= 70
                                    ? redIconColor
                                    : yellowIconColor,
                            boxcolor: percentage1 == 0
                                ? greenColor
                                : percentage1 >= 70
                                    ? redColor
                                    : yellowColor,
                          ),
                          ContainerMenuLainnya(
                            title: "Tempat Sampah B",
                            status: percentage2 == 0
                                ? "Status Kosong"
                                : percentage2 >= 70
                                    ? "Status Penuh"
                                    : "Status Terisi",
                            percentage: percentage2.toInt(),
                            color: percentage2 == 0
                                ? greenIconColor
                                : percentage2 >= 70
                                    ? redIconColor
                                    : yellowIconColor,
                            boxcolor: percentage2 == 0
                                ? greenColor
                                : percentage2 >= 70
                                    ? redColor
                                    : yellowColor,
                          ),
                          ContainerMenuLainnya(
                            title: "Tempat Sampah C",
                            status: percentage3 == 0
                                ? "Status Kosong"
                                : percentage3 >= 70
                                    ? "Status Penuh"
                                    : "Status Terisi",
                            percentage: percentage3.toInt(),
                            color: percentage3 == 0
                                ? greenIconColor
                                : percentage3 >= 70
                                    ? redIconColor
                                    : yellowIconColor,
                            boxcolor: percentage3 == 0
                                ? greenColor
                                : percentage3 >= 70
                                    ? redColor
                                    : yellowColor,
                          ),
                          ContainerMenuLainnya(
                            title: "Tempat Sampah D",
                            status: percentage4 == 0
                                ? "Status Kosong"
                                : percentage4 >= 70
                                    ? "Status Penuh"
                                    : "Status Terisi",
                            percentage: percentage4.toInt(),
                            color: percentage4 == 0
                                ? greenIconColor
                                : percentage4 >= 70
                                    ? redIconColor
                                    : yellowIconColor,
                            boxcolor: percentage4 == 0
                                ? greenColor
                                : percentage4 >= 70
                                    ? redColor
                                    : yellowColor,
                          ),
                        ];

                        List<Widget> filteredList;

                        switch (activeIndex) {
                          case 0:
                            filteredList = containerMenuLainnyaList;
                            break;
                          case 1:
                            filteredList =
                                containerMenuLainnyaList.where((element) {
                              final percentage =
                                  (element as ContainerMenuLainnya).percentage;
                              return percentage > 70;
                            }).toList();
                            break;
                          case 2:
                            filteredList =
                                containerMenuLainnyaList.where((element) {
                              final percentage =
                                  (element as ContainerMenuLainnya).percentage;
                              return percentage > 0 && percentage < 70;
                            }).toList();
                            break;
                          case 3:
                            filteredList =
                                containerMenuLainnyaList.where((element) {
                              final percentage =
                                  (element as ContainerMenuLainnya).percentage;
                              return percentage == 0;
                            }).toList();
                            break;
                          default:
                            filteredList = containerMenuLainnyaList;
                        }

                        return Column(
                          children: filteredList,
                        );
                      },
                    ),
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
