import 'package:flutter/material.dart';
/*
class NumeratorScreens extends StatelessWidget {

  int counter = 0;

  NumeratorScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Numerator Screen'),
      ),
      body: Center(
        child: Text('Valor: $counter', style: Theme.of(context).textTheme.titleLarge),
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        counter++;
        print(counter);
      },
       child: Icon(Icons.add),
    ),

    );
  }
}
*/

class NumeratorScreens extends StatefulWidget {
  const NumeratorScreens({super.key});

  @override
  State<NumeratorScreens> createState() => _NumeratorScreensState();
}

class _NumeratorScreensState extends State<NumeratorScreens> {
 
 int counter = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Numerator Screen'),
      ),
      body: Center(
        child: Text('Valor: $counter', style: Theme.of(context).textTheme.titleLarge),
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        
        setState(() {
          counter++;
        });
      },
       child: Icon(Icons.add),
    ),

    );
  }
}