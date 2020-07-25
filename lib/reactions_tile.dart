import 'package:flutter/material.dart';


class ReactionsTile extends StatefulWidget {
  final Function(int) selectedReactionId;


  ReactionsTile({this.selectedReactionId});
  @override
  _ReactionsTileState createState() => _ReactionsTileState();
}

class _ReactionsTileState extends State<ReactionsTile> {

  int imgId;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 226,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: List.generate(6, (index) => GestureDetector(
            onTap: (){
              imgId = index;
              widget.selectedReactionId(imgId);
              },
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/$index.png",),fit: BoxFit.cover)
                ),
              ),
            ) )),
      ),
    );
  }
}
