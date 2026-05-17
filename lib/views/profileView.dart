import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/widgets/custo_list_tile.dart';
import 'package:hungry_app/widgets/custom_botton.dart';
import 'package:hungry_app/widgets/custom_botton_profile.dart';
import 'package:hungry_app/widgets/custom_filed_profile.dart';

class Profileview extends StatefulWidget {
  Profileview({super.key});

  @override
  State<Profileview> createState() => _ProfileviewState();
}

class _ProfileviewState extends State<Profileview> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    nameController.text = 'Abanob';
    emailController.text = 'abanob@gmail.com';
    phoneController.text = '01010101010';
    addressController.text = '123 Main St';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          actionsPadding: EdgeInsets.all(10),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(
              color: Colors.black,
              onPressed: () {},
              icon: Icon(Icons.edit),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/images/pngtree-default-avatar-profile-icon.png',
                  ),
                ),
                Gap(30),
                CustomFiledProfile(
                  controller: nameController,
                  labelText: 'Name',
                ),
                Gap(20),
                CustomFiledProfile(
                  controller: emailController,
                  labelText: 'Email',
                ),
                Gap(20),
                CustomFiledProfile(
                  controller: phoneController,
                  labelText: 'Phone',
                ),
                Gap(20),

                Divider(color: Colors.white),
                Gap(20),
                ListTile(
                  onTap: () {},
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  tileColor: Color(0xff373737),

                  leading: Image.asset(
                    'assets/images/visa.png',
                    height: 72,
                    width: 72,
                  ),
                  title: Text(
                    'Visa / Mastercard',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '3566 **** **** 0505',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Radio(
                    activeColor: Colors.white,
                    value: 'card',
                    groupValue: 'card',
                    onChanged: (v) {},
                  ),
                ),
                Gap(60),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      CustomBottonPorfile(
                        text: 'Edit Profile',
                        icon: Icons.edit,
                        onPressed: () {},
                        color: primrycolor,
                        textColor: Colors.white,
                      ),

                      Spacer(),
                      CustomBottonPorfile(
                        text: 'Logout',
                        icon: Icons.logout,
                        onPressed: () {},
                        color: Colors.transparent,
                        textColor: Colors.redAccent,
                      ),
                    ],
                  ),
                ),
                Gap(150),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
