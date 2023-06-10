import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/constants.dart';

class SocialLogin extends StatelessWidget {
  final VoidCallback? onFacebookTap;
  final VoidCallback? onGoogleTap;
  const SocialLogin({
    super.key,
    this.onFacebookTap,
    this.onGoogleTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListTile(
            leading: SizedBox(
                width: 30, child: SvgPicture.asset(ImageConstant.imgFacebook)),
            title: const Text('Facebook'),
            onTap: onFacebookTap,
          ),
        ),
        Expanded(
          child: ListTile(
            leading: SizedBox(
                width: 30, child: SvgPicture.asset(ImageConstant.imgGoogle)),
            title: const Text('Google'),
            onTap: onGoogleTap,
          ),
        ),
      ],
    );
  }
}
