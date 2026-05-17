import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/cubits/user_auth_cubit/user_auth_cubit.dart';
import 'package:hungry_app/views/splash_view.dart';

void main() {
  runApp(const HungryApp());
}

class HungryApp extends StatelessWidget {
  const HungryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserAuthCubit(),
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: SplashView(),
      ),
    );
  }
}
