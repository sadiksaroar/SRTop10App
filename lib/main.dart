import 'package:flutter/material.dart';

void main() => runApp(SRTop10App());

class SRTop10App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SR TOP 10',
      home: SRTop10Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SRTop10Screen extends StatelessWidget {
  final List<Map<String, dynamic>> players = [
    {'rank': 1, 'name': 'Ioannidis', 'sr': '8,33', 'last5': [9, 9, 10, 10, 8]},
    {'rank': 2, 'name': 'Bernard', 'sr': '8,14', 'last5': [8, 9, 9, 8, 7]},
    {'rank': 3, 'name': 'Vlachodimos', 'sr': '7,91', 'last5': [8, 8, 3, 7, 9]},
    {'rank': 4, 'name': 'Mladenovic', 'sr': '7,22', 'last5': [6, 6, 6, 7, 6]},
    {'rank': 5, 'name': 'Schenkeveld', 'sr': '6,95', 'last5': [6, 8, 7, 7, 8]},
    {'rank': 6, 'name': 'Vilhena', 'sr': '6,76', 'last5': [7, 5, 7, 8, 8]},
    {'rank': 7, 'name': 'SG12', 'sr': '6,45', 'last5': [6, 4, 7, 7, 8]},
    {'rank': 8, 'name': 'Ioannidis', 'sr': '5,99', 'last5': [6, 5, 7, 4, 7]},
    {'rank': 9, 'name': 'Palacios', 'sr': '5,94', 'last5': [7, 6, 5, 5, 6]},
    {'rank': 10, 'name': 'Bernard', 'sr': '5,79', 'last5': [5, 6, 6, 4, 9]},
  ];

  Color getColorForScore(int score) {
    if (score >= 9) return Colors.yellow.shade600;
    if (score >= 7) return Colors.orange.shade400;
    if (score >= 5) return Colors.lightGreen.shade400;
    return Colors.green.shade600;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SR TOP 10'),
        backgroundColor: Colors.blue.shade800,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'Panathinaikos',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey[300],
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: Row(
              children: const [
                Expanded(flex: 1, child: Text('#', style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(flex: 3, child: Text('Player', style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(flex: 2, child: Text('SR', style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(flex: 4, child: Text('LAST 5', style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: players.length,
              itemBuilder: (context, index) {
                final player = players[index];
                return Container(
                  color: index == 0 ? Colors.yellow.shade100 : Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Text(player['rank'].toString())),
                      Expanded(flex: 3, child: Text(player['name'])),
                      Expanded(
                        flex: 2,
                        child: Text(
                          player['sr'],
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: player['last5'].map<Widget>((score) {
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: getColorForScore(score),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                '$score',
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
