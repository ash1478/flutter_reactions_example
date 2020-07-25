import 'package:flutter/material.dart';

class PostTitleBar extends StatefulWidget {

  final double height;
  final double width;

  final String userName;
  final String subtitle;
  final String userImg;
  final bool isVerifiedUser;

  const PostTitleBar({@required this.height,@required this.width,@required this.userName,
  @required this.subtitle,@required this.userImg,@required this.isVerifiedUser});



  @override
  _PostTitleBarState createState() => _PostTitleBarState();
}

class _PostTitleBarState extends State<PostTitleBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
//      padding: EdgeInsets.all(widget.width/50),
      child: ListTile(
        contentPadding: EdgeInsets.only(left : widget.width/50),
        leading: Container(
          child: CircleAvatar(
            radius: widget.width/17,
            backgroundImage: NetworkImage(widget.userImg),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(widget.userName,
              style: TextStyle(fontWeight: FontWeight.w700,fontSize: widget.width/25),),
            SizedBox(width: widget.width/30,),
            widget.isVerifiedUser ? Icon(Icons.verified_user,color: Colors.indigoAccent,) : Container()
          ],
        ),
        subtitle: Text(widget.subtitle,style: TextStyle(color: Colors.grey,
            fontSize: widget.width/30),) ,
      ),
    );
  }
}
