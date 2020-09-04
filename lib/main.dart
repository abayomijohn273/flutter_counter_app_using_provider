import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counterModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: CounterApp(),
    );
  }
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Consumer<CounterModel>(
            builder: (context, counter, child) {
              return Text(
                counter.count.toString(),
                style: TextStyle(fontSize: 50, color: Colors.teal),
              );
            },
          ),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.all(40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  var counter = context.read<CounterModel>();
                  counter.increment();
                },
                child: Icon(Icons.add),
              ),
              SizedBox(
                width: 15,
              ),
              FloatingActionButton(
                onPressed: () {
                  var counter = context.read<CounterModel>();
                  counter.decrement();
                },
                child: Icon(Icons.remove),
              ),
              SizedBox(
                width: 15,
              ),
              FloatingActionButton(
                onPressed: () {
//                  var counter = context.read<CounterModel>();
//                  counter.reset();

                  Provider.of<CounterModel>(context, listen: false).reset();
                },
                child: Icon(Icons.refresh),
              )
            ],
          ),
        ),
      ),
    );
  }
}
