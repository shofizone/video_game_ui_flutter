import 'package:flutter/material.dart';
import 'package:video_game_ui_flutter/models/forum.dart';
import 'package:video_game_ui_flutter/util/colors.dart';
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
            left: -30,
            bottom: 0,
            top: 0,
            width: 130,
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _tabText("Media", selectedTabIndex == 2, () {
                    _onTapTabText(2);
                  }),
                  _tabText("Streamers", selectedTabIndex == 1, () {
                    _onTapTabText(1);
                  }),
                  _tabText("Forum", selectedTabIndex == 0, () {
                    _onTapTabText(0);
                  }),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70, top: 100),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: forums.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 280,
                  height: 300,
                  child: _buildForumCard(context, forums[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _tabText(String text, bool selected, Function action) {
    return Expanded(
      child: Transform.rotate(
        origin: Offset(-23, -23),
        angle: 1.5708,
        child: InkWell(
          onTap: action,
          child: AnimatedDefaultTextStyle(
            key: Key(text),
            duration: Duration(microseconds: 500),
            style: selected ? selectedTabStyle : defaultTabStyle,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                text,
                key: Key(text),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onTapTabText(int value) {
    setState(() {
      selectedTabIndex = value;
    });
  }

  _buildForumCard(context, Forum forum) {
    return SizedBox(
      width: 280,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
        elevation: 20.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  forum.imagePath,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                )),

            _buildListTileTitleShape(forum.title),
          ],
        ),
      ),
    );
  }

  _buildListTileTitleShape(String title){
    return Material(
      color: primaryColor,
      elevation: 20,
      child: CustomPaint(
        child: Text(title,style: forumNameTextStyle,),
      ),
    );

  }
}
