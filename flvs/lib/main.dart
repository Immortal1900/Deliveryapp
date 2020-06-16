import 'package:flutter/material.dart';

String fooicon="https://firebasestorage.googleapis.com/v0/b/sampletvf-8aa59.appspot.com/o/food.jfif?alt=media&token=36030f72-6e79-4e17-aa31-57c50bd501c0";
String sugeicon="https://firebasestorage.googleapis.com/v0/b/sampletvf-8aa59.appspot.com/o/defaultimage.png?alt=media&token=149c5ba8-58bf-429d-972a-6b664c5882ae";
void main() {
  runApp(
   MaterialApp(
     home: MyApp(),
   ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
String name;
void showname(){
  print(name);
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
       super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     
      body: Center(
        child: ListView(
          children: <Widget>[
            Top(),
            Mid(),
            Container(
              height:MediaQuery.of(context).size.height*0.06,
              child: Text("Suggested for you",textAlign: TextAlign.center,style: TextStyle(
                fontSize: 28,
                
              ),),
            ),
            MidLow()
          ],
        ),
      ),
    );
  }
  Top(){
    return Container(
      padding: EdgeInsets.all(8),
      
      height: MediaQuery.of(context).size.height*0.2,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Text("HOME MADE MEALS",
          style: TextStyle(
            fontSize: 30.0
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.account_circle,
              size: 40,),
              SizedBox(width: 10),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              child:TextField(
            decoration: InputDecoration(
              hintText: "SEARCH",
              border: OutlineInputBorder()
            ), 
            ))
            ],
          )
        ],
      )
    );
  }
  Mid(){
    return Container(
    height: MediaQuery.of(context).size.height*0.2,
    child:new GridView.builder(
    itemCount: 5,
    scrollDirection: Axis.horizontal,
    gridDelegate:
      new SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1),
    itemBuilder: (BuildContext context, int index) {
      return Container(
      padding: EdgeInsets.all(8),
     
     child: Card(
         
       child: Column(
         children: <Widget>[
         Text("FOODCATEGORY"),
         SizedBox(width:2),
         Expanded(child: 
         Image.network(fooicon,fit: BoxFit.cover,
          loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null ? 
                    loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                    : null,
              ),
            );
              },
            ),
         ),
         ],
      
     ))
     ,
    );
    })   
    );
  }
  MidLow(){
    return Container(
      
      height:  MediaQuery.of(context).size.height*0.3,
      child: GridView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1), 
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Card(
            color: Colors.yellow,
            child: Column(
              children: <Widget>[
                Text("SOME FOOD"),
                Padding(padding: EdgeInsets.all(5),
                child: Image.network(sugeicon,fit:BoxFit.cover, loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null ? 
                    loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                    : null,
              ),
            );
              },)
                
                )
              ],
            )
          ),
        );
      }),
    );
  }


}