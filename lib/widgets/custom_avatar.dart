import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/cubits/user_auth_cubit/user_auth_cubit.dart';
import 'package:image_picker/image_picker.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<UserAuthCubit>();
    return BlocBuilder<UserAuthCubit, UserAuthState>(
      builder: (context, state) {
        return CircleAvatar(
          radius: 50,
          backgroundImage: cubit.image != null
              ? FileImage(File(cubit.image!.path))
              : const AssetImage('assets/images/avatar.png') as ImageProvider,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 39,
                  width: 39,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () async {
                        ImagePicker()
                            .pickImage(source: ImageSource.gallery)
                            .then((value) => cubit.uploadImage(value));
                      },
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
