// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qr_scanner/views/home_page.dart';
import '../models/slide_model.dart';
import '../widgets/slide_dots.dart';
import '../widgets/slide_image_widget.dart';

class GettingStartedScreen extends StatefulWidget {
  const GettingStartedScreen({Key? key}) : super(key: key);

  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: _screenWidth,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      itemCount: slideList.length,
                      itemBuilder: (ctx, i) => SlideItem(i),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: _screenHeight * .05),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              for (int i = 0; i < slideList.length; i++)
                                if (i == _currentPage)
                                  SlideDots(true)
                                else
                                  SlideDots(false)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: _screenWidth * .5,
                padding: EdgeInsets.only(bottom: _screenHeight * .06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    FlatButton(
                      child: const Text(
                        'Getting Started',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: const EdgeInsets.all(15),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => const QRPage()));
                      },
                    ),
                    SizedBox(height: _screenHeight * .05),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
