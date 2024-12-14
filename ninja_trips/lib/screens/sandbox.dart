import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  const Sandbox({Key? key}) : super(key: key);

  @override
  State<Sandbox> createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  double _opacity = 1;
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedContainer(
            duration: Duration(seconds: 1),
            margin: EdgeInsets.all(_margin),
            width: _width,
            color: _color,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: Text('Animate Margin'),
                    onPressed: () => setState(() => _margin = 50),
                  ),
                  ElevatedButton(
                    child: Text('Animate Color'),
                    onPressed: () => setState(() => _color = Colors.purple),
                  ),
                  ElevatedButton(
                    child: Text('Animate Width'),
                    onPressed: () => setState(() => _width = 400),
                  ),
                  ElevatedButton(
                    child: Text('Animate Opacity'),
                    onPressed: () => setState(() => _opacity = 0),
                  ),
                  AnimatedOpacity(
                    opacity: _opacity,
                    duration: Duration(seconds: 2),
                    child: Text(
                      'Hide Me',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )));
  }
}
