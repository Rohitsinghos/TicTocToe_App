import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Tic Toc Toe Game'),
    );
  }
}

int winPlayer=0;
int player = 1;
Color col = Colors.grey;
Color colo = Colors.red;
Color co = Colors.green;
List<Color> list;
String text = "";
String turn="Player1 Turn (Change turn)";
Color accordTurn= Colors.green;
var arr = [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "];
bool isEmpty=true;
String Mood='MultiPlayer';
String Mood2='Single';
String Mood1='SinglePlayer';
String ok=Mood2;
int win = 0;
String stat = "Game Tied!";

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sett();
  }

  isEmptyCheck(){
    int mo=0;
    for(int i=0;i<9;i++){
      if(arr[i]==' '){
        mo=mo+1;
      }
    }

    if(mo==9){
      isEmpty=true;
    }else{
      isEmpty=false;
    }
  }

  void sett() {
    list = <Color>[
      new Color(1),
      new Color(2),
      new Color(3),
      new Color(4),
      new Color(5),
      new Color(6),
      new Color(7),
      new Color(8),
      new Color(9),
    ];

    for (int s = 0; s < 9; s++) {
      list[s] = col;
    }
  }

  void _showChoiceDialog() {
     showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(stat),
              ),),
            content: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: <Widget>[

                       Align(
                            alignment: Alignment.centerLeft,
                            child: RaisedButton(
                              onPressed: nothing,
                              child: Text('Back',style: TextStyle(color: Colors.white),),
                              color: Colors.blue,
                            )
                       ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: RaisedButton(
                            onPressed: reset_game,
                            child: Text('Restart',style: TextStyle(color: Colors.white),),
                            color: Colors.blue,
                          )
                      ),
                    ],
                  ),
                )),
          );
        });
  }
  void _showChoiceVisit() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Do you want to Visit our Website for more!"),
              ),),
            content: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: <Widget>[

                      Align(
                          alignment: Alignment.centerLeft,
                          child: RaisedButton(
                            onPressed: nothing,
                            child: Text('Back',style: TextStyle(color: Colors.white),),
                            color: Colors.blue,
                          )
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: RaisedButton(
                            onPressed: (){
                              launch('https://www.techsickcommunity.tech');
                            },
                            child: Text('Ok',style: TextStyle(color: Colors.white),),
                            color: Colors.blue,
                          )
                      ),
                    ],
                  ),
                )),
          );
        });
  }
  // ignore: non_constant_identifier_names
  void reset_game(){
    if(Navigator.canPop(context)) {
      Navigator.pop(context);
    }
    setState(() {
      reset();
    });

  }
  void nothing(){
      Navigator.pop(context);
      setState(() {

      });
  }

  void reset(){
    for (int s = 0; s < 9; s++) {
      list[s] = col;
    }
    arr = [
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " "
    ];
    text = " ";


    if(win ==1 && ok==Mood1){
      player = 2;
      _autoPlay();
      player=1;
    }
    if(win ==1 && ok==Mood){
      player = 2;

    }

    if( player==2 && ok==Mood1){
      _autoPlay();
      player=1;
    }
    if( player==2 && ok==Mood2){
      _autoPlay();
      player=1;
    }

    win = 0;

    stat = "Game Tied!";
    if(player==1) {
      turn = "Your Turn (Change turn)";
      accordTurn = Colors.green;
    }
    else{
      turn = "Player2 Turn (Change turn)";
      accordTurn = Colors.red;
    }
  }


  void checkWin() {
    if (list[0] == list[3] && list[3] == list[6] && list[0] != col) {
      if (list[0] == Colors.green) {
        win = 1;
      } else {
        win = 2;
      }
    } else if (list[1] == list[4] && list[4] == list[7] && list[1] != col) {
      if (list[1] == Colors.green) {
        win = 1;
      } else {
        win = 2;
      }
    } else if (list[2] == list[5] && list[5] == list[8] && list[2] != col) {
      if (list[2] == Colors.green) {
        win = 1;
      } else {
        win = 2;
      }
    } else if (list[0] == list[1] && list[1] == list[2] && list[0] != col) {
      if (list[0] == Colors.green) {
        win = 1;
      } else {
        win = 2;
      }
    } else if (list[3] == list[4] && list[3] == list[5] && list[3] != col) {
      if (list[3] == Colors.green) {
        win = 1;
      } else {
        win = 2;
      }
    } else if (list[6] == list[7] && list[7] == list[8] && list[6] != col) {
      if (list[6] == Colors.green) {
        win = 1;
      } else {
        win = 2;
      }
    } else if (list[0] == list[4] && list[4] == list[8] && list[0] != col) {
      if (list[0] == Colors.green) {
        win = 1;
      } else {
        win = 2;
      }
    } else if (list[2] == list[4] && list[4] == list[6] && list[2] != col) {
      if (list[2] == Colors.green) {
        win = 1;
      } else {
        win = 2;
      }
    }
    int okk=0;
    for(int i=0;i<9;i++){
      if(arr[i]!=" "){
        okk=okk+1;
      }
    }

    if(player==1){
      accordTurn=Colors.green;
      turn="Player1 Turn";
    }
    else{
      accordTurn=Colors.red;
      turn="Player2 Turn";
    }

    setState(() {
      if (win == 1 ){
        if(Mood==ok) {
          stat = 'Player$win Won!!';
        } else {
          stat = 'You Win!';
        }
        winPlayer=1;
        _showChoiceDialog();

        accordTurn=Colors.grey;
        turn="No Turn";
      }
      else if (win == 2 ){
        if(Mood==ok) {
          stat = 'Player$win Won!';
        } else {
          stat = 'You Lose!';

        }
        winPlayer=2;
        _showChoiceDialog();

        accordTurn=Colors.grey;
        turn="No Turn";
      }
      else if(okk==9) {
        accordTurn=Colors.grey;
        turn="No Turn";
        winPlayer=player;
        win=-1;
        _showChoiceDialog();
      }
    });

  }

  _autoPlay(){
    var putt=100;

    if (list[0] == list[3] && list[6]==col && list[0] == colo) {
      putt=6;
    }else if (list[6] == list[3] && list[0]==col && list[6] == colo) {
      putt=0;
    }else if (list[6] == list[0] && list[3]==col && list[0] == colo) {
      putt=3;
    }

    else if (list[1] == list[4] && list[7] == col && list[1] == colo) {
      putt=7;
    } else if (list[7] == list[4] && list[1] == col && list[7] == colo) {
      putt=1;
    } else if (list[7] == list[1] && list[4] == col && list[7] == colo) {
      putt=4;
    }

    else if (list[2] == list[5] && list[8] == col && list[2] == colo) {
      putt=8;
    } else if (list[8] == list[5] && list[2] == col && list[5] == colo) {
      putt=2;
    } else if (list[2] == list[8] && list[5] == col && list[2] == colo) {
      putt=5;
    }

    else if (list[0] == list[1] && list[2] == col && list[0] == colo) {
      putt=2;
    } else if (list[0] == list[2] && list[1] == col && list[0] == colo) {
      putt=1;
    } else if (list[2] == list[1] && list[0] == col && list[1] == colo) {
      putt=0;
    }

    else if (list[3] == list[4] && list[5] == col && list[3] == colo) {
      putt=5;
    } else if (list[3] == list[5] && list[4] == col && list[3] == colo) {
      putt=4;
    } else if (list[4] == list[5] && list[3] == col && list[4] == colo) {
      putt=3;
    }

    else if (list[6] == list[7] && list[8] == col && list[6] == colo) {
      putt=8;
    } else if (list[7] == list[8] && list[6] == col && list[7] == colo) {
      putt=6;
    } else if (list[6] == list[8] && list[7] == col && list[6] == colo) {
      putt=7;
    }

    else if (list[0] == list[4] && list[8] == col && list[0] == colo) {
      putt=8;
    } else if (list[0] == list[8] && list[4] == col && list[0] == colo) {
      putt=4;
    } else if (list[4] == list[8] && list[0] == col && list[8] == colo) {
      putt=0;
    }

    else if (list[2] == list[4] && list[6] == col && list[2] == colo) {
      putt=6;
    } else if (list[2] == list[6] && list[4] == col && list[6] == colo) {
      putt=4;
    } else if (list[4] == list[6] && list[2] == col && list[4] == colo) {
      putt=2;
    }

    else if (list[0] == list[3] && list[6]==col && list[0] == co) {
      putt=6;
    }else if (list[6] == list[3] && list[0]==col && list[6] == co) {
      putt=0;
    }else if (list[6] == list[0] && list[3]==col && list[0] == co) {
      putt=3;
    }

    else if (list[1] == list[4] && list[7] == col && list[1] == co) {
      putt=7;
    } else if (list[7] == list[4] && list[1] == col && list[7] == co) {
      putt=1;
    } else if (list[7] == list[1] && list[4] == col && list[7] == co) {
      putt=4;
    }

    else if (list[2] == list[5] && list[8] == col && list[2] == co) {
      putt=8;
    } else if (list[8] == list[5] && list[2] == col && list[5] == co) {
      putt=2;
    } else if (list[2] == list[8] && list[5] == col && list[2] == co) {
      putt=5;
    }

    else if (list[0] == list[1] && list[2] == col && list[0] == co) {
      putt=2;
    } else if (list[0] == list[2] && list[1] == col && list[0] == co) {
      putt=1;
    } else if (list[2] == list[1] && list[0] == col && list[1] == co) {
      putt=0;
    }

    else if (list[3] == list[4] && list[5] == col && list[3] == co) {
      putt=5;
    } else if (list[3] == list[5] && list[4] == col && list[3] == co) {
      putt=4;
    } else if (list[4] == list[5] && list[3] == col && list[4] == co) {
      putt=3;
    }

    else if (list[6] == list[7] && list[8] == col && list[6] == co) {
      putt=8;
    } else if (list[7] == list[8] && list[6] == col && list[7] == co) {
      putt=6;
    } else if (list[6] == list[8] && list[7] == col && list[6] == co) {
      putt=7;
    }

    else if (list[0] == list[4] && list[8] == col && list[0] == co) {
      putt=8;
    } else if (list[0] == list[8] && list[4] == col && list[0] == co) {
      putt=4;
    } else if (list[4] == list[8] && list[0] == col && list[8] == co) {
      putt=0;
    }

    else if (list[2] == list[4] && list[6] == col && list[2] == co) {
      putt=6;
    } else if (list[2] == list[6] && list[4] == col && list[6] == co) {
      putt=4;
    } else if (list[4] == list[6] && list[2] == col && list[4] == co) {
      putt=2;
    }

    if(putt==100){

      int count=0;
      for(int k=0;k<9;k++){
        if(arr[k]==' ')
          count++;
      }
      var r=new Random();
      var randomNum=r.nextInt(count);

      int lol = 0;
      for (int k = 0; k < 9; k++) {
        if (arr[k] == " ") {
          if (lol == randomNum) {
            arr[k] = "0";
            print("$k  dekh be\n");
            list[k] = Colors.red;
          }
          lol++;
        }
      }
    }else{

        arr[putt] = "0";
        list[putt] = Colors.red;

    }
    setState(() {

    });
  }

