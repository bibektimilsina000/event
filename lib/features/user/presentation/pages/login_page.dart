import 'package:event/config/app_style.dart';
import 'package:event/config/constants.dart';
import 'package:event/features/user/presentation/cubit/user_cubit.dart';
import 'package:event/features/user/presentation/pages/sign_up_page.dart';
import 'package:event/features/user/presentation/widgets/custom_text_button.dart';
import 'package:event/features/user/presentation/widgets/custom_text_field.dart';
import 'package:event/features/user/presentation/widgets/dont_have_an_account.dart';
import 'package:event/features/user/presentation/widgets/login_button.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../home/presentation/pages/home_page.dart';
import '../widgets/error_sucess_pop_up.dart';
import '../widgets/social_login.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserLoginSucess) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
          }
          if (state is UserSignUpError) {
            showDialog(
              context: context,
              builder: (context) => SucessErrorAlertDialog(
                text: state.message.toString(),
              ),
            );
          }
        },
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.only(top: 30, left: 35, right: 35),
            children: [
              Image.asset(ImageConstant.imgGirlimg),
              const Text('Login', style: AppStyle.boldAndExtraLargetext),
              const SizedBox(height: 10),
              const Text(
                'Please sign in to continue,',
                style: AppStyle.smallGreyext,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                textEditingController: _emailController,
                hintText: "Email",
                icon: const FaIcon(FontAwesomeIcons.envelope),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                textEditingController: _passwordController,
                icon: const FaIcon(FontAwesomeIcons.lock),
                hintText: "Password",
                obscureText: true,
                trallingIcon: const FaIcon(FontAwesomeIcons.eyeSlash),
              ),
              const SizedBox(height: 10),
              LoginButton(
                  text: "LOGIN",
                  onPressed: () {
                    BlocProvider.of<UserCubit>(context).loginWithEmail(
                        _emailController.text.trim(),
                        _passwordController.text.trim());
                  }),
              const SizedBox(height: 10),
              CustomTextButton(onPressed: () {}, text: 'Forgot Password?'),
              DontHaveAccount(
                  text: "Dont have account?",
                  buttonText: "Sign Up",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ));
                  }),
              const SizedBox(height: 10),
              SocialLogin(
                onFacebookTap: () {
                  BlocProvider.of<UserCubit>(context)
                      .loginWithSocial(provider: 'facebook');
                },
                onGoogleTap: () {
                  BlocProvider.of<UserCubit>(context)
                      .loginWithSocial(provider: 'google');
                },
              )
            ],
          );
        },
      ),
    );
  }
}
