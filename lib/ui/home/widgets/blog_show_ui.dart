import 'package:flutter/material.dart';
import 'package:travel_app/models/blog_model.dart';

class ShowBlog extends StatelessWidget {
  final Blog blog;
  const ShowBlog({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(blog.title),
    );
  }
}
