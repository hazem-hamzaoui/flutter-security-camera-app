import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> history = [
      {'camera': 'Camera 1', 'date': '31/03/2026', 'time': '10:32', 'duration': '2h 15min', 'type': 'Mouvement', 'color': Colors.orange},
      {'camera': 'Camera 2', 'date': '31/03/2026', 'time': '09:15', 'duration': '1h 45min', 'type': 'Intrusion', 'color': Colors.red},
      {'camera': 'Camera 1', 'date': '30/03/2026', 'time': '22:00', 'duration': '3h 00min', 'type': 'Enregistrement', 'color': Colors.blue},
      {'camera': 'Camera 2', 'date': '30/03/2026', 'time': '18:30', 'duration': '0h 45min', 'type': 'Mouvement', 'color': Colors.orange},
      {'camera': 'Camera 1', 'date': '29/03/2026', 'time': '14:00', 'duration': '1h 00min', 'type': 'Intrusion', 'color': Colors.red},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historique'),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: history.length,
        itemBuilder: (context, index) {
          final item = history[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: (item['color'] as Color).withOpacity(0.2),
                child: Icon(Icons.videocam, color: item['color'] as Color),
              ),
              title: Text(item['camera'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${item['date']} - ${item['time']} • Durée: ${item['duration']}'),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: (item['color'] as Color).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  item['type'],
                  style: TextStyle(color: item['color'] as Color, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
