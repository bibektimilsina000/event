import 'package:event/config/app_style.dart';
import 'package:event/features/home/presentation/pages/home_page.dart';
import 'package:event/features/user/presentation/cubit/user_cubit.dart';
import 'package:event/features/user/presentation/widgets/custom_text_field.dart';
import 'package:event/features/user/presentation/widgets/dont_have_an_account.dart';
import 'package:event/features/user/presentation/widgets/error_sucess_pop_up.dart';
import 'package:event/features/user/presentation/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conformPasswordController =
      TextEditingController();
  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 50, left: 35, right: 35),
        children: [
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: const FaIcon(FontAwesomeIcons.arrowLeft),
            onTap: () => Navigator.of(context).pop(),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Create Account",
            style: AppStyle.boldAndExtraLargetext,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Please fill the input below here",
            style: AppStyle.smallGreyext,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            textEditingController: _nameController,
            hintText: 'FULL NAME',
            icon: const FaIcon(FontAwesomeIcons.user),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            textEditingController: _phoneController,
            hintText: 'PHONE',
            icon: const FaIcon(FontAwesomeIcons.mobile),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            textEditingController: _emailController,
            hintText: 'EMAIL',
            icon: const FaIcon(FontAwesomeIcons.envelope),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            textEditingController: _passwordController,
            hintText: 'PASSWORD',
            icon: const FaIcon(FontAwesomeIcons.lock),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            textEditingController: _conformPasswordController,
            hintText: 'CONFIRM PASSWORD',
            icon: const FaIcon(FontAwesomeIcons.lock),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {
              if (state is UserSignUpSucess) {
                Navigator.of(context).push(MaterialPageRoute(
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
              if (state is UserSignUpLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
              return LoginButton(
                  text: 'SIGN UP',
                  onPressed: () {
                    BlocProvider.of<UserCubit>(context).signUp(
                        name: _nameController.text.trim(),
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim());
                  });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          DontHaveAccount(
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: "Alredy have a account?",
            buttonText: "Sign in",
          )
        ],
      ),
    );
  }
}
