import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(

        child: Container(
          //height: MediaQuery.of(context).size.height,
          //color: Colors.black38,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Weekend Gateway",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Just returned from fantastic weekend trip to the mountains. "
                        "The views were breathtaking, and fresh air was so refreshing. "
                        "Already planned our next adventure ",
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildIconAndCount(icon: CupertinoIcons.heart, count: 67),
                            _buildIconAndCount(
                              icon: Icons.message_outlined,
                              count: 32,
                            ),
                            _buildIconAndCount(icon: CupertinoIcons.share, count: 5),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 150,
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Most Relevant"),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),
                      _buildCommentTile(
                        name: "Sophia Clark",
                        comment: "Sound amazing where exactly did you go?",
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.only(left: 50),
                        // color: Colors.grey,
                        width: double.infinity,
                        child: Column(
                          children: [
                            _buildCommentTile(
                              name: "Ethan Carter",
                              comment: "I am so jealous! I need a break too",
                              thumbDown: 1,
                              thumbUps: 18,
                            ),
                            SizedBox(height: 20),
                            _buildCommentTile(
                              name: "Olivia Bennett",
                              comment: "The mountains are calling and i must go!",
                              thumbDown: 3,
                              thumbUps: 30,
                            ),


                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  CircleAvatar(child: Icon(Icons.person)),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Add",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        fillColor: Colors.grey[300],
                        filled: true,
                        suffixIcon: Icon(Icons.image),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildCommentTile({
    required String name,
    required String comment,
    int thumbUps = 25,
    int thumbDown = 2,
  }) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.black38,
          child: Icon(Icons.person) /*Image.asset("assets/avatar.png")*/,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 6),
                  Text(
                    "Nov 12",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              Text(comment),
              SizedBox(height: 10),
              Row(
                children: [
                  _buildIconAndCount(
                    icon: Icons.thumb_up_alt_outlined,
                    count: thumbUps,
                  ),
                  SizedBox(width: 50),
                  _buildIconAndCount(
                    icon: Icons.thumb_down_alt_outlined,
                    count: thumbDown,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildIconAndCount({required IconData icon, required int count}) {
    return Row(
      children: [
        Icon(icon, size: 18),
        SizedBox(width: 5),
        Text(count.toString()),
      ],
    );
  }
}
