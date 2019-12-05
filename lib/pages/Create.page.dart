import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  CreatePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  String title, description, priority;

  void onTitleChanged(text) {
    setState(() {
      title = text;
    });
  }

  void onDescriptionChanged(text) {
    setState(() {
      description = text;
    });
  }

  void setPriority(text) {
    setState(() {
      priority = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    Function onCreate = ModalRoute.of(context).settings.arguments;
    Map<String, dynamic> task = {
      "title": title,
      "description": description,
      "priority": priority
    };
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
                                onChanged: onTitleChanged,
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
                              "Description",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            TextField(
                                onChanged: onDescriptionChanged,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Theme.of(context).primaryColorLight,
                                    hintText: "Some details...",
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
                                    child: GestureDetector(
                                        onTap: () => setPriority("High"),
                                        child: Container(
                                          width: 80,
                                          height: 40,
                                          color: Colors.red,
                                          child: priority == "High"
                                              ? Icon(Icons.check_circle_outline,
                                                  color: Colors.black)
                                              : null,
                                        )),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: GestureDetector(
                                        onTap: () => setPriority("Medium"),
                                        child: Container(
                                          width: 80,
                                          height: 40,
                                          color: Colors.orange,
                                          child: priority == "Medium"
                                              ? Icon(Icons.check_circle_outline,
                                                  color: Colors.black)
                                              : null,
                                        )),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: GestureDetector(
                                        onTap: () => setPriority("Low"),
                                        child: Container(
                                          width: 80,
                                          height: 40,
                                          color: Colors.blue,
                                          child: priority == "Low"
                                              ? Icon(
                                                  Icons.check_circle_outline,
                                                  color: Colors.black,
                                                )
                                              : null,
                                        )),
                                  ),
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
                            onPressed: onCreate is Function
                                ? () {
                                    if (title == null || priority == null) {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                                title: Text("Error"),
                                                content: Text(
                                                    "Please fill the title and select priority!"),
                                                actions: <Widget>[
                                                  FlatButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("OK"),
                                                  )
                                                ]);
                                          });
                                    } else {
                                      Navigator.pop(context);
                                      return onCreate(task);
                                    }
                                  }
                                : () => {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                "SUBMIT",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
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
