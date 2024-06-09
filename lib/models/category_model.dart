import 'package:flutter/material.dart';
import 'package:gesit/utils/colors.dart';
import 'package:gesit/views/shared/container_menu_lainnya.dart';

class CategoryModel {
  String name;
  bool active;
  final Widget view;

  CategoryModel({required this.name, required this.active, required this.view});
}

List<CategoryModel> categoryData = [
  CategoryModel(
    name: "Semua",
    active: true,
    view: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ContainerMenuLainnya(
              title: "Tempat Sampah A",
              status: "Status Penuh",
              percentage: 96,
              color: redIconColor,
              boxcolor: redColor,
            ),
            ContainerMenuLainnya(
              title: "Tempat Sampah B",
              status: "Status Kosong",
              percentage: 20,
              color: greenIconColor,
              boxcolor: greenColor,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ContainerMenuLainnya(
              title: "Tempat Sampah C",
              status: "Status Penuh",
              percentage: 100,
              color: redIconColor,
              boxcolor: redColor,
            ),
            ContainerMenuLainnya(
              title: "Tempat Sampah D",
              status: "Status Terisi",
              percentage: 55,
              color: yellowIconColor,
              boxcolor: yellowColor,
            ),
          ],
        ),
      ],
    ),
  ),
  CategoryModel(
    name: "Penuh",
    active: false,
    view: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ContainerMenuLainnya(
          title: "Tempat Sampah A",
          status: "Status Penuh",
          percentage: 96,
          color: redIconColor,
          boxcolor: redColor,
        ),
        ContainerMenuLainnya(
          title: "Tempat Sampah C",
          status: "Status Penuh",
          percentage: 100,
          color: redIconColor,
          boxcolor: redColor,
        ),
      ],
    ),
  ),
  CategoryModel(
    name: "Terisi",
    active: false,
    view: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ContainerMenuLainnya(
          title: "Tempat Sampah D",
          status: "Status Terisi",
          percentage: 55,
          color: yellowIconColor,
          boxcolor: yellowColor,
        ),
      ],
    ),
  ),
  CategoryModel(
    name: "Kosong",
    active: false,
    view: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ContainerMenuLainnya(
              title: "Tempat Sampah B",
              status: "Status Kosong",
              percentage: 0,
              color: greenIconColor,
              boxcolor: greenColor,
            ),
      ],
    ),
  ),
];
