import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int _currentIndex = 0;
  int _numberPages = 3;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
      ),
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            decoration: BoxDecoration(
              gradient: _buildBackgroundGradient(),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () => print('Saltar'),
                      child: Text(
                        'Saltar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 600.0,
                    child: PageView(
                      controller: _pageController,
                      physics: ClampingScrollPhysics(),
                      onPageChanged: (int index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/onboarding0.png',
                                  ),
                                  height: 300,
                                  width: 300,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Connect people\naround the world',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                'Loren ispum dolor sit amet, consect adipiscing elit, sed eiusmid tempor incididunt',
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/onboarding1.png',
                                  ),
                                  height: 300,
                                  width: 300,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Get a new experience\n of imagination',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                'Loren ispum dolor sit amet, consect adipiscing elit, sed eiusmid tempor incididunt',
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/onboarding2.png',
                                  ),
                                  height: 300,
                                  width: 300,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Live you life smarter\n with us',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                'Loren ispum dolor sit amet, consect adipiscing elit, sed eiusmid tempor incididunt',
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 18),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _currentIndex == _numberPages - 1
                        ? [
                            Container(
                              height: 0,
                              width: 0,
                            )
                          ]
                        : _buildPageIndicator(),
                  ),
                  /* _currentIndex != _numberPages - 1
                      ? Expanded(
                          child: Align(
                            alignment: FractionalOffset.bottomRight,
                            child: FlatButton(
                              onPressed: () {
                                _pageController.nextPage(
                                  duration: Duration(
                                    milliseconds: 500,
                                  ),
                                  curve: Curves.ease,
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Next',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 30.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: 0,
                          width: 0,
                        ), */
                ],
              ),
            ),
          ),
        ),
        bottomSheet: _currentIndex == _numberPages - 1
            ? Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 50),
                //color: Colors.white,
                color: Colors.transparent,
                margin: EdgeInsets.only(bottom: 30),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'Vamos correr juntos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  color: Color(0xFFBE0028),
                  onPressed: () {},
                ),
              )
            : Container(
                height: 0,
                width: 0,
              ),
      ),
    );
  }

  LinearGradient _buildBackgroundGradient() {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [const Color(0xFFBE0028), const Color(0xFF2E071B)],
      tileMode: TileMode.clamp,
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numberPages; i++) {
      list.add(i == _currentIndex ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool state) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: state ? 24.0 : 16.0,
      decoration: BoxDecoration(
          color: state ? Colors.white : Color(0xFFBE0028).withOpacity(.6),
          borderRadius: BorderRadius.circular(12)),
    );
  }
}
