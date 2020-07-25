import 'package:flutter/material.dart';
import 'package:flutterreactionsexample/actions_widgets_bar.dart';
import 'package:flutterreactionsexample/post_title_bar.dart';
import 'package:flutterreactionsexample/reactions_tile.dart';

class PostCard extends StatefulWidget {
  final double height;
  final double width;

  final String postImgUrl;

  final String userName;
  final String subtitle;
  final String userImg;
  final bool isVerifiedUser;

  final List<Widget> actionWidgets;
  final int likesCount;
  final int initialReaction;

  final Function() postOnClickCallback;
  final Function(int) selectedReactionId;

  const PostCard({Key key, this.height, this.width, this.postImgUrl, this.userName, this.subtitle, this.userImg, this.isVerifiedUser, this.actionWidgets, this.likesCount, this.initialReaction, this.postOnClickCallback, this.selectedReactionId}) : super(key: key);


  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int currentReaction;
  bool isClicked = false;
  Key _key = Key('a');

  @override
  void initState() {
    super.initState();
    currentReaction = widget.initialReaction;
  }

  @override
  Widget build(BuildContext context) {
    print("Current Reaction ID : " + currentReaction.toString());
    return Container(
      height: widget.height / 2,
      child: Column(
        children: <Widget>[
          PostTitleBar(
            isVerifiedUser: true,
            userImg: widget.userImg,
            userName: widget.userName,
            subtitle: widget.subtitle,
            width: widget.width,
            height: widget.height,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: widget.width / 40),
            child: GestureDetector(
              onTap: widget.postOnClickCallback,
              child: Container(
                height: widget.height / 3.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(widget.postImgUrl),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: <Widget>[
                    isClicked
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: ReactionsTile(
                              selectedReactionId: (id) {
                                isClicked = false;
                                currentReaction = id;
                                print(currentReaction);
                                _key = Key(id.toString());
                                setState(() {});
                                widget.selectedReactionId(id);
                              },
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
            ),
          ),
          ActionsWidgetsBar(
            key: _key,
            reactionId: currentReaction,
            showReactions: (trigger) {
              isClicked = trigger;
              if(!isClicked) {widget.selectedReactionId(-1);}
              setState(() {});
            },
            height: widget.height,
            width: widget.width,
            likesCount: widget.likesCount,
            actionWidgets: widget.actionWidgets,
          ),
        ],
      ),
    );
  }
}
