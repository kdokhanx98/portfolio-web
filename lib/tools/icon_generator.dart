import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/portfolio_icon.dart';

/// This widget can be run on desktop/mobile Flutter apps to generate the icon PNGs.
/// It won't work on web, so use this on a desktop or mobile device.
class IconGeneratorTool extends StatefulWidget {
  const IconGeneratorTool({super.key});

  @override
  State<IconGeneratorTool> createState() => _IconGeneratorToolState();
}

class _IconGeneratorToolState extends State<IconGeneratorTool> {
  final GlobalKey _icon32Key = GlobalKey();
  final GlobalKey _icon192Key = GlobalKey();
  final GlobalKey _icon512Key = GlobalKey();
  bool _generatingIcons = false;
  String _status = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Icon Generator Tool')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RepaintBoundary(
              key: _icon32Key,
              child: const PortfolioIcon(size: 32),
            ),
            const SizedBox(height: 16),
            RepaintBoundary(
              key: _icon192Key,
              child: const PortfolioIcon(size: 192),
            ),
            const SizedBox(height: 16),
            RepaintBoundary(
              key: _icon512Key,
              child: const PortfolioIcon(size: 512),
            ),
            const SizedBox(height: 32),
            if (_generatingIcons)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: _generateIcons,
                child: const Text('Generate All Icons'),
              ),
            const SizedBox(height: 16),
            Text(_status),
            const SizedBox(height: 32),
            const Text(
              'Note: This tool only works on desktop/mobile apps.\n'
              'Run this on desktop to generate icons, then manually copy them to the web folder.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _generateIcons() async {
    setState(() {
      _generatingIcons = true;
      _status = 'Generating icons...';
    });

    try {
      // Create the icons directory if it doesn't exist
      final iconsDir = Directory('icons');
      if (!await iconsDir.exists()) {
        await iconsDir.create();
      }

      // Generate favicon
      await _captureAndSavePng(_icon32Key, 'icons/favicon.png');

      // Generate Icon-192
      await _captureAndSavePng(_icon192Key, 'icons/Icon-192.png');

      // Generate Icon-512
      await _captureAndSavePng(_icon512Key, 'icons/Icon-512.png');

      // Copy files for maskable icons
      final icon192File = File('icons/Icon-192.png');
      final icon512File = File('icons/Icon-512.png');

      await icon192File.copy('icons/Icon-maskable-192.png');
      await icon512File.copy('icons/Icon-maskable-512.png');

      setState(() {
        _status = 'Icons generated successfully in the "icons" folder.\n'
            'Please copy them to the appropriate web directory locations.';
      });
    } catch (e) {
      setState(() {
        _status = 'Error generating icons: $e';
      });
    } finally {
      setState(() {
        _generatingIcons = false;
      });
    }
  }

  Future<void> _captureAndSavePng(GlobalKey key, String filename) async {
    final boundary =
        key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 1.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();

    final file = File(filename);
    await file.writeAsBytes(pngBytes);
  }
}
