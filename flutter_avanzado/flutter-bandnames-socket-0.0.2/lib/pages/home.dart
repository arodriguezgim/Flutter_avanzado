import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:band_names/models/band.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Nos creamos una lista de bandas
  List<Band> bands = [
    Band(id: '1', name: 'Extremoduro', votes: 5),
    Band(id: '2', name: 'La Fuga', votes: 1),
    Band(id: '3', name: 'La La Love You', votes: 2),
    Band(id: '4', name: 'Marea', votes: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grupos de Rock', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
          itemCount: bands.length,
          // Lo que necesitamos para recorrer cada elemento de la lista
          itemBuilder: (context, i) => _bandTile(bands[i])),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), elevation: 1, onPressed: addNewBand),
    );
  }

  Widget _bandTile(Band grupo) {
    return Dismissible(
      // Tenemos que poner algún identificador único
      key: Key(grupo.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print('direction: $direction');
        print('id: ${grupo.id}');
        // TODO: llamar el borrado en el server
      },
      background: Container(
          padding: EdgeInsets.only(left: 8.0),
          color: Colors.red,
          child: Align(
            alignment: Alignment.centerLeft,
            child:
                Text('Eliminar Grupo', style: TextStyle(color: Colors.white)),
          )),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(grupo.name.substring(0, 2)),
          backgroundColor: Colors.red[100],
        ),
        title: Text(grupo.name),
        trailing: Text('${grupo.votes}', style: TextStyle(fontSize: 20)),
        onTap: () {
          print(grupo.name);
        },
      ),
    );
  }

// Mostraremos un diálogo para añadir un grupo

  addNewBand() {
    // Para obtenerla información que el usuario ingresa en el diálogo
    final textController = new TextEditingController();

    if (Platform.isAndroid) {
      // Android
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Nombre del nuevo grupo:'),
            content: TextField(
              //Le asigno al textview el controller
              controller: textController,
            ),
            actions: <Widget>[
              MaterialButton(
                  child: Text('Añadir'),
                  elevation: 5,
                  textColor: Colors.red,
                  onPressed: () => addBandToList(textController.text))
            ],
          );
        },
      );
    }

    // iOS
    showCupertinoDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text('Nombre del nuevo grupo:'),
            content: CupertinoTextField(
              controller: textController,
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                  //optimiza el emulador
                  isDefaultAction: true,
                  child: Text('Añadir'),
                  onPressed: () => addBandToList(textController.text)),
              CupertinoDialogAction(
                  isDestructiveAction: true,
                  child: Text('Cancelar'),
                  onPressed: () => Navigator.pop(context))
            ],
          );
        });
  }

  // Si el tamaño del grupo tiene máa de una letra lo añado y cierro el diálogo
  void addBandToList(String name) {
    print(name);

    if (name.length > 1) {
      // Podemos agregar
      this
          .bands
          .add(new Band(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }

    Navigator.pop(context);
  }
}
