import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    Key? key,
    this.onTap,
    this.imgUrl,
  }) : super(key: key);

  final Function? onTap;
  final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: key,
      onPressed: () {
        onTap!();
      },
      icon: SvgPicture.asset(imgUrl!),
      iconSize: 48,
    );
  }
}
