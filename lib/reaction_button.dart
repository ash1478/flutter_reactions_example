import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterreactionsexample/reactions_tile.dart';

class ReactionButton extends StatefulWidget {
  final int initialImgId;
  final Function(bool) showReactions;
  final int likesCount;

  ReactionButton({this.initialImgId, this.showReactions, this.likesCount});
  @override
  _ReactionButtonState createState() => _ReactionButtonState();
}

class _ReactionButtonState extends State<ReactionButton> {

  bool isClicked = false;
  int imgId;

  @override
  void initState() {
    super.initState();
    imgId = widget.initialImgId;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                //padding: EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  onTap: (){
                    if(imgId != -1){
                      imgId = -1;
                      widget.showReactions(false);
                    }
                    else{
                      isClicked = !isClicked;
                      widget.showReactions(isClicked);
                    }
                  },
                  child: Padding(
                    padding:  EdgeInsets.only(left: 5),
                    child: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(widget.likesCount.toString()),
                          SizedBox(width: 5,),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/${imgId??-1}.png",),fit: BoxFit.cover)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),]
          ),
        ],
      ),
    );
  }
}
