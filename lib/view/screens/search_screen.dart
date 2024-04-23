import 'package:flutter/material.dart';
import 'package:master_store/core/constant/color.dart';
import 'package:master_store/view/widgets/search.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.grey,
        elevation: 0,
        title: Text(
          'Master Vape',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
            icon: const Icon(Icons.search),
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
