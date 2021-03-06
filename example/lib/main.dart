import 'package:flutter/material.dart';
import 'package:flowmap/flowmap.dart';

// import 'package:get_it/get_it.dart';
// GetIt sl = new GetIt();

void main() { 
  // note: the SL part is optional, just nice if you want your map to be a global singleton
  // sl.registerSingleton(FlowMap(seed: { 'count': 0 }));
  runApp(MyApp());
}

FlowMap counter = FlowMap(seed: { 'count': 0 });

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  // final counter = sl.get<FlowMap>();

  _increment() {
    int current = counter.getItem('count');
    counter.update('count', current + 1);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlowMap Demo'),
      ),
      drawer: Drawer(child: ListView(shrinkWrap: true, children: [counter.devtools()])),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            counter.builder(
              // keyName: 'count',
              builder: (context, val) {
                return Text(
                '$val',
                style: Theme.of(context).textTheme.display1,
              );
            })

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
