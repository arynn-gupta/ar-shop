import 'package:flutter/material.dart';
import 'StyleScheme.dart';
import 'ARmode.dart';
import 'database.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return productPage();
  }
}

class productPage extends StatefulWidget {
  @override
  _productPageState createState() => _productPageState();
}

class _productPageState extends State<productPage> {
  Color currentColor = Color(0xff2f4b81);
  String currentChair = product_name[current_product] + ' (1)';
  String color = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
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
                      onTap: gotoHomePage,
                      child: Icon(
                        Icons.arrow_back_ios,
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
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5, right: 5),
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: containerStyle("all"),
                    child: Container(
                      margin: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'asset/products/$currentChair.png'))),
                    ),
                  ),
                  Container(
                    height: 200,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    width: MediaQuery.of(context).size.width * 0.15,
                    margin: EdgeInsets.only(bottom: 5, right: 5),
                    decoration: containerStyle("left"),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        colorWidget(Color(0xff2f4b81)),
                        colorWidget(Color(0xffbc4747)),
                        colorWidget(Color(0xfffec286)),
                        colorWidget(Color(0xff47bc66)),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      productWidget(
                          product_name[current_product] + color + ' (1)'),
                      productWidget(
                          product_name[current_product] + color + ' (2)'),
                      productWidget(
                          product_name[current_product] + color + ' (3)'),
                      productWidget(
                          product_name[current_product] + color + ' (4)'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5, right: 5),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    height: 180,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: containerStyle("left"),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          product_name[current_product].toUpperCase(),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Avenir'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.star),
                              color: star[current_product][0],
                              onPressed: () {
                                setState(
                                    () //<--whenever icon is pressed, force redraw the widget
                                    {
                                  rating(0);
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.star),
                              color: star[current_product][1],
                              onPressed: () {
                                setState(
                                    () //<--whenever icon is pressed, force redraw the widget
                                    {
                                  rating(1);
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.star),
                              color: star[current_product][2],
                              onPressed: () {
                                setState(
                                    () //<--whenever icon is pressed, force redraw the widget
                                    {
                                  rating(2);
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.star),
                              color: star[current_product][3],
                              onPressed: () {
                                setState(
                                    () //<--whenever icon is pressed, force redraw the widget
                                    {
                                  rating(3);
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.star),
                              color: star[current_product][4],
                              onPressed: () {
                                setState(
                                    () //<--whenever icon is pressed, force redraw the widget
                                    {
                                  rating(4);
                                });
                              },
                            ),
                          ],
                        ),
                        Text(
                          "\₹ " + product_price[current_product],
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Avenir',
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 180,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    width: MediaQuery.of(context).size.width * 0.15,
                    margin: EdgeInsets.only(bottom: 5, right: 5),
                    decoration: containerStyle("left"),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () => {
                            if (product_count[current_product] > 0 && product_count[current_product] <= 9)
                              setState(() {
                                product_count[current_product] -= 1;
                              })
                          },
                          child: Center(
                            child: Text(
                              "-",
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              product_count[current_product].toString(),
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => {
                            if (product_count[current_product] >= 0 && product_count[current_product] < 9)
                              setState(() {
                                product_count[current_product] += 1;
                              })
                          },
                          child: Center(
                            child: Text(
                              "+",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration:
                    containerStyle("right").copyWith(color: Colors.black),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: gotoARview,
                        child: Text("AR Mode",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontFamily: 'Avenir')))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  InkWell productWidget(String img) {
    return InkWell(
      onTap: () {
        changeCurrentChair(img);
      },
      child: Container(
        height: 100,
        width: 110,
        margin: EdgeInsets.only(right: 10, bottom: 5),
        decoration: containerStyle("all").copyWith(
            border: Border.all(
                color: (currentChair == img)
                    ? Color(0xff005dff)
                    : Colors.transparent)),
        child: Center(
          child: Container(
            height: 50,
            width: 120,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/products/$img.png"))),
          ),
        ),
      ),
    );
  }

  void rating(var star_index) {
    if (star[current_product][star_index] == Colors.grey) {
      for (int i = 0; i <= star_index; i++) star[current_product][i] = Colors.yellow;
    } else if (star[current_product][star_index] == Colors.yellow) {
      for (int i = star_index; i < 5; i++) star[current_product][i] = Colors.grey;
    }
  }

  void changeCurrentChair(String img) {
    currentChair = img;
    setState(() {});
  }

  void setCurrentColor(Color colorName) {
    currentColor = colorName;
    if (colorName == Color(0xffbc4747)) {
      color = " a";
    } else if (colorName == Color(0xfffec286)) {
      color = " b";
    } else if (colorName == Color(0xff47bc66)) {
      color = " c";
    } else
      color = "";
    setState(() {});
  }

  Container colorWidget(Color colorName) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: (currentColor == colorName)
                  ? colorName
                  : Colors.transparent)),
      child: Center(
        child: InkWell(
          onTap: () {
            setCurrentColor(colorName);
          },
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(shape: BoxShape.circle, color: colorName),
          ),
        ),
      ),
    );
  }

  void gotoHomePage() {
    Navigator.pop(context);
  }

  void gotoARview() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ARmode()));
  }
}
