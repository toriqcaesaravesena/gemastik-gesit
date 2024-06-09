import 'package:flutter/material.dart';
import 'package:gesit/utils/colors.dart';
import 'package:gesit/views/shared/container_informasi.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
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
                ContainerInformasi(
                  title: "Tempat Sampah A",
                  status: "Penuh",
                  color: redIconColor,
                  boxcolor: Colors.white,
                  percentage: 100,
                  iconColor: redColor,
                ),
                ContainerInformasi(
                  title: "Tempat Sampah B",
                  status: "Kosong",
                  color: greenIconColor,
                  boxcolor: Colors.white,
                  percentage: 20,
                  iconColor: greenColor,
                ),
                ContainerInformasi(
                  title: "Tempat Sampah C",
                  status: "Penuh",
                  color: redIconColor,
                  boxcolor: Colors.white,
                  percentage: 90,
                  iconColor: redColor,
                ),
                ContainerInformasi(
                  title: "Tempat Sampah D",
                  status: "Terisi",
                  color: yellowIconColor,
                  boxcolor: Colors.white,
                  percentage: 50,
                  iconColor: yellowColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
