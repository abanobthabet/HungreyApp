import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/constant.dart';

class Category extends StatefulWidget {
  Category({super.key, required this.categorys});
  final List<String> categorys;
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: widget.categorys.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () {
                  isSelected = index;
                  setState(() {});
                },

                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  child: Text(
                    widget.categorys[index],
                    style: TextStyle(
                      color: isSelected == index ? Colors.white : Colors.black,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: isSelected == index
                        ? primrycolor
                        : Colors.grey.withOpacity(0.1),
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
