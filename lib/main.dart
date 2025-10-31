import 'package:flutter/material.dart';
import 'package:image_gallery/image_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image gallery app',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => ImageGallery(),
        '/image-view': (context) => ImageView(),
      },
    );
  }
}

class ImageGallery extends StatelessWidget {
  final List<String> images = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.png',
  ];

  ImageGallery({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(title: Text("Titulo da minha pagina")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Número de colunas
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/image-view',
                      arguments: images[index],
                    );
                  },
                  child: Card(child: Image.asset(images[index])),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
