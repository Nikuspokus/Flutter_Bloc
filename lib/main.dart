import 'package:flutter/material.dart';
import 'package:mon_premier_bloc/bloc/counter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.red,),
      home: Interface('Mon premier BLoC'),
    );
  }
}

class Interface extends StatelessWidget {
  final String title;

  CounterBloc bloc = CounterBloc();

  Interface(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: StreamBuilder(
        stream: bloc.stream,
        builder: (context, snapshot ){
          return
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("vous avez appuyé sur ce bouton:", style: TextStyle(fontSize: 32), textAlign: TextAlign.center,),
                  Text("${snapshot.data}",style: TextStyle(fontSize: 32), textAlign: TextAlign.center,),
                ],
              ),
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => bloc.incrementCounter(),
      ),
    );
  }
}


