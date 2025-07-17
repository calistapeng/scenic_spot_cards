import 'dart:ui';

import 'model.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'data.dart';

class SlidingCard extends StatelessWidget {

  final double offset;
  final ScenicSpotModel card;

  const SlidingCard({Key? key, required this.offset, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));

    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child: Image.asset(
                card.photo,
                height: MediaQuery.of(context).size.height * 0.4,
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 1.5,
              ),
            ),

            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.withOpacity(0.5),
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                'date: ${card.date}',
                                style: TextStyle(
                                  color: Colors.black26,
                                )
                            ),

                            SizedBox(height: 20,),
                            Text(
                              card.location,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black38,
                              ),
                            ),

                          ],
                        ),
                      ),
                    )
                ),
              ),
            )
          ],
        ),



      ),
    );
  }
}
