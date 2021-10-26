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

class BlogIconContainer extends StatefulWidget {
  final IconData icon1;
  final String count1;
  final IconData icon2;
  final String count2;
  const BlogIconContainer(
      {Key? key,
      required this.icon1,
      required this.icon2,
      required this.count1,
      required this.count2})
      : super(key: key);

  @override
  _BlogIconContainerState createState() => _BlogIconContainerState();
}

class _BlogIconContainerState extends State<BlogIconContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Icon(
                    widget.icon1,
                    size: 26,
                    color: Colors.black45,
                  ),
                ),
                Text(
                  widget.count1,
                  style: normalText,
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Icon(
                    widget.icon2,
                    size: 26,
                    color: Colors.black45,
                  ),
                ),
                Text(
                  widget.count2,
                  style: normalText,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  String img;
  String place;
  PlaceCard({Key? key, required this.img, required this.place})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: 170,
      decoration: BoxDecoration(
          color: green_light, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Image(
                    image: AssetImage(img),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "$place",
                  style: styleText(green, FontWeight.normal, 16),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
