
import 'package:bookly/Features/home_feature/presentation/views/widgets/custom_listview_item.dart';
import 'package:flutter/material.dart';

class BooksListview extends StatelessWidget {
  const BooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .27,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, intdex) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: CustomListViewItem(),
          );
        },
      ),
    );
  }
}
