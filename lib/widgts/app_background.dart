import 'package:flutter/material.dart';
import 'package:video_game_ui_flutter/util/colors.dart';

class AppBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        return Stack(
          children: <Widget>[
            Container(
              color: backgroundColor,
            ),

            //############## First circle
            Positioned(
              left: -(height / 2 - width / 2),
              bottom: height * 0.25,
              child: Container(
                height: height,
                width: height,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: firstCircleColor),
              ),
            ),
//####################Second circle
            Positioned(
              left: width / 4,
              top: -(height / 2.55),
              child: Container(
                height: width * 1.5,
                width: width * 1.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: secondCircleColor,
                ),
              ),
            ),

            //####################Third circle
            Positioned(
              right: -(width * 0.15),
              top: -50,
              child: Container(
                height: width / 2,
                width: width / 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: firstCircleColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
