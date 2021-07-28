
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../utils/utils_functions.dart';
import 'dart:async';


class news extends StatefulWidget {
  news({Key? key}) : super(key: key);

  @override
  _newsState createState() => _newsState();
}

class _newsState extends State<news> {
  List<Color> favouriteNews=[];
  List<int> count=[];
  String summary='';
  late Future<News> futureNews;

  Container createNews(Map<String , dynamic> newsList,int i){
    if (i>=favouriteNews.length){
      favouriteNews.add(Colors.blueGrey);
      count.add(0);
    }
    if (newsList['summary'] is String) summary=newsList['summary'];
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: (){
                count[i]+=1;
                setState(() {
                  if(count[i]%2!=0){
                    favouriteNews[i]=Colors.red;
                  }else{
                    favouriteNews[i]=Colors.blueGrey;
                  }
                });
              },
              icon:Icon(
                Icons.favorite,
                color: favouriteNews[i],
                size: 40,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex:1,
                    child: Text(
                        newsList['title'],
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                        summary,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        )
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                        newsList['published'],
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        )
                    ),
                  ),
                ],
              )
          ),
        ],
      ),
      // padding: EdgeInsets.all(0.0),
      margin: EdgeInsets.symmetric(
          vertical: 6.0,
          horizontal: 2.0
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
        border: Border.all(
            color: Colors.white10,
            width: 5,
            style: BorderStyle.solid),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(
              2.0,
              2.0,
            ),
          ),
        ],
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    futureNews = fetchNews();
    // for (int i=0;i<200;i++) favouriteNews.add(Colors.black);
    // print(futureNews);
  }
  Color newsColor=Colors.blueAccent;
  Color favColor=Colors.white;
  Color menuColor=Colors.white;
  Color heartColor=Colors.red;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        // primaryColor: Colors.black,
      ),
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(
                      vertical: 0.0,
                      horizontal: 2.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft:Radius.circular(12.0),
                          topRight: Radius.circular(12.0)
                      ),
                      border: Border.all(
                          color: newsColor,
                          width: 2,
                          style: BorderStyle.solid),
                      boxShadow: [
                        BoxShadow(
                          color: newsColor,
                          offset: const Offset(
                            1.0,
                            1.0,
                          ),
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          if(newsColor==Colors.white){
                            newsColor=Colors.blueAccent;
                            favColor=Colors.white;
                            menuColor=Colors.white;
                            heartColor=Colors.red;
                          }
                        });
                      },
                      child: Icon(
                        Icons.menu,
                        size: 40,
                        color: menuColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(
                      vertical: 0.0,
                      horizontal: 2.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft:Radius.circular(12.0),
                          topRight: Radius.circular(12.0)
                      ),
                      border: Border.all(
                          color: favColor,
                          width: 2,
                          style: BorderStyle.solid),
                      boxShadow: [
                        BoxShadow(
                          color: favColor,
                          offset: const Offset(
                            1.0,
                            1.0,
                          ),
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          if(favColor==Colors.white)
                            favColor=Colors.blueAccent;
                          newsColor=Colors.white;
                          menuColor=Colors.black;
                          heartColor=Colors.white;
                        });
                      },
                      child: Icon(
                        Icons.favorite,
                        size: 40,
                        color: heartColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Center(
            child: FutureBuilder<News>(
              future: futureNews,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // return Text(snapshot.data!.data[0]['title']);
                  return ListView(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (favColor==Colors.white) for(int i=0;i<snapshot.data!.data.length;i++) createNews(snapshot.data!.data[i],i)
                      else if (newsColor==Colors.white) for(int i=0;i<snapshot.data!.data.length;i++) if(count[i]%2!=0) createNews(snapshot.data!.data[i],i)
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }

}