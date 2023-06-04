import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../Models/AppColors.dart';
import '../Order Screen/OrderScreenView.dart';
import 'MainScreenViewModel.dart';

// ignore: must_be_immutable
class MainScreenView extends StatelessWidget {
  bool visible = false;
  String confirmedNumber = '';
  bool validNumber = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainScreenViewModel>.reactive(
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
      viewModelBuilder: () => MainScreenViewModel(),
      onViewModelReady: (model) => [],
    );
  }

  Widget _topBar(BuildContext context, MainScreenViewModel model) {
    const List<String> list = <String>[
      'Workplace 1',
      'Workplace 2',
      'Workplace 3'
    ];
    String dropdownValue = list.first;
    return Padding(
      padding: EdgeInsets.fromLTRB(40, 80, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  )),
            ],
          ),
          DropdownButton(
              value: dropdownValue,
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                dropdownValue = value!;
              }),
          Text("Choose your delicious meal!"),
          Container(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  model.menuActivateHome();
                },
                icon: Icon(Icons.home_filled),
                color: model.homeActive == true
                    ? AppColors.Green
                    : AppColors.DarkGray,
                iconSize: 35,
              ),
              IconButton(
                onPressed: () {
                  model.menuActivateFavorites();
                },
                icon: Icon(Icons.favorite),
                color: model.favoriteActive == true
                    ? AppColors.Green
                    : AppColors.DarkGray,
                iconSize: 35,
              ),
              IconButton(
                onPressed: () {
                  model.menuActivateFilter();
                },
                icon: Icon(Icons.tag),
                color: model.filterActive == true
                    ? AppColors.Green
                    : AppColors.DarkGray,
                iconSize: 35,
              ),
              IconButton(
                onPressed: () {
                  model.menuActivateCart();
                },
                icon: Icon(Icons.shopping_cart),
                color: model.cartActive == true
                    ? AppColors.Green
                    : AppColors.DarkGray,
                iconSize: 35,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _centralContent(BuildContext context, MainScreenViewModel model) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.30,
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ================================================================================
            Container(
              height: MediaQuery.of(context).size.height * 0.54,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: model.menuData.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OrderScreenView(
                                          menuData: model.menuData[i])));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.width * 0.9,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.DarkGray),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        model.menuData[i]['name'].toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      if (model.menuData[i]['sale'] == true)
                                        Container(
                                          alignment: Alignment.center,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            color: AppColors.red,
                                          ),
                                          child: Container(
                                            child: Text(
                                              '${model.menuData[i]['salePercent'].toString()} % off',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      Text(
                                        model.menuData[i]["sale"] == true
                                            ? "\$ ${double.parse(model.menuData[i]["price"].toString()) * (double.parse(model.menuData[i]["salePercent"].toString()) / 100)}"
                                            : model.menuData[i]["price"]
                                                .toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.Green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                      ),
                                    ],
                                  ),
                                  if (model.menuData[i]['favorite'] == true)
                                    IconButton(
                                      onPressed: () {
                                        model.createNewFavorite(i);
                                      },
                                      icon: Icon(
                                        Icons.favorite,
                                        color: AppColors.red,
                                      ),
                                    )
                                  else
                                    IconButton(
                                      onPressed: () {
                                        model.createNewFavorite(i);
                                      },
                                      icon: Icon(
                                        Icons.favorite,
                                        color: AppColors.DarkGray,
                                      ),
                                    ),
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        model.menuData[i]["image"].toString()),
                                    radius:
                                        MediaQuery.of(context).size.width * 0.1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                    ],
                  );
                },
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomAppBar(BuildContext context, MainScreenViewModel model) {
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
            Container(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
