import 'package:crashzer/PlayPage.dart';
import 'package:crashzer/prov.dart';
import 'package:flutter/material.dart';
import 'package:crashzer/models.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

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
    loadcate();
    loadmusic();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          child: Stack(
            children: <Widget>[
              Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        colorFilter: new ColorFilter.mode(
                            Colors.indigoAccent[400].withOpacity(0.8),
                            BlendMode.colorBurn),
                        image: AssetImage('Images/fond.jpg'),
                        fit: BoxFit.cover)),
              ),
              Column(
                children: <Widget>[
                  Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('Images/boite.jpeg'),
                                fit: BoxFit.cover),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(40),
                                bottomLeft: Radius.circular(40))),
                      )),
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.format_list_bulleted,
                                size: 32,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Genres',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          ),
                          Consumer<AppState>(
                            builder: (context, appState, child) => Expanded(
                      
                               child: Container(
                                  
                                  child: FutureBuilder<List<Categorie>>(
                                    future: loadcate(),
                                    builder: (context, snapshot) {
                                      if (snapshot.data != null) {
                                        List<Categorie> music = snapshot.data;
                                        return ListView.builder(
                                          itemCount:music[appState.currentindex]
                                              .musique
                                              .length, 
                                          itemBuilder: (context, i) {
                                            return GestureDetector(
                                              onTap: () => Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                      builder: (context) => PlayPage(
                                                          music[appState
                                                                  .currentindex]
                                                              .musique,
                                                          music[appState
                                                                  .currentindex]
                                                              .musique[i],
                                                          i))),
                                              child: Container(
                                                width: width,
                                                margin:
                                                    EdgeInsets.only(bottom: 20),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      height: height/10,
                                    width: width/4.5,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  music[appState
                                                                          .currentindex]
                                                                      .musique[i]
                                                                      .image),
                                                              fit: BoxFit.cover),
                                                          color: Colors.pink,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10)),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text(
                                                          music[appState
                                                                  .currentindex]
                                                              .musique[i]
                                                              .titre,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: width/20),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          music[appState
                                                                  .currentindex]
                                                              .musique[i]
                                                              .nomArtiste,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white54,
                                                              fontSize: width/22),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          width: width/1.6,
                                                          child: Row(
                                                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                            children: <Widget>[
                                                              Container(
                                                                child: Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Icon(
                                                                      Icons
                                                                          .favorite,
                                                                      color: Colors
                                                                          .red,
                                                                    ),
                                                                    Text(
                                                                      '1.2k',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white54,
                                                                          fontSize:
                                                                              width/23),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .play_arrow,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    Text(
                                                                      '60k',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white54,
                                                                          fontSize:
                                                                              width/23),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              
                                                              Container(
                                                                child: Text(
                                                                  '2:30',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white54,
                                                                      fontSize:
                                                                          width/23),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            CircularProgressIndicator(),
                                            CircularProgressIndicator(),
                                            CircularProgressIndicator(),
                                          ],
                                        );
                                      }
                                    },
                                  )),
                            ),
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                  top: 0,
                  child: Container(
                    height: 100,
                    width: width,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(6, 3, 55, 1),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white54,
                          size: 32,
                        ),
                        Container(
                            height: 50,
                            width: width / 1.25,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(29, 33, 75, 1),
                                borderRadius: BorderRadius.circular(50)),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "           Type Here...",
                                  hintStyle: TextStyle(
                                      color: Colors.white54, fontSize: 15)),
                            )),
                        Icon(
                          Icons.search,
                          color: Colors.white54,
                          size: 32,
                        )
                      ],
                    ),
                  )),
              Positioned(
                  top: height / 3.4,
                  right: 20,
                  left: 20,
                  child: Container(
                    height: height / 15,
                    width: width,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(29, 21, 82, 1),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: FutureBuilder<List<Categorie>>(
                            future: loadcate(),
                            builder: (context, snapshot) {
                              if (snapshot.data != null) {
                                List<Categorie> cate = snapshot.data;
                                return Consumer<AppState>(
                                  builder: (context, appState, child) =>
                                      ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: cate.length,
                                    itemBuilder: (context, i) {
                                      return InkWell(
                                        onTap: () {
                                          appState.active(i);
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                right: width / 6.2),
                                            child: Center(
                                                child: Text(
                                              cate[i].nom,
                                              style: TextStyle(
                                                  color:
                                                      appState.currentindex == i
                                                          ? Colors.red
                                                          : Colors.white,
                                                  fontSize: width/20,
                                                  fontWeight: FontWeight.bold),
                                            ))),
                                      );
                                    },
                                  ),
                                  child: Container(),
                                );
                              } else {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    CircularProgressIndicator(),
                                    CircularProgressIndicator(),
                                    CircularProgressIndicator(),
                                  ],
                                );
                              }
                            },
                          )),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
