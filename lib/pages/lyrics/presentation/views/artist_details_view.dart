import 'package:flutter/material.dart';

class ArtistDetailsView extends StatelessWidget {
  const ArtistDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Text("Artist"),
        ),
      ),
    );
  }
}
