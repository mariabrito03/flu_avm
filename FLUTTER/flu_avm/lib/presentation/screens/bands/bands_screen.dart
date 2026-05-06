import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flu_avm/Config/config.dart';
import 'package:go_router/go_router.dart';



class BandsScreen extends StatelessWidget {
  const BandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bandas'),
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i) {
          return _bandTile(bands[i]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addereNovumBand(context),
        child: Icon(Icons.add),
      ),
    );
  }

Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print('Direction: $direction');
        print('id: ${band.id}');
      },
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Delete band', style: TextStyle(color: Colors.white),),
          ),
        ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(band.nomen.substring(0, 2).toUpperCase()),
        ),
        title: Text(band.nomen),
        trailing: Text('${band.numerusVotum}', style: TextStyle(fontSize: 20),),
        onTap: () {
          print(band.nomen);
        },
      ),
    );
  }

  addereNovumBand(BuildContext context) {
    final TextEditingController textumController = TextEditingController();
/*
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('New band name'),
          content: TextField(
            controller: textumController,
            decoration: InputDecoration(
              hintText: 'Band name',
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                addereBandaAdCollection(context, textumController.text);
              
              },
              textColor: Colors.blue,
              child: Text('Add'),
            ),
          ],
        );
      },
    ); */

showCupertinoDialog(
  context: context, 
  builder: ( BuildContext context ) => CupertinoAlertDialog(
    title: const Text('New band name'),
    content:  CupertinoTextField(
      controller: textumController,
      style: TextStyle(
        color: Theme.of(context).brightness == Brightness.dark 
          ? Colors.white 
          : Colors.black
        )
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Add'),
          onPressed: () {
            addereBandaAdCollection(context, textumController.text);
            context.pop();
          }
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          child: const Text('Close'),
          onPressed: () => context.pop()
        ),
      ],
   )
);
  }

  void addereBandaAdCollection(BuildContext context, String nomen) {
   print(nomen);
   context.pop();
  }


}