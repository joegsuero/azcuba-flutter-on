import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PanelController _pc = new PanelController();
  _pc.setState.CLOSED;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSlidingPanel(_pc),
      floatingActionButton: _searchButton(_pc),
    );
  }
}

Widget _buildSlidingPanel(PanelController pc) {
  return SlidingUpPanel(
    controller: pc,
    panel: Center(
      child: Text("This is the sliding Widget"),
    ),
    body: _body(),
  );
}

Widget _body() {
  return Container(
    child: Column(
      children: [
        Flexible(
          child: FlutterMap(
            options: MapOptions(center: LatLng(21.463, -78.322), zoom: 6),
            layers: [
              TileLayerOptions(urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", subdomains: [
                'a',
                'b',
                'c'
              ]),
            ],
          ),
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
        pc.hide();
        print("sasasas");
      });
}
