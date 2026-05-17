import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/cubits/user_auth_cubit/user_auth_cubit.dart';
import 'package:hungry_app/views/root_view.dart';
import 'package:hungry_app/views/signup_view.dart';
import 'package:hungry_app/widgets/custom_botton.dart';
import 'package:hungry_app/widgets/custom_field.dart';

class SigninView extends StatefulWidget {
  SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  TextEditingController? emailcontroller = TextEditingController();

  TextEditingController? Passwordcontroller = TextEditingController();

  GlobalKey<FormState> _key = GlobalKey();

  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: BlocProvider(
          create: (context) => UserAuthCubit(),
          child: BlocConsumer<UserAuthCubit, UserAuthState>(
            listener: (context, state) {
              if (state is LoginSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 2),
                    content: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 13,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.userModel.message,
                              style: TextStyle(fontSize: 10),
                            ),
                            CupertinoActivityIndicator(
                              radius: 8,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
                Future.delayed(Duration(seconds: 2), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RootView()),
                  );
                });
              }
              if (state is LoginFailureState) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: state is LoginLoadingState ? true : false,
                child: Scaffold(
                  backgroundColor: Colors.white,
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gap(100),
                        Center(
                          child: SvgPicture.asset(
                            'assets/images/Hungry.svg',
                            color: primrycolor,
                          ),
                        ),
                        Gap(10),
                        Text(
                          'Welcome Back,Discover The Best Foods',
                          style: TextStyle(color: primrycolor, fontSize: 12),
                        ),
                        Gap(50),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffC2CECB),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(22),
                                topRight: Radius.circular(22),
                                bottomLeft: Radius.circular(22),
                                bottomRight: Radius.circular(22),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Form(
                                autovalidateMode: autovalidateMode,
                                key: _key,
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                    child: Column(
                                      children: [
                                        CustomField(
                                          hintText: "Email",
                                          controller: emailcontroller,
                                        ),
                                        Gap(20),
                                        CustomField(
                                          ispassword: true,
                                          hintText: 'Password',
                                          controller: Passwordcontroller,
                                        ),
                                        Gap(25),
                                        CustomBotton(
                                          isLoading: state is LoginLoadingState,
                                          color: primrycolor,
                                          textcolor: Colors.white,
                                          height: 60,
                                          width: MediaQuery.of(
                                            context,
                                          ).size.width,
                                          onTap: () {
                                            if (_key.currentState!.validate()) {
                                              BlocProvider.of<UserAuthCubit>(
                                                context,
                                              ).login(
                                                email: emailcontroller!.text,
                                                password:
                                                    Passwordcontroller!.text,
                                              );
                                            } else {
                                              autovalidateMode =
                                                  AutovalidateMode.always;
                                              setState(() {});
                                            }
                                          },
                                          text: "Login",
                                        ),
                                        Gap(20),
                                        Row(
                                          children: [
                                            CustomBotton(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return SignupView();
                                                    },
                                                  ),
                                                );
                                              },
                                              text: 'Signup ?',
                                              width:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width *
                                                  0.40,
                                              height: 60,
                                            ),
                                            Gap(20),
                                            CustomBotton(
                                              color: Colors.white,
                                              textcolor: primrycolor,
                                              height: 60,
                                              width:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width *
                                                  0.40,
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return RootView();
                                                    },
                                                  ),
                                                );
                                              },
                                              text: 'Guest ?',
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
