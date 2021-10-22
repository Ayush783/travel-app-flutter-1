import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/constants/const_colors.dart';
import 'package:travel_app/constants/const_textstyles.dart';
import 'package:travel_app/models/blog_model.dart';
import 'package:travel_app/ui/home/widgets/const_ui.dart';

class ShowBlog extends StatelessWidget {
  final Blog blog;
  const ShowBlog({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      color: green_light,
      child: Column(
        children: [
          Container(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.only(right: 15),
                child: SvgPicture.asset("assets/icons/user-female.svg"),
              ),
              Expanded(
                // height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Wrap(children: [
                                Text(
                                  blog.title,
                                  style: styleText(
                                      Colors.black, FontWeight.w600, 18),
                                ),
                              ]),
                              Text("@" + blog.handle,
                                  style: styleText(
                                      Colors.grey, FontWeight.normal, 16)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18, 15, 0, 0),
                          child: Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text(
                                    blog.rating.toString(),
                                    style: styleText(
                                        Colors.grey, FontWeight.normal, 17),
                                  ),
                                ),
                                SizedBox(
                                  width: 3.0,
                                ),
                                Icon(
                                  Icons.star_rate,
                                  color: Colors.amberAccent,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: 250,
                        // margin: EdgeInsets.only(right: 10),
                        child: Wrap(
                          // direction: Axis.vertical,
                          children: [
                            Text(
                              blog.blog,
                              style: normalText,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Text("Hello")
            ],
          )),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlogIconContainer(
                  icon1: Icons.favorite_border_outlined,
                  icon2: Icons.chat_bubble_outline,
                  count1: blog.likes.toString(),
                  count2: blog.comments.toString()),
              BlogIconContainer(
                  icon1: Icons.north,
                  icon2: Icons.south,
                  count1: blog.up.toString(),
                  count2: blog.down.toString())
            ],
          )
        ],
      ),
    );
  }

  String convertToK(int likes) {
    if (likes < 1000) {
      return likes.toString();
    }
    double k = likes / 1000;
    var n = k.toStringAsFixed(2);
    return n;
  }
}
