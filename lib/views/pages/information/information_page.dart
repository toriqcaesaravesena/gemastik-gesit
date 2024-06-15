import 'package:flutter/material.dart';
import 'package:gesit/viewmodels/pickup_provier.dart';
import 'package:gesit/viewmodels/trash_provider.dart';
import 'package:provider/provider.dart';
import 'package:gesit/utils/colors.dart';
import 'package:gesit/views/shared/container_informasi.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LocationProvider>().getCurrentLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Distrik 1",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Keterangan",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.5,
                  ),
                ),
                Consumer<TrashProvider>(
                  builder: (context, trashProvider, child) {
                    final percentage1 = trashProvider.percentage1;
                    final percentage2 = trashProvider.percentage2;
                    final percentage3 = trashProvider.percentage3;
                    final percentage4 = trashProvider.percentage4;

                    return Column(
                      children: [
                        ContainerInformasi(
                          title: "Tempat Sampah A",
                          status: percentage1 == 100
                              ? "Penuh"
                              : (percentage1 == 0
                                  ? "Kosong"
                                  : (percentage1 < 70 ? "Terisi" : "Penuh")),
                          color: percentage1 == 100
                              ? redIconColor
                              : (percentage1 == 0
                                  ? greenIconColor
                                  : (percentage1 < 70
                                      ? yellowIconColor
                                      : redIconColor)),
                          boxcolor: Colors.white,
                          percentage: percentage1,
                          iconColor: percentage1 == 100
                              ? redColor
                              : (percentage1 == 0
                                  ? greenColor
                                  : (percentage1 < 70
                                      ? yellowColor
                                      : redColor)),
                        ),
                        ContainerInformasi(
                          title: "Tempat Sampah B",
                          status: percentage2 == 100
                              ? "Penuh"
                              : (percentage2 == 0
                                  ? "Kosong"
                                  : (percentage2 < 70 ? "Terisi" : "Penuh")),
                          color: percentage2 == 100
                              ? redIconColor
                              : (percentage2 == 0
                                  ? greenIconColor
                                  : (percentage2 < 70
                                      ? yellowIconColor
                                      : redIconColor)),
                          boxcolor: Colors.white,
                          percentage: percentage2,
                          iconColor: percentage2 == 100
                              ? redColor
                              : (percentage2 == 0
                                  ? greenColor
                                  : (percentage2 < 70
                                      ? yellowColor
                                      : redColor)),
                        ),
                        ContainerInformasi(
                          title: "Tempat Sampah C",
                          status: percentage3 == 100
                              ? "Penuh"
                              : (percentage3 == 0
                                  ? "Kosong"
                                  : (percentage3 < 70 ? "Terisi" : "Penuh")),
                          color: percentage3 == 100
                              ? redIconColor
                              : (percentage3 == 0
                                  ? greenIconColor
                                  : (percentage3 < 70
                                      ? yellowIconColor
                                      : redIconColor)),
                          boxcolor: Colors.white,
                          percentage: percentage3,
                          iconColor: percentage3 == 100
                              ? redColor
                              : (percentage3 == 0
                                  ? greenColor
                                  : (percentage3 < 70
                                      ? yellowColor
                                      : redColor)),
                        ),
                        ContainerInformasi(
                          title: "Tempat Sampah D",
                          status: percentage4 == 100
                              ? "Penuh"
                              : (percentage4 == 0
                                  ? "Kosong"
                                  : (percentage4 < 70 ? "Terisi" : "Penuh")),
                          color: percentage4 == 100
                              ? redIconColor
                              : (percentage4 == 0
                                  ? greenIconColor
                                  : (percentage4 < 70
                                      ? yellowIconColor
                                      : redIconColor)),
                          boxcolor: Colors.white,
                          percentage: percentage4,
                          iconColor: percentage4 == 100
                              ? redColor
                              : (percentage4 == 0
                                  ? greenColor
                                  : (percentage4 < 70
                                      ? yellowColor
                                      : redColor)),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
