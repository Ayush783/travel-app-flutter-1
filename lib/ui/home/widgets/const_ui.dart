import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/constants/const_colors.dart';
import 'package:travel_app/constants/const_textstyles.dart';

class Categories extends StatelessWidget {
  // final String? category;
  // final SvgPicture? picture;
  const Categories({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: green_light, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                width: (MediaQuery.of(context).size.width - 50 - 40) / 5,
                // width: 60,
                height: 50,
                child: Image(
                  image: AssetImage("assets/icons/trekking.png"),
                  fit: BoxFit.fill,
                ),
              )),
          Text(
            "Trekking",
            style: styleText(green, FontWeight.w600, 14),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
