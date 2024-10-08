import 'package:bookly/Features/home_feature/presentation/views/widgets/books_listview.dart';
import 'package:bookly/Features/home_feature/presentation/views/widgets/custom_app_bar.dart';

import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(),
        BooksListview(),
      ],
    );
  }
}
