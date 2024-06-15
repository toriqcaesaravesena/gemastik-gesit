import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  bool active;
  Widget view;

  CategoryModel({
    required this.name,
    required this.active,
    required this.view,
  });
}

List<CategoryModel> categoryData = [
  CategoryModel(
    name: "Semua",
    active: true,
    view: Container()
  ),
  CategoryModel(
    name: "Penuh",
    active: false,
    view: Container(),
  ),
  CategoryModel(
    name: "Terisi",
    active: false,
    view: Container(),
  ),
  CategoryModel(
    name: "Kosong",
    active: false,
    view: Container(),
  ),
];
