import 'package:flutter/material.dart';
import 'package:video_game_ui_flutter/widgts/app_background.dart';
import 'package:video_game_ui_flutter/util/text_style.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(),
          _buildHorizontalTab(),
        ],
      ),
    );
  }

  Widget _buildHorizontalTab() {
    return Container(
      height: 500,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: -20,
            bottom: 0,
            top: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _tabText("Media", selectedTabIndex == 2, (){_onTapTabText(2);}),
                  _tabText("Streamers", selectedTabIndex == 1, (){_onTapTabText(1);}),
                  _tabText("Forum", selectedTabIndex == 0, (){_onTapTabText(0);}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _tabText(String text, bool selected, Function action) {
    return Transform.rotate(
      angle: 1.5708,
      child: InkWell(
        onTap: action,
        child: Text(
            text,
            style: selected ? selectedTabStyle : defaultTabStyle,
          ),
      ),
    );
  }
  _onTapTabText(int value){
    setState(() {
      selectedTabIndex = value;
    });

  }
}
