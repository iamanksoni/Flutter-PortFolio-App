import 'package:flutter/material.dart';
import 'calls_and_messages_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'ankit.dart';

void main() {
  setupLocator();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Iamanksoni",
      theme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.light,
      ),
      home: new HomePage(),
    );
  }
}

class Ankitsoni extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage("images/ankitsoni.png");
    Image image = Image(
      image: assetImage,
      height: 400.0,
      width: 280.0,
    );
    return Container(
      child: image,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  final String number = "9430511644";
  final String email = "iamanksoni@gmail.com";

  Widget _pureBody() {
    return Container(
      color: Colors.black38,
      child: new Center(
        child: SingleChildScrollView(
          child: new Column(
        children: <Widget>[
          new Ankitsoni(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: new Text(
              "Hello, I am Ankit Soni. Currently i am pursuing B.E. from TIT College with Computer Science and Engineering. I am passionate about coding and also i am learning to create flexible Android App.",
              style: new TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontStyle: FontStyle.normal,
                height: 1.2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,          
            children: [
              FloatingActionButton(
                backgroundColor: Colors.black,
                elevation: 30.0,
                child: new Icon(
                  Icons.call, color: Colors.yellow,
                ),
                onPressed: () => _service.call(number),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black,
                elevation: 30.0,
                child: new Icon(
                  Icons.sms, color: Colors.yellow, 
                ),
                onPressed: () => _service.sendSms(number),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black,
                elevation: 30.0,
                child: new Icon(
                  Icons.email, color: Colors.yellow,
                ),
                onPressed: () => _service.sendEmail(email),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FlatButton(
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
              color: Colors.black,
              padding: EdgeInsets.fromLTRB(40, 10, 40, 15),
              child: Column(
                children: <Widget>[
                  Icon(Icons.arrow_back,color: Colors.yellow,),
                  Text("Website",style: new TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20.0,color: Colors.yellow,)),
                ],
              ), onPressed: () {
                _launchURL();
              },
            ),
          )
        ],
      )),
      )
    );
  }

  _launchURL() async {
  const url = "http://www.ankitsoni.me/"; 
  if (await canLaunch(url)) { 
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Portfolio",style: new TextStyle(color: Colors.yellow),),
      ),
      body: _pureBody(),
    );
  }
}
