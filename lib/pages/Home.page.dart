import 'package:flutter/material.dart';
import 'package:todo_flutter/themes/brightness.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  var brightness = Prefs.singleton();
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        key: scaffoldKey,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: screenHeight / 4,
              title: Text(widget.title),
              leading: IconButton(
                  onPressed: () {
                    scaffoldKey.currentState.openDrawer();
                  },
                  icon: Icon(Icons.menu)),
              // bottom: PreferredSize(
              //     child: Container(
              //       color: Colors.red,
              //       alignment: Alignment.topLeft,
              //       child: Text(widget.title),
              //     ),
              //     preferredSize: Size.fromHeight(10.0)),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                TodoItem(
                  item: 12,
                ),
                TodoItem(
                  item: 12,
                ),
                TodoItem(
                  item: 12,
                ),
              ]),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, "/create"),
          child: Icon(Icons.add),
        ),
        drawer: SizedBox(
          width: 100,
          child: new Drawer(
            child: Container(
              alignment: Alignment.bottomCenter,
              color: Theme.of(context).backgroundColor,
              child: GestureDetector(
                onTap: () {
                  return brightness.setTheme(
                      brightness.getTheme() == 'Light' ? 'Dark' : 'Light');
                },
                child: Container(
                  color: Colors.orange,
                  width: 100,
                  height: 100,
                  child: Center(child: Icon(Icons.brightness_high)),
                ),
              ),
            ),
          ),
        ));
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem({Key key, this.item}) : super(key: key);
  final item;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 16),
        margin: EdgeInsets.only(top: 16),
        child: ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  color: Theme.of(context).primaryColorLight,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16)),
                          child: Container(
                            color: Colors.yellow,
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 24),
                            child: Text(
                              "medium",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 8, bottom: 16, left: 16, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "title",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 32),
                              ),
                              Text(
                                "subtitle",
                                maxLines: 1,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  child: Chip(
                    backgroundColor: Theme.of(context).cardColor,
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Done "),
                        Icon(
                          Icons.check_circle_outline,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
