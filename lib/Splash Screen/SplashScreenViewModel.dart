import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_order/Main%20Screen/MainScreenView.dart';
import 'package:stacked/stacked.dart';
import 'dart:convert';

import 'SplashScreenView.dart';

class SplashScreenViewModel extends BaseViewModel {
  InternalPath(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => (MainScreenView())),
    );
  }
}
