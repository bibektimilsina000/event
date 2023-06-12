import 'package:event/features/user/presentation/cubit/user_cubit.dart';
import 'package:event/features/user/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Hello User"),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<UserCubit>(context).logout();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
              },
              child: const Text('Log out')),
          const Row()
        ],
      ),
    );
  }
}
