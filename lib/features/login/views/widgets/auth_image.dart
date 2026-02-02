import 'package:flutter/material.dart';

class AuthImage extends StatelessWidget {
  const AuthImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/auth_image.png',
          height: 350,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 50,
          left: 30,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Color(0xff173569),
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xff14468a), width: 2),
                ),
                child: Icon(Icons.note, color: Color(0xff0d7ff2)),
              ),
              SizedBox(width: 10),
              Text(
                'NoteMaster Pro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff0f1922), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
