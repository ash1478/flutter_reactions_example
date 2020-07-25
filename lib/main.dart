import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterreactionsexample/post_card.dart';
import 'package:flutterreactionsexample/reaction_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

  int id1 = 0;
  int id2 = 1;
  Key _key = Key("a");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical:30,horizontal: 20),
        child: ListView(
          children: <Widget>[
            Container(
                child: PostCard(
                  key: UniqueKey(),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  userName: "Dave",//lob[index].name
                  userImg: "https://htmlstream.com/preview/unify-v2.6/assets/img-temp/400x450/img5.jpg",
                  subtitle: "Online",
                  isVerifiedUser: true,
                  postImgUrl: "https://htmlstream.com/preview/unify-v2.6/assets/img-temp/400x450/img5.jpg",
                  initialReaction: id1,
                  likesCount: 20,
                  actionWidgets: <Widget>[
                    GestureDetector(
                      onTap: () {
                        print("comment button called");
                      },
                      child: Container(
                        child: Icon(Icons.comment,color: Colors.black,
                          size: 25,),
                      ),
                    )
                  ],
                  selectedReactionId: (id) {
                    print("callback to print selected reaction ID " + id.toString());
                    id1 = id;
//                  _key = Key(id.toString());
                    setState(() {

                    });
                  },
                  postOnClickCallback: (){
                    print("callback for post on click!");
                  },
                )
            ),
            Container(
                child: PostCard(
                  key: UniqueKey(),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  userName: "Dave",//lob[index].name
                  userImg: "https://png.pngtree.com/element_our/png/20181206/users-vector-icon-png_260862.jpg",
                  subtitle: "Online",
                  isVerifiedUser: true,
                  postImgUrl: "https://htmlstream.com/preview/unify-v2.6/assets/img-temp/400x450/img5.jpg",
                  initialReaction: id2,
                  likesCount: 20,
                  actionWidgets: <Widget>[
                    Container(
                      child: Icon(Icons.comment,color: Colors.black,size: MediaQuery.of(context).size.width/15,),
                    )
                  ],
                  selectedReactionId: (id) {
                    print("callback to print selected reaction ID " + id.toString());
                    id2 = id;
//                  _key = Key(id.toString());
                    setState(() {

                    });
                  },
                  postOnClickCallback: (){
                    print("callback for post on click!");
                  },
                )
            )
          ],
        )
      ),
    );
  }

}
