import 'package:flutter/material.dart';

import 'widgets/TableSuaredWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(3),
      child: Row(
        children: [
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
                // Respond to button press
            },
            child: Text('CONTAINED BUTTON'),
          ),
          Text("Ejecutando"),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    List<List<String>> dataText = [];

    /*for (var i = 0; i < 15; i++) {
      List<String> d = [];
      for (var j = 0; j < 15; j++) {
        d.add("${i}---${j}");
      }
      dataText.add(d);
    }*/
    List<String> d = [];
    d.add("SELECT");
    d.add("ALL");
    d.add("FROM");
    d.add("ALTER");
    dataText.add(d);
    d=[];
    d.add("COUNT");
    d.add("ORDER");
    d.add("LIKE");
    d.add("AND");
    dataText.add(d);
    d=[];
    d.add("*");
    d.add("AS");
    d.add("GROUP");
    d.add("INSERT");
    dataText.add(d);
    d=[];
    d.add("TABLE");
    d.add("NEW");
    d.add("CREATE");
    d.add("TIMESTAMP");
    dataText.add(d);

Widget mainSection = Container(
      child: Row(
      children: <Widget>[
        TableSuaredWidget(dataText,5,
        5,
        6,
        (Map map){
          debugPrint("Onclick: " + map.toString());
          return map;
        },
        (Map map){
          debugPrint("OnDoubleclick: " + map.toString());
          return map;
        },colorBase: Colors.white, colorClick: Colors.cyan,),
        Expanded(
          flex: 4, // 20%
          child: Row(
            children: [
              Text("SELECT __ FROM organizations WHERE name '%%' AND id = 1 __ BY name;")
            ]
          )
        ),
        

      ],
    )
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          title: Text('Título de ejemplo'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null,
            ),
          ],
        ),
        body: ListView(
          children: [
            titleSection,
            mainSection,
            buttonSection,
            //textSection,
          ],
        ),
        /*floatingActionButton: FloatingActionButton(
          tooltip: 'Add', // utilizado por las tecnologías de accesibilidad para discapacitados
          child: Icon(Icons.add),
          onPressed: null,
        ),*/
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

