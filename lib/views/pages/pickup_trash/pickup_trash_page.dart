import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gesit/viewmodels/pickup_provier.dart';
import 'package:provider/provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:gesit/viewmodels/trash_provider.dart';
import 'package:gesit/views/shared/container_menu_lainnya.dart';
import 'package:gesit/utils/colors.dart';

class PickUpPage extends StatefulWidget {
  const PickUpPage({super.key});

  @override
  State<PickUpPage> createState() => _PickUpPageState();
}

class _PickUpPageState extends State<PickUpPage> {
  bool isFullScreen = false;
  final MapController _mapController = MapController();

  void toggleFullScreen() {
    setState(() {
      isFullScreen = !isFullScreen;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LocationProvider>().getCurrentLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight = isFullScreen ? screenHeight : screenHeight / 3.5;

    return Scaffold(
      body: Stack(
        children: [
          Consumer<LocationProvider>(
            builder: (context, locationProvider, child) {
              return FlutterMap(
                mapController: _mapController,
                options: const MapOptions(
                  initialCenter: LatLng(-8.16492, 113.71536),
                  initialZoom: 18,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  ),
                  if (locationProvider.routePoints.isNotEmpty)
                    PolylineLayer(
                      polylines: [
                        Polyline(
                          points: locationProvider.routePoints,
                          color: Colors.grey.shade600,
                          strokeWidth: 4,
                        ),
                      ],
                    ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: const LatLng(-8.16532, 113.71477),
                        child: GestureDetector(
                          onTap: () => locationProvider
                              .setRoute(const LatLng(-8.16532, 113.71477)),
                          child: CircleAvatar(
                            backgroundColor: Colors.red.withOpacity(0.3),
                            radius: 50,
                            child: CircleAvatar(
                              backgroundColor: Colors.red.withOpacity(0.7),
                              radius: 15,
                              child: const Text("A"),
                            ),
                          ),
                        ),
                      ),
                      Marker(
                        point: const LatLng(-8.16422, 113.71598),
                        child: GestureDetector(
                          onTap: () => locationProvider
                              .setRoute(const LatLng(-8.16422, 113.71598)),
                          child: CircleAvatar(
                            backgroundColor: Colors.yellow.withOpacity(0.3),
                            radius: 50,
                            child: CircleAvatar(
                              backgroundColor: Colors.yellow.withOpacity(0.7),
                              radius: 15,
                              child: const Text("B"),
                            ),
                          ),
                        ),
                      ),
                      Marker(
                        point: const LatLng(-8.16431, 113.71480),
                        child: GestureDetector(
                          onTap: () => locationProvider
                              .setRoute(const LatLng(-8.16431, 113.71480)),
                          child: CircleAvatar(
                            backgroundColor: Colors.yellow.withOpacity(0.3),
                            radius: 50,
                            child: CircleAvatar(
                              backgroundColor: Colors.yellow.withOpacity(0.7),
                              radius: 15,
                              child: const Text("C"),
                            ),
                          ),
                        ),
                      ),
                      Marker(
                        point: const LatLng(-8.16480, 113.71490),
                        child: GestureDetector(
                          onTap: () => locationProvider
                              .setRoute(const LatLng(-8.16480, 113.71490)),
                          child: CircleAvatar(
                            backgroundColor: Colors.green.withOpacity(0.3),
                            radius: 50,
                            child: CircleAvatar(
                              backgroundColor: Colors.green.withOpacity(0.7),
                              radius: 15,
                              child: const Text("D"),
                            ),
                          ),
                        ),
                      ),
                      if (locationProvider.currentUserLocation != null)
                        Marker(
                          point: locationProvider.currentUserLocation!,
                          child: const Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                    ],
                  ),
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: "back_button", // Unique heroTag
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                  onPressed: () => Navigator.pop(context),
                  child: const Center(child: Icon(Icons.arrow_back_ios)),
                ),
                const SizedBox(height: 8.0),
                FloatingActionButton(
                  heroTag: "location_button", // Unique heroTag
                  onPressed: () {
                    final provider = context.read<LocationProvider>();
                    provider.getCurrentLocation().then((_) {
                      if (provider.currentUserLocation != null) {
                        _mapController.move(provider.currentUserLocation!,
                            18); // Center the map
                      }
                    });
                  },
                  backgroundColor: Colors.grey.shade200,
                  elevation: 1,
                  child: const Icon(Icons.my_location),
                ),
              ],
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
                      offset:
                          const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(isFullScreen ? 0 : 24),
                    topRight: Radius.circular(isFullScreen ? 0 : 24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 20),
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
                      const SizedBox(height: 10,),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Consumer<TrashProvider>(
                              builder: (context, trashProvider, child) {
                            final percentage1 = trashProvider.percentage1;
                            final percentage2 = trashProvider.percentage2;
                            final percentage3 = trashProvider.percentage3;
                            final percentage4 = trashProvider.percentage4;

                            return Column(
                              children: [
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
                              ],
                            );
                          }),
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
    );
  }
}
