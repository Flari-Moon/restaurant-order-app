import 'dart:async';

import 'package:stacked/stacked.dart';
import 'dart:convert';

import 'MainScreenView.dart';

class MainScreenViewModel extends BaseViewModel {
  var menuData = [
    {
      "name": "Pizza",
      "price": 15.88,
      "favorite": true,
      "sale": false,
      "salePercent": 10,
      "recipe": "Pizza dough, cheese, peperonni, and vegetables",
      "location": "Road of Fire , NO. 33",
      "deliveryTime": "90 minutes",
      "image": "assets/pizza.jpg",
    },
    {
      'name': "Spagetti Bolognese",
      "price": 10.02,
      "favorite": false,
      "sale": false,
      "salePercent": 30,
      "recipe":
          "Minced Beed, Diced Onions, Chopped Garlic, Grated Carrot, Tomatoes, pasta",
      "location": "NO. 72 Ashmota Road, Accra, Ghana",
      "deliveryTime": "45 minutes",
      "image": "assets/spaghetti-bolognese-recipe.jpg",
    },
    {
      "name": "Vegetable Salad",
      "price": 20.00,
      "favorite": false,
      "sale": false,
      "salePercent": 25,
      "recipe": "a salad of vegetables",
      "location": "someplace",
      "deliveryTime": "15 minutes",
      "image": "assets/vegetable-salad.jpg",
    },
    {
      "name": "Hamburger",
      "price": 10.00,
      "favorite": false,
      "sale": true,
      "salePercent": 50,
      "recipe": "its a burger with meat",
      "location": "a place",
      "deliveryTime": "50 minutes",
      "image": "assets/Hamburger.jpg",
    },
  ];

  bool homeActive = true;
  bool favoriteActive = false;
  bool filterActive = false;
  bool cartActive = false;

  createNewFavorite(itemIndex) {
    print(itemIndex);

    if (menuData[itemIndex]['favorite'] == true) {
      menuData[itemIndex]['favorite'] = false;
    } else if (menuData[itemIndex]['favorite'] == false) {
      menuData[itemIndex]['favorite'] = true;
    }

    notifyListeners();
  }

  menuActivateHome() {
    print("home");
    homeActive = true;
    favoriteActive = false;
    filterActive = false;
    cartActive = false;
    notifyListeners();
  }

  menuActivateFavorites() {
    print("favorites");
    homeActive = false;
    favoriteActive = true;
    filterActive = false;
    cartActive = false;
    notifyListeners();
  }

  menuActivateFilter() {
    print("filter");
    homeActive = false;
    favoriteActive = false;
    filterActive = true;
    cartActive = false;
    notifyListeners();
  }

  menuActivateCart() {
    print("cart");
    homeActive = false;
    favoriteActive = false;
    filterActive = false;
    cartActive = true;
    notifyListeners();
  }

  logedInPath(context) {
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => LockscreenView()),
    // );
  }
}
