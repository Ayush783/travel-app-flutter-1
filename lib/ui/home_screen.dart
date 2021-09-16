import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/constants/const_colors.dart';
import 'package:travel_app/constants/const_textstyles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 250,
          width: size.width,
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: green_light,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
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
                      child: SvgPicture.asset("assets/icons/user-female.svg")),
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
                    padding: EdgeInsets.all(28),
                    child: Text(
                      "Need a vacation? Don't Worry we got you",
                      style: headingStyle(),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
