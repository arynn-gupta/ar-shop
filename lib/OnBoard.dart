import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'StyleScheme.dart';

class OnBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return onboard();
  }
}

class onboard extends StatefulWidget {
  @override
  _onboardState createState() => _onboardState();
}

class _onboardState extends State<onboard> {
  int currentPage = 0;
  PageController _pageController = new PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("asset/images/bg.png"))),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              height: 400,
              child: PageView(
                controller: _pageController,
                children: [
                  onBoardPage(
                      "onBoard1", "Welcome to AR Shop, Let's shop!"),
                  onBoardPage("onBoard2",
                      "We help people connect with stores around INDIA!"),
                  onBoardPage("onBoard3",
                      "We show people the easy way to shop. Just stay at home with us!"),
                ],
                onPageChanged: (value) => {setCurrentPage(value)},
              )),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => getIndicator(index)))
        ]),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: InkWell(
                onTap: changePage,
                child: Container(
                  height: 70,
                  width: 70,
                  margin: EdgeInsets.only(top: 30, bottom: 30),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: gradientStyle,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 40,
                  ),
                ))),
      ],
    ));
  }

  void changePage() {
    if (currentPage == 2) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      _pageController.animateToPage(currentPage + 1,
          duration: Duration(milliseconds: 100), curve: Curves.linear);
    }
  }

  setCurrentPage(int value) {
    currentPage = value;
    setState(() {});
  }

  AnimatedContainer getIndicator(int pageNo) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: 10,
      width: (currentPage == pageNo) ? 20 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: (currentPage == pageNo) ? Colors.orange : Colors.grey),
    );
  }

  Column onBoardPage(String img, String desc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(50),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/images/$img.png")))),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Text(
            desc,
            style: TextStyle(
              fontFamily: 'roboto',
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
