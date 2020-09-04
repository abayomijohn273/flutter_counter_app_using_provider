import 'package:flutter/material.dart';
import 'counterModel.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: SafeArea(
        child: Center(
          child: Consumer<CounterModel>(
            builder: (context, counter, child) {
              return Text(
                counter.count.toString(),
                style: TextStyle(
                  fontSize: 54,
                  color: Colors.blue,
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: Row(
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
            child: Icon(Icons.delete),
          ),
          SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              Provider.of<CounterModel>(context, listen: false).clear();
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
