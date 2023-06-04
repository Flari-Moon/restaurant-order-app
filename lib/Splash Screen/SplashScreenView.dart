import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../Models/AppColors.dart';
import 'SplashScreenViewModel.dart';

// ignore: must_be_immutable
class SplashScreenView extends StatelessWidget {
  bool visible = false;
  String confirmedNumber = '';
  bool validNumber = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.Green,
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
      viewModelBuilder: () => SplashScreenViewModel(),
      onViewModelReady: (model) => [],
    );
  }

  Widget _topBar(BuildContext context, SplashScreenViewModel model) {
    return Padding(
      padding: EdgeInsets.fromLTRB(40, 80, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
          ),
        ],
      ),
    );
  }

  Widget _centralContent(BuildContext context, SplashScreenViewModel model) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.2,
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ================================================================================
            CircleAvatar(
              backgroundImage: AssetImage('assets/bows-fruits-on-a-table.jpg'),
              radius: MediaQuery.of(context).size.width * 0.2,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              child: Text(
                "BISTRO CORNER",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomAppBar(BuildContext context, SplashScreenViewModel model) {
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
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                child: Text(
                  'Get A Meal',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black,
                  backgroundColor: AppColors.Gray,
                ),
                onPressed: () {
                  model.InternalPath(context);
                },
              ),
            ),
            Container(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
