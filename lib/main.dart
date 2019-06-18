import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basic Animation',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  
  Animation<Color> animation;
  AnimationController animationController;


  @override
  void initState() {
    super.initState();
    
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    animation = ColorTween(begin: Colors.yellow, end: Colors.green).animate(animationController);
    animation.addListener((){
      setState(() {
        print(animation.value.toString());
      });
    });

    animation.addStatusListener((status)=> print(status));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: animation.value,
        child: FlutterLogo(
        ),
      ),
    );
  }
}