_autoPlay1(){
  int count=0;
  for(int k=0;k<9;k++){
    if(arr[k]==' ')
      count++;
  }
  var r=new Random();
  var randomNum=r.nextInt(count);

  int lol = 0;
  for (int k = 0; k < 9; k++) {
    if (arr[k] == " ") {
      if (lol == randomNum) {
        arr[k] = "0";
        print("$k  dekh be\n");
        list[k] = Colors.red;
      }
      lol++;
    }
  }
  setState(() {

  });
}





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Ts TicTocToe Game',style: TextStyle(fontSize: 25),),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.view_agenda,
              color: Colors.white,
            ),
            onPressed: () {
              _showChoiceVisit();
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: new GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 9,
                itemBuilder: (context, i) => SizedBox(
                      width: 100,
                      height: 100,
                      child: new RaisedButton(
                        onPressed: () {
                          setState(() {
                            if (win == 0) {
                              if (!(list[i] == Colors.green ||
                                  list[i] == Colors.red)) {
                                if (player == 2) {
                                  arr[i] = "0";
                                  list[i] = Colors.red;
                                  player = 1;
                                } else {
                                  arr[i] = "X";
                                  list[i] = Colors.green;
                                  checkWin();
                                  if(ok==Mood1 && win==0){
                                    _autoPlay();
                                  }
                                  else if(ok==Mood2 && win==0){
                                    _autoPlay1();
                                  }
                                  else {
                                    player = 2;
                                  }
                                }
                              }
                              if(win==0)
                              checkWin();
                            }
                          });
                        },
                        child: Text(arr[i],
                            style:
                                TextStyle(fontSize: 45, color: Colors.white)),
                        color: list[i],
                      ),
                    )),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom:88.0),
              child: SizedBox(
                height: 60,
                width: 250,
                child: new RaisedButton(
                  onPressed: (){
                    isEmptyCheck();
                    if(turn!='No Turn' && isEmpty)
                    setState(() {
                          if (Mood1 != ok && Mood2!=ok) {
                            if (player == 1) {
                              player = 2;
                              accordTurn = Colors.red;
                            } else {
                              player = 1;
                              accordTurn = Colors.green;
                            }
                            if (player == 1) {
                              accordTurn = Colors.green;
                            } else {
                              accordTurn = Colors.red;
                            }
                          }
                          else if(Mood1==ok){
                            _autoPlay();
                          }
                          else{
                            _autoPlay1();
                          }
                          checkWin();
                        }

                      );
                  },
                  child: Text((ok==Mood1 || ok==Mood2)?"Your Turn":((player==1)?"Player1 Turn":"Player2 Turn"),
                      style: TextStyle(fontSize: 22, color: Colors.white)),
                  color: accordTurn,
                ),

              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom:15.0,right: 5),
              child: SizedBox(
                height: 60,
                width: 110,
                child: new RaisedButton(
                  onPressed: (){
                    setState(() {
                      ok=Mood1;

                      if(player == 2) {
                        _autoPlay();
                        checkWin();
                        accordTurn=Colors.green;
                        player = 1;
                      }
                    });
                  },
                  child: Text("Master",
                      style: TextStyle(fontSize: 21, color: Colors.white)),
                  color: (Mood1==ok)?Colors.blue:Colors.black,
                ),

              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: SizedBox(
                height: 60,
                width: 110,
                child: new RaisedButton(
                  onPressed: (){
                    setState(() {
                      ok=Mood2;

                      if(player == 2) {
                        _autoPlay1();
                        checkWin();
                        accordTurn=Colors.green;
                        player = 1;
                      }
                    });
                  },
                  child: Text("Noob",
                      style: TextStyle(fontSize: 21, color: Colors.white)),
                  color: (Mood2==ok)?Colors.blue:Colors.black,
                ),

              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom:15.0,left: 5),
              child: SizedBox(
                height: 60,
                width: 110,
                child: new RaisedButton(
                  onPressed: (){
                    setState(() {
                      ok=Mood;
                    });
                  },
                  child: Text("Two\nPlayers",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  color: (Mood==ok)?Colors.blue:Colors.black,
                ),

              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: RaisedButton(
          onPressed: () {
            setState(() {
              reset_game();
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Restart',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          color: Colors.red,
        ),
      ),
    );
  }
}
