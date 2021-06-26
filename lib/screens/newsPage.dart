
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

List<Color> favouriteNews=[];
List<int> count=[];
String summary='';

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
                        fontWeight: FontWeight.w200,
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