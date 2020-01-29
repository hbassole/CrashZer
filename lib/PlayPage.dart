import 'dart:async';
import 'package:crashzer/models.dart';
import 'package:crashzer/prov.dart';
import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:provider/provider.dart';
import 'PlayList.dart';

class PlayPage extends StatefulWidget {
  List<Musique>listmusic;
  Musique music;
  int f;
  PlayPage(this.listmusic,this.music,this.f);
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  Musique maMusiqueActuelle;
  AudioPlayer audioPlayer;
  StreamSubscription positionSub;
  StreamSubscription stateSubscription;
  Duration  position= new Duration(seconds: 0);
  Duration duree=new Duration(seconds: 10);
  PlayerState statut = PlayerState.stopped;
  List<Musique>listmusic=[];
int index=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    maMusiqueActuelle = widget.listmusic[index];
    configurationAudioPlayer();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      builder: (context)=>AddMusic(),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(29, 21, 82, 1),
        body: Stack(
          children: <Widget>[
            Container(
              height: height,
              width: width,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Text('Recenty Played',style: TextStyle(fontSize: width/20,color: Colors.white,fontWeight: FontWeight.bold),),
                    SizedBox(height: width/15,),
                    Container(
                      height: height/5,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.listmusic.length,
                        itemBuilder: (context,i){
                          return Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Column(
                              children: <Widget>[
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      position=Duration(seconds: 0);
                                      audioPlayer.stop();
                                      widget.f=i;
                                    });

                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(widget.listmusic[i].image),fit: BoxFit.cover
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    height: height/10,
                                    width: width/4.5,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(widget.listmusic[i].titre,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: width/25),)
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: height/1.4,
              width: width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.0),
                      Color.fromRGBO(5, 1, 60, 1).withOpacity(0.8),
                    ],
                  ),
                  color: Colors.white,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40))
              ),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20),
                  width: width,
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: width/11,
                          backgroundImage: ExactAssetImage(widget.listmusic[widget.f].image),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(       
                                  width: width/1.5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(widget.listmusic[widget.f].nomArtiste,style: TextStyle(color: Colors.white54,fontSize: width/20),),
                                    InkWell(
                                        onTap: (){
                                         listmusic.add(widget.listmusic[widget.f]);
                                          //add.getmusic.add(widget.listmusic[widget.f]);
                                          //add.addwagon(widget.listmusic[widget.f]);
                                        },
                                        child: Icon(Icons.queue_music,color: Colors.white,size: width/13,))
                                  ],
                                ),
                              ),
                            Text(widget.listmusic[widget.f].titre,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: width/15),),

                          ],

                        )
                      ],
                    ),
                  ),
                  SizedBox(height: width/13,)
                ],
              ),

            ),
            Container(
              height: height/1.9,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.listmusic[widget.f].image),fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.indigoAccent[200], BlendMode.colorBurn)
                ),
                  color: Colors.white,
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.0),
                      Color.fromRGBO(5, 1, 60, 1).withOpacity(0.8),
                    ],
                  ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40))
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.only(left:20.0,right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: ()=>Navigator.of(context).pop(),
                            child: Icon(Icons.arrow_back,size: 32,color: Colors.white70,)),
                        GestureDetector(
                            onTap: ()=>Navigator.of(context).push(MaterialPageRoute(
                              builder: (context)=>PlayList(listmusic)
                            )),
                            child: Icon(Icons.apps,size: 32,color: Colors.white70,))
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(widget.listmusic[widget.f].titre,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                  SizedBox(height: 10,),
                  Text(widget.listmusic[widget.f].description,style: TextStyle(color: Colors.white54,),),
                  SizedBox(height: 20,),
                  Slider(
                    value: position.inSeconds.toDouble(),
                    min: 0.0,
                    max: duree.inSeconds.toDouble(),
                    inactiveColor: Colors.white,
                    activeColor: Colors.red,
                    onChanged: (double b){
                      setState(() {
                        audioPlayer.seek(b);
                      });
                    },
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: width/1.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(fromDuration(position),style: TextStyle(color: Colors.white54),),
                        Text(fromDuration(duree),style: TextStyle(color: Colors.white54),)

                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.repeat,size: 32,color: Colors.white,),
                      GestureDetector(
                          onTap: rewind,
                          child: Icon(Icons.fast_rewind,size: 40,color: Colors.white,)),
                      GestureDetector(
                        onTap: (statut==PlayerState.playing)?pause:play,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor:Colors.red,
                          child: Center(child: (statut==PlayerState.playing)?Icon(Icons.pause,size: 50,color: Colors.white,):Icon(Icons.play_arrow,size: 50,color: Colors.white,)),
                        ),
                      ),
                      GestureDetector(
                          onTap: forward,
                          child: Icon(Icons.fast_forward,size: 40,color: Colors.white,)),
                      Icon(Icons.repeat_one,size:32,color: Colors.white,)
                    ],
                  ),

                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  void configurationAudioPlayer(){
    audioPlayer= new AudioPlayer();
    positionSub=audioPlayer.onAudioPositionChanged.listen(
        (pos)=>setState(()=>position=pos)
    );
    stateSubscription=audioPlayer.onPlayerStateChanged.listen((state){
      if(state==AudioPlayerState.PLAYING){
        setState(() {
          duree=audioPlayer.duration;
        });
      }else if(state==AudioPlayerState.STOPPED){
        setState(() {
            statut=PlayerState.stopped;
        });
      }
    },onError:(message){
      print("Erreur : $message");
      setState(() {
        statut=PlayerState.stopped;
        duree=new Duration(seconds: 0);
        position=new Duration(seconds: 0);
      });
    }
    );
  }
  Future play()async{
    await audioPlayer.play(widget.listmusic[widget.f].lien);
    setState(() {
      statut=PlayerState.playing;
    });
  }
  Future pause()async{
    await audioPlayer.pause();
    setState(() {
      statut=PlayerState.paused;
    });
  }
  void forward() {
    if (widget.f+1== widget.listmusic.length-1) {
      widget.f = 0;
    } else {
      if(widget.f+1==widget.listmusic.length){

      }else{
        widget.f++;
      }

    }
    maMusiqueActuelle = widget.listmusic[widget.f];
    audioPlayer.stop();
    configurationAudioPlayer();
    play();
  }

  void rewind() {
    if (position > Duration(seconds: 3)) {
      audioPlayer.seek(0.0);
    } else {
      if (widget.f == 0) {
        widget.f = widget.listmusic.length - 1;
      } else {
        widget.f--;
      }
      maMusiqueActuelle = widget.listmusic[widget.f];
      audioPlayer.stop();
      configurationAudioPlayer();
      play();
    }
  }



String fromDuration(Duration duree){
    return duree.toString().split('.').first;
}
}
enum PlayerState{
  playing,
  stopped,
  paused,
}
