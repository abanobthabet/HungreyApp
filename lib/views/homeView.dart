import 'package:flutter/material.dart' hide SearchBar;
import 'package:gap/gap.dart';
import 'package:hungry_app/widgets/category.dart';
import 'package:hungry_app/widgets/costum_grid.dart';
import 'package:hungry_app/widgets/food_category.dart';
import 'package:hungry_app/widgets/header.dart';
import 'package:hungry_app/widgets/search_bar.dart';

class Homeview extends StatelessWidget {
  Homeview({super.key});
  final List<String> categorys = ['All', 'Combos', 'Sliders', 'Classic'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                scrolledUnderElevation: 0,

                //floating: true,
                pinned: true,
                toolbarHeight: 250,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [Header(), Gap(10), SearchBar(), Gap(10)],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: Category(categorys: categorys)),
              SliverToBoxAdapter(child: Gap(25)),
              CustomGrid(),
            ],
          ),
        ),
      ),
    );
  }
}







// CustomScrollView(
//               physics: BouncingScrollPhysics(),
//               slivers: [
//                 SliverToBoxAdapter(child: Header()),
//                 SliverToBoxAdapter(child: Gap(10)),
//                 SliverToBoxAdapter(child: SearchBar()),
//                 SliverToBoxAdapter(child:  Category(categorys: categorys)),
                
//               ],