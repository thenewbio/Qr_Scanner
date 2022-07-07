import 'package:flutter/material.dart';

import '../models/slide_model.dart';

class SlideItem extends StatelessWidget {
  final int index;
  const SlideItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(slideList[index].imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          slideList[index].title,
          style: TextStyle(
            fontSize: 22,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
