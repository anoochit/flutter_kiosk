// Strapi endpoint
import 'package:flutter/material.dart';
import 'package:kiosk/models/menu_model.dart';

const String urlEndpoint = "http://bdd1-2001-fb1-14f-ccbd-f1af-65de-d6e5-d73.ngrok.io";

// logo
const logoImage = "$urlEndpoint/uploads/Mc_Donalds_logo_1024x768_edf4dd259f.png";

// image menus
const eatinIcon = "$urlEndpoint/uploads/h_mcdonalds_2_Cheeseburger_Extra_Value_Meals_809c97f072.jpg";

// colors
const kMacGreen = Color.fromARGB(255, 43, 123, 59);
const kMacYellow = Color.fromARGB(255, 255, 202, 64);
const kMacGrey = Color.fromARGB(255, 251, 251, 249);

// category menu in menu page
List<MenuItem> listMenuItem = [
  MenuItem(
    5,
    "Breakfast",
    '$urlEndpoint/uploads/t_mcdonalds_Bacon_Egg_Cheese_Biscuit_Regular_Size_Biscuit_09cd57a7a9.jpg',
  ),
  MenuItem(
    3,
    "Burgers",
    '$urlEndpoint/uploads/t_mcdonalds_Big_Mac_e63db56101.jpg',
  ),
  MenuItem(
    2,
    "Sandwiches",
    '$urlEndpoint/uploads/t_mcdonalds_spicy_crispy_chicken_sandwich_26c46fba29.jpg',
  ),
  MenuItem(
    4,
    "Beverages",
    '$urlEndpoint/uploads/t_mcdonalds_Coca_Cola_Classic_Small_945557852d.jpg',
  ),
  MenuItem(
    6,
    "Desserts",
    '$urlEndpoint/uploads/t_mcdonalds_Vanilla_Reduced_Fat_Ice_Cream_Cone_011ee4c828.jpg',
  ),
];
