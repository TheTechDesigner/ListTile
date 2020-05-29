import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFC41A3B),
        primaryColorLight: Color(0xFFFBE0E6),
        accentColor: Color(0xFF1B1F32),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'ListTile';
  bool _switch = false;
  Mission _mission = Mission.yes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            // contentPadding: EdgeInsets.all(16.0),
            selected: true,
            onLongPress: () {
              print('onLongPress');
            },
            onTap: () {
              print('onTap');
            },
            title: Text('One Line ListTile'),
          ),
          ListTile(
            title: Text('One Line With Leading Widget'),
            leading: CircleAvatar(
              backgroundColor: Colors.red,
            ),
          ),
          ListTile(
            title: Text('One Line With Trailing Widget'),
            trailing: Icon(Icons.more_vert),
          ),
          ListTile(
            title: Text('One Line With Both Widgets'),
            leading: CircleAvatar(backgroundColor: Colors.purple),
            trailing: Icon(Icons.more_vert),
          ),
          ListTile(
            title: Text('One Line Dense ListTile'),
            dense: true,
          ),
          ListTile(
            title: Text('Two Line ListTile'),
            subtitle: Text('Second Line'),
            leading: CircleAvatar(backgroundColor: Colors.pink),
            trailing: Icon(Icons.more_vert),
          ),
          ListTile(
            title: Text('Three Line ListTile'),
            subtitle:
                Text('For Three Line ListTile You Can Write Long Subtitle.'),
            leading: CircleAvatar(backgroundColor: Colors.yellow),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
          ListTileTheme(
            contentPadding: EdgeInsets.all(16.0),
            dense: true,
            selectedColor: Colors.green,
            iconColor: Colors.green,
            textColor: Colors.green,
            style: ListTileStyle.drawer,
            child: ListTile(
              title: Text('ListTileTheme'),
              leading: CircleAvatar(backgroundColor: Colors.green),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            color: Colors.white70,
            child: ListTile(
              title: Text('ListTile With Card'),
              leading: CircleAvatar(backgroundColor: Colors.black),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          SwitchListTile(
            title: Text('Switch ListTile'),
            secondary: Icon(Icons.swap_vertical_circle),
            value: _switch,
            onChanged: (bool value) {
              setState(() {
                _switch = value;
              });
            },
          ),
          RadioListTile(
            title: Text('Yes'),
            activeColor: Colors.red,
            value: Mission.yes,
            groupValue: _mission,
            onChanged: (Mission value) {
              setState(() {
                _mission = value;
              });
            },
          ),
          RadioListTile(
            title: Text('No'),
            activeColor: Colors.red,
            value: Mission.no,
            groupValue: _mission,
            onChanged: (Mission value) {
              setState(() {
                _mission = value;
              });
            },
          ),
          CheckboxListTile(
            title: Text('CheckBox ListTile (Slow Motion Animation)'),
            secondary: Icon(Icons.timer),
            activeColor: Colors.red,
            value: timeDilation != 1.0,
            onChanged: (bool value) {
              setState(() {
                timeDilation = value ? 10.0 : 1.0;
              });
            },
          ),
        ],
      ),
    );
  }
}

enum Mission { yes, no }
