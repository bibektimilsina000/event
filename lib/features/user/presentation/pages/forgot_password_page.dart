import 'package:event/config/app_style.dart';
import 'package:event/features/user/presentation/cubit/user_cubit.dart';
import 'package:event/features/user/presentation/pages/verify_otp_page.dart';
import 'package:event/features/user/presentation/widgets/custom_text_field.dart';
import 'package:event/features/user/presentation/widgets/error_sucess_pop_up.dart';
import 'package:event/features/user/presentation/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../config/constants.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 50, left: 35, right: 35),
        children: [
          GestureDetector(
            child: const FaIcon(FontAwesomeIcons.arrowLeft),
            onTap: () => Navigator.of(context).pop(),
          ),
          Image.asset(ImageConstant.imgGirlimg),
          const Text(
            'Forgot Password ',
            style: AppStyle.boldAndExtraLargetext,
          ),
          const SizedBox(height: 10),
          const Text(
            'Enter you mobile number or email to get otp',
            style: AppStyle.smallGreyext,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            textEditingController: _emailController,
            icon: const FaIcon(FontAwesomeIcons.envelope),
            hintText: 'Enter you mobile number or email',
          ),
          const SizedBox(height: 20),
          BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {
              if (state is UserOtpSendError) {
                showDialog(
                  context: context,
                  builder: (context) =>
                      SucessErrorAlertDialog(text: state.message),
                );
              }
              if (state is UserOtpSendSucess) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const VerifyOtpPage(),
                ));
              }
            },
            builder: (context, state) {
              return LoginButton(
                  text: "GET OTP",
                  onPressed: () {
                    BlocProvider.of<UserCubit>(context)
                        .getOtpForPasswordReset(_emailController.text.trim());
                  });
            },
          )
        ],
      ),
    );
  }
}
