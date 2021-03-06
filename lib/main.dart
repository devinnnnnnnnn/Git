import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key ? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //the level of user
  int level = 0;
  //the experience point you have at current level;
  int EXP = 0;
  //the maximum of the EXP at current level
  int EXP_MAX = 10;
  //the String type of EXP_MAX
  String EXP_MAX_Str = "10";
  //the name of mission1
  String mission1 = "";
  //the name of mission2
  String mission2 = "";
  ////the name of mission3
  String mission3 = "";

  //set the mission EXP
  int EXP1 = 0;
  int EXP2 = 0;
  int EXP3 = 0;

  bool mission_accomplish1 = false;
  bool mission_accomplish2 = false;
  bool mission_accomplish3 = false;

  void changestate(){
    setState((){
    });
  }

  //setmissionEXP when press "plus" button
  void setmissionEXP1(){
    setState((){
      EXP1 = EXP1 + 10;
    });
  }
  void setmissionEXP2(){
    setState((){
      EXP2 = EXP2 + 10;
    });
  }
  void setmissionEXP3(){
    setState((){
      EXP3 = EXP3 + 10;
    });
  }

  void mission_accomplished1(){
    setState((){
      EXP = EXP + EXP1;
      mission_accomplish1 = true;
    });
  }
  void mission_accomplished2(){
    setState((){
      EXP = EXP + EXP2;
      mission_accomplish2 = true;
    });
  }
  void mission_accomplished3(){
    setState((){
      EXP = EXP + EXP3;
      mission_accomplish3 = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    while( EXP >= EXP_MAX ){
      EXP = EXP - EXP_MAX;
      level++;
      EXP_MAX = level*10 + 20;
      EXP_MAX_Str = "$EXP_MAX ";
    }

    if(mission_accomplish1==false && mission_accomplish2==false && mission_accomplish3==false) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Scaffold example"),
          leading: Icon(FontAwesomeIcons.dragon),
        ),

        //progress bar
        body: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('LV:',),
              Text('$level',),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: FAProgressBar(
                  currentValue: EXP,
                  displayText: '/$EXP_MAX_Str',
                  maxValue: EXP_MAX,
                ),
              ),
            ],
          ),
        ),

        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Devin Lee'),
                accountEmail: Text('test_mail@gmail.com'),
                currentAccountPicture: Image.asset('assets/cat.jpg'),
                decoration: BoxDecoration(color: Colors.deepOrange),
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('$mission1 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP1'),

              ListTile(
                leading: Icon(Icons.headset),
                title: Text('$mission2 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP2'),

              ListTile(
                leading: Icon(Icons.star),
                title: Text('$mission3 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP3'),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????1??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission1 = text;
                    print("$mission1 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextField(
                    decoration: new InputDecoration(labelText: "???????????????2??????"),
                    keyboardType: TextInputType.text,
                    onChanged: (text) {
                      mission2 = text;
                      print("$mission2 ");
                      changestate();
                      }, // Only numbers can be entered
                  ),
              ),

              new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextField(
                    decoration: new InputDecoration(labelText: "???????????????3??????"),
                    keyboardType: TextInputType.text,
                    onChanged: (text) {
                      mission3 = text;
                      print("$mission3 ");
                      changestate();
                      }, // Only numbers can be entered
                  ),
              ),

              //set the mission EXP
              new Container(
                padding: const EdgeInsets.all(10.0),
                child:new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new FloatingActionButton(
                        onPressed: setmissionEXP1,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                         size: 30,
                        )
                    ),

                    new FloatingActionButton(
                        onPressed: setmissionEXP2,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),

                    new FloatingActionButton(
                        onPressed: setmissionEXP3,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),
                  ],
                ),
              ),

              //mission accomplished
              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new FloatingActionButton(
                        onPressed: mission_accomplished1,
                        tooltip: '????????????1?????????',
                        child: Icon(
                          Icons.assignment_turned_in,
                          size: 30,
                        )
                    ),

                    new FloatingActionButton(
                        onPressed: mission_accomplished2,
                        tooltip: '????????????2?????????',
                        child: Icon(
                          Icons.assignment_turned_in,
                          size: 30,
                        )
                    ),

                    new FloatingActionButton(
                        onPressed: mission_accomplished3,
                        tooltip: '????????????3?????????',
                        child: Icon(
                          Icons.assignment_turned_in,
                          size: 30,
                        )
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      );
    }  // accomplished: 0

    else if(mission_accomplish1==false && mission_accomplish2==false && mission_accomplish3==true) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Scaffold example"),
          leading: Icon(FontAwesomeIcons.dragon),
        ),

        //progress bar
        body: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('LV:',),
              Text('$level',),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: FAProgressBar(
                  currentValue: EXP,
                  displayText: '/$EXP_MAX_Str',
                  maxValue: EXP_MAX,
                ),
              ),
            ],
          ),
        ),

        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Devin Lee'),
                accountEmail: Text('test_mail@gmail.com'),
                currentAccountPicture: Image.asset('assets/cat.jpg'),
                decoration: BoxDecoration(color: Colors.deepOrange),
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('$mission1 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP1'),

              ListTile(
                leading: Icon(Icons.headset),
                title: Text('$mission2 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP2'),

              ListTile(
                leading: Icon(Icons.star),
                title: Text('$mission3 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP3'),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????1??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission1 = text;
                    print("$mission1 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????2??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission2 = text;
                    print("$mission2 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????3??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission3 = text;
                    print("$mission3 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              //set the mission EXP
              new Container(
                padding: const EdgeInsets.all(10.0),
                child:new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new FloatingActionButton(
                        onPressed: setmissionEXP1,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),

                    new FloatingActionButton(
                        onPressed: setmissionEXP2,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),

                    new FloatingActionButton(
                        onPressed: setmissionEXP3,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),
                  ],
                ),
              ),

              //mission accomplished
              new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new FloatingActionButton(
                          onPressed: mission_accomplished1,
                          tooltip: '????????????1?????????',
                          child: Icon(
                            Icons.assignment_turned_in,
                            size: 30,
                          )
                      ),

                      new FloatingActionButton(
                          onPressed: mission_accomplished2,
                          tooltip: '????????????2?????????',
                          child: Icon(
                            Icons.assignment_turned_in,
                            size: 30,
                          )
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      );
    }  // accomplished: 3

    else if(mission_accomplish1==true && mission_accomplish2==false && mission_accomplish3==false) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Scaffold example"),
          leading: Icon(FontAwesomeIcons.dragon),
        ),

        //progress bar
        body: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('LV:',),
              Text('$level',),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: FAProgressBar(
                  currentValue: EXP,
                  displayText: '/$EXP_MAX_Str',
                  maxValue: EXP_MAX,
                ),
              ),
            ],
          ),
        ),

        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Devin Lee'),
                accountEmail: Text('test_mail@gmail.com'),
                currentAccountPicture: Image.asset('assets/cat.jpg'),
                decoration: BoxDecoration(color: Colors.deepOrange),
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('$mission1 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP1'),

              ListTile(
                leading: Icon(Icons.headset),
                title: Text('$mission2 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP2'),

              ListTile(
                leading: Icon(Icons.star),
                title: Text('$mission3 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP3'),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????1??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission1 = text;
                    print("$mission1 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????2??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission2 = text;
                    print("$mission2 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????3??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission3 = text;
                    print("$mission3 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              //set the mission EXP
              new Container(
                padding: const EdgeInsets.all(10.0),
                child:new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new FloatingActionButton(
                        onPressed: setmissionEXP1,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),

                    new FloatingActionButton(
                        onPressed: setmissionEXP2,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),

                    new FloatingActionButton(
                        onPressed: setmissionEXP3,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),
                  ],
                ),
              ),

              //mission accomplished
              new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new FloatingActionButton(
                          onPressed: mission_accomplished2,
                          tooltip: '????????????2?????????',
                          child: Icon(
                            Icons.assignment_turned_in,
                            size: 30,
                          )
                      ),

                      new FloatingActionButton(
                          onPressed: mission_accomplished3,
                          tooltip: '????????????3?????????',
                          child: Icon(
                            Icons.assignment_turned_in,
                            size: 30,
                          )
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      );
    }  // accomplished: 1

    else if(mission_accomplish1==false && mission_accomplish2==true && mission_accomplish3==false) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Scaffold example"),
          leading: Icon(FontAwesomeIcons.dragon),
        ),

        //progress bar
        body: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('LV:',),
              Text('$level',),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: FAProgressBar(
                  currentValue: EXP,
                  displayText: '/$EXP_MAX_Str',
                  maxValue: EXP_MAX,
                ),
              ),
            ],
          ),
        ),

        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Devin Lee'),
                accountEmail: Text('test_mail@gmail.com'),
                currentAccountPicture: Image.asset('assets/cat.jpg'),
                decoration: BoxDecoration(color: Colors.deepOrange),
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('$mission1 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP1'),

              ListTile(
                leading: Icon(Icons.headset),
                title: Text('$mission2 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP2'),

              ListTile(
                leading: Icon(Icons.star),
                title: Text('$mission3 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP3'),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????1??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission1 = text;
                    print("$mission1 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????2??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission2 = text;
                    print("$mission2 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????3??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission3 = text;
                    print("$mission3 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              //set the mission EXP
              new Container(
                padding: const EdgeInsets.all(10.0),
                child:new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new FloatingActionButton(
                        onPressed: setmissionEXP1,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),

                    new FloatingActionButton(
                        onPressed: setmissionEXP2,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),

                    new FloatingActionButton(
                        onPressed: setmissionEXP3,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),
                  ],
                ),
              ),

              //mission accomplished
              new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new FloatingActionButton(
                          onPressed: mission_accomplished1,
                          tooltip: '????????????1?????????',
                          child: Icon(
                            Icons.assignment_turned_in,
                            size: 30,
                          )
                      ),

                      new FloatingActionButton(
                          onPressed: mission_accomplished3,
                          tooltip: '????????????3?????????',
                          child: Icon(
                            Icons.assignment_turned_in,
                            size: 30,
                          )
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      );
    }  // accomplished: 2

    else if(mission_accomplish1==true && mission_accomplish2==true && mission_accomplish3==false) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Scaffold example"),
          leading: Icon(FontAwesomeIcons.dragon),
        ),

        //progress bar
        body: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('LV:',),
              Text('$level',),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: FAProgressBar(
                  currentValue: EXP,
                  displayText: '/$EXP_MAX_Str',
                  maxValue: EXP_MAX,
                ),
              ),
            ],
          ),
        ),

        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Devin Lee'),
                accountEmail: Text('test_mail@gmail.com'),
                currentAccountPicture: Image.asset('assets/cat.jpg'),
                decoration: BoxDecoration(color: Colors.deepOrange),
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('$mission1 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP1'),

              ListTile(
                leading: Icon(Icons.headset),
                title: Text('$mission2 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP2'),

              ListTile(
                leading: Icon(Icons.star),
                title: Text('$mission3 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP3'),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????1??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission1 = text;
                    print("$mission1 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????2??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission2 = text;
                    print("$mission2 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????3??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission3 = text;
                    print("$mission3 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              //set the mission EXP
              new Container(
                padding: const EdgeInsets.all(10.0),
                child:new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new FloatingActionButton(
                        onPressed: setmissionEXP1,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),

                    new FloatingActionButton(
                        onPressed: setmissionEXP2,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),

                    new FloatingActionButton(
                        onPressed: setmissionEXP3,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),
                  ],
                ),
              ),

              //mission accomplished
              new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new FloatingActionButton(
                          onPressed: mission_accomplished3,
                          tooltip: '????????????3?????????',
                          child: Icon(
                            Icons.assignment_turned_in,
                            size: 30,
                          )
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      );
    }  // accomplished: 1, 2

    else if(mission_accomplish1==false && mission_accomplish2==true && mission_accomplish3==true) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Scaffold example"),
          leading: Icon(FontAwesomeIcons.dragon),
        ),

        //progress bar
        body: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('LV:',),
              Text('$level',),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: FAProgressBar(
                  currentValue: EXP,
                  displayText: '/$EXP_MAX_Str',
                  maxValue: EXP_MAX,
                ),
              ),
            ],
          ),
        ),

        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Devin Lee'),
                accountEmail: Text('test_mail@gmail.com'),
                currentAccountPicture: Image.asset('assets/cat.jpg'),
                decoration: BoxDecoration(color: Colors.deepOrange),
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('$mission1 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP1'),

              ListTile(
                leading: Icon(Icons.headset),
                title: Text('$mission2 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP2'),

              ListTile(
                leading: Icon(Icons.star),
                title: Text('$mission3 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP3'),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????1??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission1 = text;
                    print("$mission1 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????2??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission2 = text;
                    print("$mission2 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????3??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission3 = text;
                    print("$mission3 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              //set the mission EXP
              new Container(
                padding: const EdgeInsets.all(10.0),
                child:new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new FloatingActionButton(
                        onPressed: setmissionEXP1,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),

                    new FloatingActionButton(
                        onPressed: setmissionEXP2,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),

                    new FloatingActionButton(
                        onPressed: setmissionEXP3,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),
                  ],
                ),
              ),

              //mission accomplished
              new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new FloatingActionButton(
                          onPressed: mission_accomplished1,
                          tooltip: '????????????1?????????',
                          child: Icon(
                            Icons.assignment_turned_in,
                            size: 30,
                          )
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      );
    }  // accomplished: 2, 3

    else if(mission_accomplish1==true && mission_accomplish2==false && mission_accomplish3==true) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Scaffold example"),
          leading: Icon(FontAwesomeIcons.dragon),
        ),

        //progress bar
        body: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('LV:',),
              Text('$level',),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: FAProgressBar(
                  currentValue: EXP,
                  displayText: '/$EXP_MAX_Str',
                  maxValue: EXP_MAX,
                ),
              ),
            ],
          ),
        ),

        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Devin Lee'),
                accountEmail: Text('test_mail@gmail.com'),
                currentAccountPicture: Image.asset('assets/cat.jpg'),
                decoration: BoxDecoration(color: Colors.deepOrange),
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('$mission1 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP1'),

              ListTile(
                leading: Icon(Icons.headset),
                title: Text('$mission2 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP2'),

              ListTile(
                leading: Icon(Icons.star),
                title: Text('$mission3 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP3'),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????1??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission1 = text;
                    print("$mission1 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????2??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission2 = text;
                    print("$mission2 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????3??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission3 = text;
                    print("$mission3 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              //set the mission EXP
              new Container(
                padding: const EdgeInsets.all(10.0),
                child:new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new FloatingActionButton(
                        onPressed: setmissionEXP1,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),

                    new FloatingActionButton(
                        onPressed: setmissionEXP2,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),

                    new FloatingActionButton(
                        onPressed: setmissionEXP3,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),
                  ],
                ),
              ),

              //mission accomplished
              new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new FloatingActionButton(
                          onPressed: mission_accomplished2,
                          tooltip: '????????????2?????????',
                          child: Icon(
                            Icons.assignment_turned_in,
                            size: 30,
                          )
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      );
    }  // accomplished: 1, 3

    else{
      return Scaffold(
        appBar: AppBar(
          title: Text("Scaffold example"),
          leading: Icon(FontAwesomeIcons.dragon),
        ),

        //progress bar
        body: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('LV:',),
              Text('$level',),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: FAProgressBar(
                  currentValue: EXP,
                  displayText: '/$EXP_MAX_Str',
                  maxValue: EXP_MAX,
                ),
              ),
            ],
          ),
        ),

        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Devin Lee'),
                accountEmail: Text('test_mail@gmail.com'),
                currentAccountPicture: Image.asset('assets/cat.jpg'),
                decoration: BoxDecoration(color: Colors.deepOrange),
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('$mission1 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP1'),

              ListTile(
                leading: Icon(Icons.headset),
                title: Text('$mission2 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP2'),

              ListTile(
                leading: Icon(Icons.star),
                title: Text('$mission3 '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              new Text('EXP: $EXP3'),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????1??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission1 = text;
                    print("$mission1 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????2??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission2 = text;
                    print("$mission2 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: "???????????????3??????"),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    mission3 = text;
                    print("$mission3 ");
                    changestate();
                  }, // Only numbers can be entered
                ),
              ),

              //set the mission EXP
              new Container(
                padding: const EdgeInsets.all(10.0),
                child:new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new FloatingActionButton(
                        onPressed: setmissionEXP1,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),

                    new FloatingActionButton(
                        onPressed: setmissionEXP2,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),

                    new FloatingActionButton(
                        onPressed: setmissionEXP3,
                        tooltip: '??????????????????10???EXP:?????????',
                        child: Icon(
                          Icons.add,
                          size: 30,
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
