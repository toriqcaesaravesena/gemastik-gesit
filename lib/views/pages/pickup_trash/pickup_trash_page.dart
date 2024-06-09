import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gesit/utils/colors.dart';
import 'package:gesit/views/shared/container_pickup_trash.dart';
import 'package:latlong2/latlong.dart';

class PickUpPage extends StatefulWidget {
  const PickUpPage({super.key});

  @override
  State<PickUpPage> createState() => _PickUpPageState();
}

class _PickUpPageState extends State<PickUpPage> {
  bool isFullScreen = false;

  void toggleFullScreen() {
    setState(() {
      isFullScreen = !isFullScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight = isFullScreen ? screenHeight : screenHeight / 3.5;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            FlutterMap(
              options: const MapOptions(
                initialCenter: LatLng(-8.16492, 113.71536),
                initialZoom: 18,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                ),
                CircleLayer(
                  circles: [
                    CircleMarker(
                      point: const LatLng(-8.16532, 113.71477),
                      radius: 15,
                      useRadiusInMeter: true,
                      color: Colors.red.withOpacity(0.3),
                      borderColor: Colors.red.withOpacity(0.7),
                      borderStrokeWidth: 2,
                    ),
                    CircleMarker(
                      point: const LatLng(-8.16422, 113.71598),
                      radius: 15,
                      useRadiusInMeter: true,
                      color: Colors.green.withOpacity(0.3),
                      borderColor: Colors.green.withOpacity(0.7),
                      borderStrokeWidth: 2,
                    ),
                    CircleMarker(
                      point: const LatLng(-8.16431, 113.71500),
                      radius: 15,
                      useRadiusInMeter: true,
                      color: Colors.yellow.withOpacity(0.3),
                      borderColor: Colors.yellow.withOpacity(0.7),
                      borderStrokeWidth: 2,
                    ),
                  ],
                ),
                const MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(-8.16532, 113.71477),
                      child: Text(
                        " A ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,

                        ),
                      ),
                    ),
                    Marker(
                      point: LatLng(-8.16422, 113.71598),
                      child:  Text(
                        " B ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,

                        ),
                      ),
                    ),
                    Marker(
                      point: LatLng(-8.16431, 113.71500),
                      child: Text(
                        " C ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,

                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                onPressed: () => Navigator.pop(context),
                child: const Center(child: Icon(Icons.arrow_back_ios)),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: double.infinity,
                height: containerHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isFullScreen ? 0 : 24),
                      topRight: Radius.circular(isFullScreen ? 0 : 24),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: toggleFullScreen,
                          child: Center(
                            child: Icon(
                              isFullScreen
                                  ? Icons.arrow_downward_rounded
                                  : Icons.arrow_upward_rounded,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: ContainerPickUpTrash(
                                    title: "Tempat sampah A",
                                    status: "Status Penuh",
                                    percentage: 100,
                                    color: redIconColor,
                                    boxcolor: redColor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: ContainerPickUpTrash(
                                    title: "Tempat sampah B",
                                    status: "Status Kosong",
                                    percentage: 0,
                                    color: greenIconColor,
                                    boxcolor: greenColor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: ContainerPickUpTrash(
                                    title: "Tempat sampah C",
                                    status: "Status Terisi",
                                    percentage: 30,
                                    color: yellowIconColor,
                                    boxcolor: yellowColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
