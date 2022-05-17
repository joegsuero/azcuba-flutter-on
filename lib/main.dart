import 'package:flutter/material.dart';
//
import 'package:application/src/pages/home_page.dart';
import 'package:application/src/models/empresa.dart';
import 'package:application/src/providers/db_providers.dart';

void main() {
  /*runApp(MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.green.shade900,
      )));
*/

  var empr = const Empresa(
    id: 1,
    name: "CUJAI",
    latitude: 12.2,
    longitud: 12.45,
  );

  DBProvider.db.insertEmpresa(empr);

  print(DBProvider.db.empresas());
}
