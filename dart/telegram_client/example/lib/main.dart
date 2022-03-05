import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MaterialApp(
    home: SignPage(),
  ));
}

class SignPage extends StatefulWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
 var dimension = 40.0;

  increaseWidgetSize() {
    setState(() {
      dimension += 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          Text('Dimension: $dimension'),
          Container(
            color: Colors.teal,
            alignment: Alignment.center,
            height: dimension,
            width: dimension,
            // LayoutBuilder inherits its parent widget's dimension. In this case, the Container in teal
            child: LayoutBuilder(builder: (context, constraints) {
              debugPrint('Max height: ${constraints.maxHeight}, max width: ${constraints.maxWidth}');
              return Text("jalo okso"); // create function here to adapt to the parent widget's constraints
            }),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increaseWidgetSize,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
