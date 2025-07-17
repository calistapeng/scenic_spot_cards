
import 'package:flutter/material.dart';
import 'sliding_container.dart';



class CardHome extends StatelessWidget {
  const CardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40),
              child: Text(
                'Tourist Attraction Card',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SlidingContainer(),
          ],
        ),
      ),
    );
  }
}

