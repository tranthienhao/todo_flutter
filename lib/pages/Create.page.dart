import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  CreatePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: screenHeight / 6,
            title: Text(widget.title),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Title",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            TextField(
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Theme.of(context).primaryColorLight,
                                    hintText: "Do something...",
                                    border: OutlineInputBorder())),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Content",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            TextField(
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Theme.of(context).primaryColorLight,
                                    hintText: "Do something...",
                                    border: OutlineInputBorder())),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Priority",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 32),
                            Expanded(
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Container(
                                        width: 60,
                                        height: 30,
                                        color: Colors.red,
                                        child: Icon(Icons.check_circle_outline),
                                      )),
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Container(
                                        width: 60,
                                        height: 30,
                                        color: Colors.orange,
                                        child: Icon(Icons.check_circle_outline),
                                      )),
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Container(
                                        width: 60,
                                        height: 30,
                                        color: Colors.blue,
                                        child: Icon(Icons.check_circle_outline),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: FlatButton(
                            color: Colors.green,
                            onPressed: () => {},
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ))
                    ],
                  ))
            ]),
          )
        ],
      ),
    );
  }
}
