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
  
  Animation<double> animation;
  AnimationController animationController;


  @override
  void initState() {
    super.initState();
    
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 4000));
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);

    animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed){
        animationController.forward();
      }
    });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedLogo(animation: animation,)
    );
  }
}


class AnimatedLogo extends AnimatedWidget{
  final Tween<double> _sizeAnim = Tween<double>(begin: 0.0, end: 300.0);

  AnimatedLogo({Key key, Animation animation}):super(
    key:key,
    listenable:animation
  );

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Transform.scale(
      scale: _sizeAnim.evaluate(animation),
      child: FlutterLogo(
      ),
    );
  }


}