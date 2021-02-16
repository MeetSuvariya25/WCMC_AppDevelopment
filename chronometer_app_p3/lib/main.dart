
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'images/chronosplash.png',
            scale: 3.0,
        ),
        splashTransition: SplashTransition.rotationTransition,
        nextScreen: MyHome(),
        backgroundColor: Colors.amber,
        duration: 2000,
      ),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  bool startispressed = true;
  bool stopispressed = true;
  bool resetispressed = true;
  String stoptimetodisplay="00:00:00";
  final dur=const Duration(seconds: 1);
  //inbuilt stopwatch
  var swatch= Stopwatch();

  void starttimer(){
    Timer(dur, keeprunning);
  }

  void keeprunning(){
    if(swatch.isRunning){
      starttimer();
    }
    setState(() {
      stoptimetodisplay=swatch.elapsed.inHours.toString().padLeft(2,"0")+":"+(swatch.elapsed.inMinutes%60).toString().padLeft(2,"0")+":"+(swatch.elapsed.inSeconds%60).toString().padLeft(2,"0");
    });
  }

  void startstopwatch(){
    setState(() {
      stopispressed=false;
      startispressed=false;
      resetispressed=true;
    });
    swatch.start();
    starttimer();
    
  }
  void stopstopwatch(){
    setState(() {
      stopispressed=true;
      resetispressed=false;
      startispressed=true;
    });
    swatch.stop();
  }
  void resetstopwatch(){
    setState(() {
      resetispressed=true;
      startispressed=true;
    });
    swatch.reset();
    stoptimetodisplay="00:00:00";
  }

  Widget Chronometer(){
    return Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  stoptimetodisplay,
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: stopispressed ? null : stopstopwatch,
                          elevation: 10.0,
                          color: Colors.red,
                          splashColor: Colors.black26,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                          padding: EdgeInsets.symmetric(
                            horizontal: 40.0,
                            vertical: 15.0,
                          ),
                          child: Text('Stop',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                        ),
                        RaisedButton(
                          onPressed: resetispressed ? null : resetstopwatch,
                          elevation: 10.0,
                          color: Colors.teal,
                          splashColor: Colors.black26,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                          padding: EdgeInsets.symmetric(
                            horizontal: 40.0,
                            vertical: 15.0,
                          ),
                          child: Text('Reset',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                        ),
                      ],
                    ),
                    RaisedButton(
                      onPressed: startispressed ? startstopwatch : null,
                      elevation: 15.0,
                      color: Colors.indigo,
                      splashColor: Colors.black26,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      padding: EdgeInsets.symmetric(
                        horizontal: 80.0,
                        vertical: 20.0,
                      ),
                      child: Text('Start',style: TextStyle(fontSize: 25.0,color: Colors.white),),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chronometer'),
      ),
      body: Chronometer(),
    );
  }
}

