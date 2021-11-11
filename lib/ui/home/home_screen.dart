import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/constants/const_colors.dart';
import 'package:travel_app/constants/const_textstyles.dart';
import 'package:travel_app/ui/home/Data/blog_data.dart';
import 'package:travel_app/ui/home/widgets/blog_show_ui.dart';
import 'package:travel_app/ui/home/widgets/const_ui.dart';
import 'package:travel_app/ui/home/widgets/newsLetter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String snowregion = "assets/images/Snow Region.png";
  String hillstation = "assets/images/Hill Station.png";
  String valley = "assets/images/Valley.png";
  String beach = "assets/images/Beach.png";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // height: 250,
                width: size.width,
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: green_light,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(50)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              print("Show Drawer");
                            },
                            child: SvgPicture.asset(
                                "assets/icons/user-female.svg")),
                        InkWell(
                          onTap: () {
                            print("Sign Out");
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              child: SvgPicture.asset(
                                "assets/icons/signout.svg",
                                fit: BoxFit.fill,
                              )),
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 28, vertical: 28),
                          child: Text(
                            "Need a vacation? Don't Worry we got you",
                            style: headingStyle,
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: Text(
                        "Search Box",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
              ColoredBox(
                color: green_light,
                child: Container(
                  height: 50,
                  width: size.width,
                  // color: green_light,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(50))),
                ),
              ),
              Container(
                width: size.width,
                padding: EdgeInsets.only(bottom: 25, left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Categories",
                      style: headingStyle,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Wrap(
                        spacing: 10.0,
                        children: [
                          Categories(),
                          Categories(),
                          Categories(),
                          Categories(),
                        ],
                      ),
                    ),
                    Text(
                      "Trending Places",
                      style: headingStyle,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                      height: 151,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: green_light,
                      ),
                      child: Text("Implement Showcase"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Blogs",
                          style: headingStyle,
                        ),
                        InkWell(
                          onTap: () {
                            print("More Blogs Needed");
                          },
                          child: Container(
                              child: Row(
                            children: [
                              Text(
                                "More",
                                style:
                                    styleText(Colors.grey, FontWeight.w400, 16),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward_sharp,
                                color: Colors.grey,
                                size: 16,
                              )
                            ],
                          )),
                        ),
                      ],
                    ),
                    // Container(
                    //   child: ListView.builder(
                    //     itemCount: 10,
                    //     itemBuilder: (BuildContext context, int index) {
                    //       return ShowBlog(blog: blogs[index % 2]);
                    //     },
                    //   ),
                    // )
                    Container(
                      height: size.height / 2.5,
                      // color: Colors.red,
                      margin: EdgeInsets.symmetric(vertical: 25),
                      width: size.width,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return ShowBlog(blog: blogs[index % 2]);
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Types Of Places",
                          style: headingStyle,
                        ),
                        InkWell(
                          onTap: () {
                            print("More Places Needed");
                          },
                          child: Container(
                              child: Row(
                            children: [
                              Text(
                                "More",
                                style:
                                    styleText(Colors.grey, FontWeight.w400, 16),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward_sharp,
                                color: Colors.grey,
                                size: 16,
                              )
                            ],
                          )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      // color: Colors.red,
                      width: double.infinity,
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                print("Card Pressed");
                              },
                              child: PlaceCard(
                                  img: snowregion, place: "Snow Region")),
                          InkWell(
                              onTap: () {
                                print("Card 2 Pressed");
                              },
                              child: PlaceCard(
                                  img: hillstation, place: "Hill Station")),
                          InkWell(
                              onTap: () {
                                print("Card 3 pressed");
                              },
                              child: PlaceCard(img: valley, place: "Valley")),
                          InkWell(
                              onTap: () {
                                print("Card 4 pressed");
                              },
                              child: PlaceCard(img: beach, place: "Beach")),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Travel Guidelines",
                      style: headingStyle,
                      textAlign: TextAlign.left,
                    ),
                    Text("Print Travel Guidelines here"),
                    SizedBox(height: 15),
                    NewsLetter(),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: size.width,
                // color: Colors.red,
              )
            ],
          ),
        ));
  }
}
