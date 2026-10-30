import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        'title': 'Alerte Intrusion',
        'message': 'Mouvement suspect détecté - Camera 1',
        'time': '10:32',
        'icon': Icons.warning_amber_rounded,
        'color': Colors.red,
      },
      {
        'title': 'Détection de mouvement',
        'message': 'Mouvement détecté - Camera 2',
        'time': '10:15',
        'icon': Icons.directions_run,
        'color': Colors.orange,
      },
      {
        'title': 'Enregistrement',
        'message': 'Enregistrement démarré - Camera 1',
        'time': '09:50',
        'icon': Icons.fiber_manual_record,
        'color': Colors.blue,
      },
      {
        'title': 'Capture photo',
        'message': 'Photo capturée - Camera 2',
        'time': '09:30',
        'icon': Icons.camera_alt,
        'color': Colors.green,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: notif['color'].withOpacity(0.2),
                child: Icon(notif['icon'], color: notif['color']),
              ),
              title: Text(
                notif['title'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(notif['message']),
              trailing: Text(
                notif['time'],
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}
