import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/api/api_consumer.dart';
import 'package:hungry_app/core/api/dio_consumer.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/cubits/user_auth_cubit/user_auth_cubit.dart';
import 'package:hungry_app/views/root_view.dart';
import 'package:hungry_app/widgets/custom_avatar.dart';
import 'package:hungry_app/widgets/custom_botton.dart';
import 'package:hungry_app/widgets/custom_field.dart';

class SignupView extends StatefulWidget {
  SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController? emailcontroller = TextEditingController();

  TextEditingController? namecontroller = TextEditingController();

  TextEditingController? Passwordcontroller = TextEditingController();

  TextEditingController? phonecontroller = TextEditingController();

  GlobalKey<FormState> _key = GlobalKey();

  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserAuthCubit(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: BlocConsumer<UserAuthCubit, UserAuthState>(
          listener: (context, state) {
            if (state is SignupSuccessState) {
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
            if (state is SignupFailureState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is SignupLoadingState ? true : false,
              child: Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(30),
                      Center(
                        child: SvgPicture.asset(
                          'assets/images/Hungry.svg',
                          color: primrycolor,
                        ),
                      ),
                      Gap(50),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: primrycolor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22),
                              topRight: Radius.circular(22),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: SingleChildScrollView(
                              child: Form(
                                key: _key,
                                autovalidateMode: autovalidateMode,
                                child: Column(
                                  children: [
                                    Center(child: CustomAvatar()),
                                    Gap(20),

                                    CustomField(
                                      hintText: 'Name',
                                      controller: namecontroller,
                                    ),
                                    Gap(20),

                                    CustomField(
                                      hintText: 'Phone',
                                      controller: phonecontroller,
                                    ),
                                    Gap(20),

                                    CustomField(
                                      hintText: "Email",
                                      controller: emailcontroller,
                                    ),
                                    Gap(20),

                                    CustomField(
                                      ispassword: true,
                                      hintText: "Password",
                                      controller: Passwordcontroller,
                                    ),
                                    Gap(20),
                                    CustomBotton(
                                      isLoading: state is SignupLoadingState
                                          ? true
                                          : false,
                                      color: Colors.transparent,
                                      height: 60,
                                      width: MediaQuery.of(context).size.width,
                                      onTap: () {
                                        if (_key.currentState!.validate()) {
                                          BlocProvider.of<UserAuthCubit>(
                                            context,
                                          ).signup(
                                            name: namecontroller!.text,
                                            email: emailcontroller!.text,
                                            phone: phonecontroller!.text,
                                            password: Passwordcontroller!.text,
                                          );
                                        } else {
                                          autovalidateMode =
                                              AutovalidateMode.always;
                                          setState(() {});
                                        }
                                      },
                                      text: "Sign Up",
                                      textcolor: Colors.white,
                                    ),
                                    Gap(20),
                                    CustomBotton(
                                      onTap: () => Navigator.pop(context),
                                      text: 'Go To Login ?',
                                      width: double.infinity,
                                      height: 60,
                                    ),
                                  ],
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
    );
  }
}
