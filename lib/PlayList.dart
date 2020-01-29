import 'package:crashzer/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'prov.dart';
import 'PlayPage.dart';
class PlayList extends StatefulWidget {
  List<Musique>listmusic;
  PlayList(this.listmusic);
  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      builder: (context)=>AddMusic(),
      child: Scaffold(
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
                          colorFilter: new ColorFilter.mode(Colors.indigoAccent[400].withOpacity(0.8), BlendMode.colorBurn),
                          image: AssetImage('Images/fond.jpg'),fit: BoxFit.cover
                      )
                  ),
                ),
                Column(
                  children: <Widget>[
                    Expanded(
                        flex: 4,
                        child:Container(
                          decoration: BoxDecoration(
                              image:DecorationImage(
                                  image: AssetImage('Images/boite.jpeg'),fit: BoxFit.cover
                              ),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40))
                          ),
                        )
                    ),
                    Expanded(
                      flex: 8,
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0,right: 20,top: 20),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20,),
                            Row(
                              children: <Widget>[
                                Icon(Icons.format_list_bulleted,size: 32,color: Colors.white,),
                                SizedBox(width: 10,),
                                Text('Genres',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
                              ],
                            ),
                            Consumer<AddMusic>(
                              builder: (context,promusic,child)=>Container(
                                  height: height/1.79,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                    itemCount: widget.listmusic.length,
                                    itemBuilder: (context,i){
                                      return GestureDetector(
                                        onTap: ()=>Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context)=>PlayPage(widget.listmusic,widget.listmusic[i],i)
                                        )),
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 20),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                height:100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(widget.listmusic[i].image),fit: BoxFit.cover
                                                    ),
                                                    color:Colors.pink,
                                                    borderRadius: BorderRadius.circular(10)
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(widget.listmusic[i].titre,style:TextStyle(color: Colors.white ,fontWeight: FontWeight.bold,fontSize: 20),),
                                                  SizedBox(height: 5,),
                                                  Text(widget.listmusic[i].nomArtiste,style:TextStyle(color: Colors.white54,fontSize: 18),),
                                                  SizedBox(height: 5,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: <Widget>[
                                                      Icon(Icons.favorite,color: Colors.red,),
                                                      Text('1.2k',style:TextStyle(color: Colors.white54 ,fontSize: 18),),
                                                      SizedBox(width: 10,),
                                                      Icon(Icons.play_arrow,color: Colors.white,),
                                                      Text('60k',style:TextStyle(color: Colors.white54 ,fontSize: 18),),
                                                      SizedBox(width: width/7.5,),
                                                      Text('2:30',style:TextStyle(color: Colors.white54 ,fontSize: 18),),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );

                                    },
                                  )
                              ),
                              child: Container(),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                    top: 0,
                    child:Container(
                      height: 100,
                      width: width,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(6, 3, 55, 1),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: ()=>Navigator.pop(context),
                              child: Icon(Icons.arrow_back,color: Colors.white54,size: 32,)),
                          Container(
                              height: 50,
                              width: width/1.25,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(29, 33, 75, 1),
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: TextField(decoration: InputDecoration(border: InputBorder.none,hintText: "           Type Here...",hintStyle: TextStyle(color: Colors.white54,fontSize: 15)),)
                          ),
                          Icon(Icons.search,color: Colors.white54,size: 32,)
                        ],
                      ),
                    )
                ),
                Positioned(
                    top: height/3.4,
                    right: 20,
                    left: 20,
                    child: Container(
                      height: height/15,
                      width: width,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(29, 21, 82, 1),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Center(
                        child: Container(
                            margin: EdgeInsets.only(left: 20,right: 20),
                            child: Text('PlayList',style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.bold),)
                        ),
                      ),
                    )


                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
