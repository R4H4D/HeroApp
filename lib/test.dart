import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  final int id;

  const TestWidget({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text("$id");
  }
}

class TestFinal extends StatefulWidget {
  final int id;

  const TestFinal({Key key, this.id}) : super(key: key);

  @override
  _TestFinalState createState() => _TestFinalState();
}

class _TestFinalState extends State<TestFinal> {
  @override
  Widget build(BuildContext context) {
    return Text('${widget.id}');
  }
}