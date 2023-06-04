import 'dart:async';

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../Models/AppColors.dart';
import 'OrderScreenViewModel.dart';

class OrderScreenView extends StatelessWidget {
  OrderScreenView({this.menuData});

  final menuData;

  //============= CONTROLLERS

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrderScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _topBar(context, model),
              _centralContent(context, model),
              _bottomAppBar(context, model),
            ],
          ),
        );
      },
      viewModelBuilder: () => OrderScreenViewModel(),
      onViewModelReady: (model) => [],
    );
  }

  Widget _topBar(BuildContext context, OrderScreenViewModel model) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 80, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Image.asset(
              menuData["image"],
              fit: BoxFit.cover,
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 30,
              )),
          Container(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            menuData["name"],
            style: TextStyle(
              color: AppColors.DarkGray,
              fontSize: 30,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                menuData['sale'] == true
                    ? (menuData["price"] * (menuData["salePercent"] / 100))
                        .toString()
                    : menuData["price"].toString(),
                style: TextStyle(
                    color: AppColors.Green,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              if (menuData['sale'] == true)
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: AppColors.red,
                  ),
                  child: Container(
                    child: Text(
                      '${menuData['salePercent'].toString()} % off',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            "Ingredients",
            style: TextStyle(
              color: AppColors.DarkGray,
              fontSize: 25,
            ),
          ),
          Text(
            menuData["recipe"],
            style: TextStyle(
              color: AppColors.DarkGray,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _centralContent(BuildContext context, OrderScreenViewModel model) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.35,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.65,
        child: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 40,
                      color: AppColors.DarkGray,
                    ),
                    Container(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "Location",
                          style: TextStyle(
                            color: AppColors.DarkGray,
                            fontSize: 25,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            menuData["location"],
                            style: TextStyle(
                              color: AppColors.DarkGray,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  children: [
                    Icon(
                      Icons.punch_clock_rounded,
                      size: 40,
                      color: AppColors.DarkGray,
                    ),
                    Container(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "Delivery time",
                          style: TextStyle(
                            color: AppColors.DarkGray,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          menuData["deliveryTime"],
                          style: TextStyle(
                            color: AppColors.DarkGray,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // if (classInfo['lesson_description'] != null)
              //   Container(
              //     width: MediaQuery.of(context).size.width * 0.8,
              //     child: Row(
              //       children: [
              //         Icon(
              //           Icons.details,
              //           size: 40,
              //           color: AppColors.gray,
              //         ),
              //         Container(
              //           width: 20,
              //         ),
              //         Text("${classInfo['lesson_description']}",
              //             style: TextStyle(
              //               color: AppColors.darkGrey,
              //               fontFamily: "Inter",
              //               fontSize: 40,
              //             ))
              //       ],
              //     ),
              //   )
              // else
              //   Text(''),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomAppBar(BuildContext context, OrderScreenViewModel model) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.02,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 30,
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '2 itens',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      ' \$ 20.00',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.white,
                  backgroundColor: AppColors.Green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                ),
                onPressed: () {
                  print('Pressed');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
