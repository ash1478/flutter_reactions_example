import 'package:flutter/material.dart';
import 'package:flutterreactionsexample/reaction_button.dart';

class ActionsWidgetsBar extends StatefulWidget {

  final List<Widget> actionWidgets;

  final double height;
  final double width;

  final int likesCount;
  final int reactionId;

  final Function(bool) showReactions;

  const ActionsWidgetsBar({Key key, this.actionWidgets, this.height, this.width, this.likesCount, this.reactionId, this.showReactions}) : super(key: key);



  @override
  _ActionsWidgetsBarState createState() => _ActionsWidgetsBarState();
}

class _ActionsWidgetsBarState extends State<ActionsWidgetsBar> {


  List<Widget> actualListOfWidgets = List<Widget>();


  @override
  void initState() {
    super.initState();
    addAllWidgets();
  }

  addAllWidgets() {
    actualListOfWidgets.add(ReactionButton(
      initialImgId: widget.reactionId,
      likesCount: widget.likesCount,
      showReactions: (trigger) {
        widget.showReactions(trigger);
      },
    ));
    widget.actionWidgets.forEach((element) {
      actualListOfWidgets.add(Padding(
        padding: EdgeInsets.only(left: widget.width/40),
        child: element,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widget.width/30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: actualListOfWidgets,
      ),
    );
  }
}
