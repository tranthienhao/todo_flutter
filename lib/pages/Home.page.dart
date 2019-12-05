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
  var taskList = [];

  void createTask(task) {
    setState(() {
      taskList.add(task);
    });
  }

  void removeTask(task) {
    setState(() {
      taskList.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
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
              flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(bottom: 16, right: 16),
                child: Image.network(
                  "https://cdn3.iconfinder.com/data/icons/round-icons-vol-1-2/120/checklist-512.png",
                  width: screenWidth / 2,
                  height: screenWidth / 2,
                ),
              )),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                taskList
                    .map((task) => TodoItem(item: task, onDone: removeTask))
                    .toList(),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Navigator.pushNamed(context, "/create", arguments: createTask),
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
  const TodoItem({Key key, this.item, this.onDone}) : super(key: key);
  final item;
  final Function onDone;

  @override
  Widget build(BuildContext context) {
    Color priorityColor;
    switch (item['priority']) {
      case "High":
        priorityColor = Colors.red;
        break;
      case "Medium":
        priorityColor = Colors.orange;
        break;
      case "Low":
        priorityColor = Colors.blue;
        break;
      default:
        priorityColor = Colors.orange;
    }
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
                            color: priorityColor,
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 24),
                            child: Text(
                              item["priority"] ?? "Medium",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                item["title"] ?? '',
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 32),
                              ),
                              Text(
                                item["description"] ?? '',
                                maxLines: 2,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    right: 0,
                    child: FlatButton(
                      onPressed: () => onDone(item),
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
                    ))
              ],
            )));
  }
}
