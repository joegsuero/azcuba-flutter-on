import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:application/src/models/empresa.dart';
import 'package:application/src/providers/db_providers.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PanelController _pc = new PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSlidingPanel(_pc),
      //floatingActionButton: _searchButton(_pc),
    );
  }
}

Widget _buildSlidingPanel(PanelController pc) {
  return SlidingUpPanel(
    controller: pc,
    panel: Center(
      child: Text("This is the sliding Widget"),
    ),
    body: _body(pc),
  );
}

Widget _body(PanelController pc) {
  return Container(
    child: Column(
      children: [
        Flexible(
          child: _buildMap(),
        ),
      ],
    ),
  );
}

Widget _searchButton(PanelController pc) {
  return FloatingActionButton(
      child: const Icon(Icons.search),
      backgroundColor: Colors.green.shade900,
      onPressed: () {
        //pc.hide();
        var empr = const Empresa(
          id: 1,
          name: "CUJAE",
          latitude: 12.2,
          longitud: 12.45,
        );

        DBProvider.db.insertEmpresa(empr);

        print(DBProvider.db.empresas());
      });
}

Widget _buildMap() {
  return FlutterMap(
    options: MapOptions(center: LatLng(21.463, -78.322), zoom: 6),
    layers: [
      TileLayerOptions(urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", subdomains: [
        'a',
        'b',
        'c'
      ]),
      MarkerLayerOptions(
        markers: [
          Marker(
            width: 1280.0,
            height: 1280.0,
            point: LatLng(21.463, -78.322),
            builder: (ctx) => Container(
                child: IconButton(
                    icon: Icon(Icons.location_on_sharp),
                    iconSize: 45.0,
                    onPressed: () {
                      //pc.show();
                    })),
          ),
        ],
      ),
    ],
  );
}
