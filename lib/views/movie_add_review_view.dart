import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grekino/views/movie_add_view.dart';

/// Displays detailed information about a SampleItem.
class MovieAddReviewView extends StatefulWidget {
  final StringCallback onDoneTapped;
  final String posterImageUrl;
  const MovieAddReviewView(
      {super.key, required this.onDoneTapped, required this.posterImageUrl});

  @override
  State<MovieAddReviewView> createState() => _MovieAddReviewViewState();
}

class _MovieAddReviewViewState extends State<MovieAddReviewView> {
  final TextEditingController _textController = TextEditingController();

  final doneTextStyle = const TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.normal,
    fontFamily: 'Roboto',
    fontSize: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Review'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: CachedNetworkImage(imageUrl: widget.posterImageUrl),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 25),
              child: TextButton(
                  onPressed: () {
                    widget.onDoneTapped(_textController.text);
                    Navigator.pop(context);
                  },
                  child: const Text("Done")))
        ],
      ),
      body: Center(
        child: SizedBox(
          height: double.infinity,
          child: TextField(
              controller: _textController,
              style: const TextStyle(color: Colors.black),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                border: InputBorder.none,
                hintText: "Add review...",
                hintStyle: TextStyle(color: Colors.black),
              )),
        ),
      ),
    );
  }
}
