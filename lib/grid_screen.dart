import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({super.key});

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  final List<Map<String, String>> cameras = [
    {'name': 'Camera 1', 'url': 'http://102.26.24.155:8080/video'},
    {'name': 'Camera 2', 'url': 'http://102.26.24.155:8080/video'},
    {'name': 'Camera 3', 'url': 'http://102.26.24.155:8080/video'},
    {'name': 'Camera 4', 'url': 'http://102.26.24.155:8080/video'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toutes les Cameras'),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: cameras.length,
        itemBuilder: (context, index) {
          return _CameraGridItem(
            name: cameras[index]['name']!,
            url: cameras[index]['url']!,
          );
        },
      ),
    );
  }
}

class _CameraGridItem extends StatefulWidget {
  final String name;
  final String url;

  const _CameraGridItem({required this.name, required this.url});

  @override
  State<_CameraGridItem> createState() => _CameraGridItemState();
}

class _CameraGridItemState extends State<_CameraGridItem> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1565C0), width: 2),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          WebViewWidget(controller: _controller),
          Positioned(
            top: 6,
            left: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(Icons.circle, color: Colors.white, size: 8),
                  SizedBox(width: 3),
                  Text('LIVE', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 6,
            left: 6,
            child: Text(
              widget.name,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, shadows: [Shadow(color: Colors.black, blurRadius: 4)]),
            ),
          ),
        ],
      ),
    );
  }
}
