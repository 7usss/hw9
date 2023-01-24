import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(MapWidget());
}

class MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              children: [
                Flexible(
                  child: FlutterMap(
                    options: MapOptions(
                      center: LatLng(24.7136, 46.6753),
                      zoom: 8,
                    ),
                    layers: [
                      TileLayerOptions(
                        urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amber,
                  ),
                  height: 150,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 12, right: 12),
                        child: Text(
                          'اختر مدينة',
                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            NewWidget(text1: 'ينبع'),
                            NewWidget(text1: 'الدمام'),
                            NewWidget(text1: 'المدينة'),
                            NewWidget(text1: 'جدة'),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  NewWidget({required this.text1});
  String text1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration:
            BoxDecoration(color: const Color.fromARGB(187, 102, 102, 102), borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
          child: Text(
            text1,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
