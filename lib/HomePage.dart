import 'package:flutter/material.dart';
import 'StyleScheme.dart';
import 'ProductPage.dart';
import 'LoginPage.dart';
import 'database.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return homePage();
  }
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Container(
                margin: EdgeInsets.only(bottom: 10, right: 10),
                height: 50,
                width: 50,
                decoration: containerStyle("all"),
                child: Center(
                  child: InkWell(
                    onTap: gotoLoginPage,
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.only(bottom: 10, right: 10),
                  height: 50,
                  width: 50,
                  decoration: containerStyle("all"),
                  child: Center(
                    child: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10, right: 10),
                  height: 50,
                  width: 50,
                  decoration: containerStyle("all"),
                  child: Center(
                    child: Icon(
                      Icons.notifications,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              height: 50,
              decoration: containerStyle("right"),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        style: TextStyle(fontSize: 22, fontFamily: 'Avenir'),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
                            hintStyle:
                                TextStyle(fontSize: 22, fontFamily: 'Avenir')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  categoryWidget("All"),
                  categoryWidget("Chair"),
                  categoryWidget("Sofa"),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5 - 15,
                          child: Column(
                            children: [
                              for (var i = 0;
                                  i < (product_name.length / 2).round();
                                  i++)
                                productWidget(
                                    "right",i,
                                    2),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5 - 15,
                          child: Column(
                            children: [
                              for (var i = (product_name.length / 2).round();
                                  i < product_name.length;
                                  i++)
                                productWidget("left", i, 2),
                              if (product_name.length % 2 != 0)
                                Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 30, horizontal: 5),
                                  height: 120.0 * 2,
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 80,
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Icon(Icons.home, color: Colors.grey, size: 30),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Icon(Icons.track_changes,
                            color: Colors.orange, size: 30),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Color(0xfff96060), Colors.red],
                        ),
                        shape: BoxShape.circle),
                    child: Center(
                      child: Icon(Icons.mic, color: Colors.white, size: 30),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Icon(Icons.view_list, color: Colors.orange, size: 30),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Icon(Icons.account_circle,
                            color: Colors.grey, size: 30),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container productWidget(String side, var i,
      double heightMultiplier) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 5),
      height: 120.0 * heightMultiplier,
      decoration: containerStyle(side),
      child: InkWell(
        onTap: () => {
          current_product = i,
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProductPage()))
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asset/products/'+product_name[i]+' (1).png'),
                        fit: BoxFit.contain)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              product_name[i].toUpperCase(),
              style: TextStyle(
                  color: Colors.grey, fontSize: 17, fontFamily: 'Avenir'),
            ),
            Text(
              "\₹ "+product_price[i],
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Avenir'),
            )
          ],
        ),
      ),
    );
  }

  InkWell categoryWidget(String title) {
    return InkWell(
      onTap: () {
        selectCategory(title);
      },
      child: Container(
        margin: EdgeInsets.only(right: 5, bottom: 5),
        height: 50,
        width: 150,
        decoration: containerStyle("right").copyWith(
            border: (title == selectedCategory)
                ? Border.all(
                    color: Color(0xff005dff),
                    width: 2,
                  )
                : null),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Avenir'),
          ),
        ),
      ),
    );
  }

  void selectCategory(String title) {
    selectedCategory = title;
    setState(() {});
  }

  void gotoLoginPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
