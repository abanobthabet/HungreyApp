import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.image,
    required this.title,
    required this.value,
    required this.groupValue,
    this.onChanged,
    required this.color,
    this.subtitle,
    this.onTap,
  });
  final String image;
  final String title;
  final String? subtitle;

  final String value;
  final String groupValue;
  final Function(String?)? onChanged;
  final Color color;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(7)),
      tileColor: color,

      leading: Image.asset(image, height: 72, width: 72),
      title: Text(title, style: TextStyle(color: Colors.white)),
      subtitle: Text(subtitle ?? ''),
      trailing: Radio(
        activeColor: Colors.white,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}
