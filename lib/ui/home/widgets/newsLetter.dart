import 'package:flutter/material.dart';
import 'package:travel_app/constants/const_colors.dart';
import 'package:travel_app/constants/const_textstyles.dart';

class NewsLetter extends StatefulWidget {
  const NewsLetter({Key? key}) : super(key: key);

  @override
  _NewsLetterState createState() => _NewsLetterState();
}

class _NewsLetterState extends State<NewsLetter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: green_light,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Subscribe to our newsletter",
              style: normalText,
            ),
            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextField(
                          autocorrect: true,
                          autofocus: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'yourmail@xyz.com',
                            hintStyle: normalText,
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("hello");
                    },
                    child: Container(
                      height: double.infinity,
                      width: 50,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Icon(
                        Icons.search,
                        color: white,
                        // size: 5,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
