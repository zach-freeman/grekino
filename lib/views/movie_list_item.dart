import 'package:flutter/material.dart';

class MovieListItem extends StatelessWidget {
  final String pageTitle;
  final String itemTitle;

  const MovieListItem(
      {super.key, required this.pageTitle, required this.itemTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: Column(
        children: [
          Text(itemTitle),
          Center(
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ),
        ],
      ),
    );
  }
}
