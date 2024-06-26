import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'image_screen.dart';

class DetailsScreen extends StatefulWidget {
  final String habitTitle;

  DetailsScreen({required this.habitTitle});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isLoading = false;

  Future<void> fetchRandomImage() async {
    setState(() {
      isLoading = true;
    });

    bool imageLoaded = false;

    while (!imageLoaded) {
      try {
        final response = await http.get(Uri.parse('https://random.dog/woof.json'));

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          final String imageUrl = data['url'];

          setState(() {
            isLoading = false;
          });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageScreen(imageUrl: imageUrl),
            ),
          );
          imageLoaded = true;
        } else {
          throw Exception('Failed to load image');
        }
      } catch (e) {
        print('Error loading image: $e');
        // Continue the loop to try again
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Детали',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff131b26),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.all(25.0),
        color: const Color(0xff131b26),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.habitTitle,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Вы проделали большой путь, так держать!',
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: fetchRandomImage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6f1bff),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text(
                  'Получить мотивационную картинку',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              if (isLoading)
                const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
