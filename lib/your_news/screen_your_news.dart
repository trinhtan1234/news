import 'package:flutter/material.dart';
import 'package:news/bloc/news_bloc.dart';
import 'package:news/networking/models/image_model.dart';

class ScreenYourNews extends StatefulWidget {
  const ScreenYourNews({super.key});

  @override
  State<ScreenYourNews> createState() => _ScreenYourNewsState();
}

class _ScreenYourNewsState extends State<ScreenYourNews> {
  final NewsBloc _newsBloc = NewsBloc();

  @override
  void initState() {
    loadImage();
    super.initState();
  }

  void loadImage() async {
    _newsBloc.getImageAPI();
  }

  @override
  void dispose() {
    _newsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: StreamBuilder<ImageModel?>(
            stream: _newsBloc.imageAPIStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              final newImage = snapshot.data;
              final imagesMessega = newImage?.message;
              print(imagesMessega);
              if (imagesMessega != null) {
                return Image.network(imagesMessega);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
