import 'package:flutter/material.dart';
import 'package:flutter_portfolio/pages/AndroidPhonePage.dart';

class IphonePage extends StatefulWidget {
  const IphonePage({super.key});

  @override
  State<IphonePage> createState() => _IphonePageState();
}

class _IphonePageState extends State<IphonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/iphone.png',
              height: 650.0,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 85,
              left: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildImageContainer('assets/hacker.png', 'about'),
                  const SizedBox(width: 30),
                  buildImageContainer('assets/hacker.png', 'about'),
                  const SizedBox(width: 30),
                  buildImageContainer('assets/hacker.png', 'about'),
                ],
              ),
            ),
            Positioned(
              top: 175,
              left: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildImageContainer('assets/hacker.png', 'Tt 1'),
                  const SizedBox(width: 30),
                  buildImageContainer('assets/hacker.png', 'about'),
                  const SizedBox(width: 20),
                  buildImageContainer('assets/hacker.png', 'about'),
                ],
              ),
            ),
            Positioned(
              top: 265,
              left: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildImageContainer('assets/hacker.png', 'Text 1'),
                  const SizedBox(width: 30),
                  buildImageContainer('assets/hacker.png', 'about'),
                  const SizedBox(width: 30),
                  buildImageContainer('assets/hacker.png', 'about'),
                ],
              ),
            ),
            Positioned(
              top: 355,
              left: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildImageContainer('assets/hacker.png', 'Text 1'),
                  const SizedBox(width: 30),
                  buildImageContainer('assets/hacker.png', 'about'),
                  const SizedBox(width: 30),
                  buildImageContainer('assets/hacker.png', 'about'),
                ],
              ),
            ),
            Positioned(
              top: 445,
              left: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildImageContainer('assets/hacker.png', 'Text 1'),
                  const SizedBox(width: 30),
                  buildImageContainer('assets/hacker.png', 'about'),
                  const SizedBox(width: 30),
                  buildImageContainer('assets/hacker.png', 'about'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AndroidPhonePage()),
                );
              },
              child: Icon(Icons.adb_rounded),
            ),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.apple),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImageContainer(String imagePath, String text) {
    return Column(
      children: [
        Container(
          width: 55.0,
          height: 55.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35.0),
            // border: Border.all(color: Colors.black, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5), // Space between image and text
        Text(
          text,
          style: TextStyle(
              color: const Color.fromARGB(
                  255, 0, 0, 0)), // Customize text style as needed
        ),
      ],
    );
  }
}
