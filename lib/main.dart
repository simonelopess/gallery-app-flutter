import 'package:flutter/material.dart';
import 'package:image_gallery/image_view.dart';
import 'package:image_gallery/routes.dart';

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
        Routes.home: (context) => ImageGallery(),
        Routes.imageView: (context) => ImageView(),
      },
    );
  }
}

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  final List<String> images = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.png',
  ];

  void _addImage() {
    setState(() {
      images.add("assets/images/image1.jpg");
    });
  }

  void _deleteImage(int index) {
    setState(() {
      if (index >= 0 && index < images.length) {
        images.removeAt(index);
      } else {
        debugPrint('⚠️ Índice inválido ao tentar remover: $index');
      }
    });
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Titulo da minha pagina"),
        actions: [
          IconButton(onPressed: _addImage, icon: Icon(Icons.add_box, size: 36)),
        ],
      ),
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
                if (index >= images.length) return const SizedBox.shrink();
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.imageView,
                      arguments: images[index],
                    );
                  },
                  onLongPress: () {
                    _deleteImage(index);
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
