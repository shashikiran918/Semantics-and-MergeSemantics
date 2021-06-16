import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: true,
      home:  Scaffold(
        appBar: AppBar(
          title: const Text('SEMANTICS '),
          backgroundColor: Colors.teal,
        ),
        body: BlockSemantics(),
      ),
    );
  }
}

class SemanticsExample extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SemanticsExampleState ();
  }
}

class _SemanticsExampleState extends State<SemanticsExample> {

  bool _isChecked = false;
  int _counter = 0;

  void _increaseCounter() {
    setState(() {
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Semantics(
            label: 'Counter text',
            child: Text(_counter.toString(), style: const TextStyle(fontSize: 20)),
          ),
          Semantics.fromProperties(
            properties: SemanticsProperties(
              button: true,
              onTap:  () => _increaseCounter(),
            ),
            child: OutlinedButton(
              child: const Text('Increase counter'),
              onPressed: () => _increaseCounter(),
            ),
          ),
          MergeSemantics(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {

                    });
                  },
                ),
                Semantics(
                  label: 'Foo',
                  hint: 'This is foo',
                  child: const Text('Foo'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}