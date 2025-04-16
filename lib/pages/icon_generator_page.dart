import 'package:flutter/material.dart';
import '../widgets/portfolio_icon.dart';

class IconGeneratorPage extends StatelessWidget {
  const IconGeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title:
            const Text('Portfolio Icon', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black54,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Portfolio Icon Preview',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(24),
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            PortfolioIcon(size: 32),
                            SizedBox(height: 16),
                            Text(
                              '32x32 (favicon)',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(width: 40),
                        Column(
                          children: [
                            PortfolioIcon(size: 192),
                            SizedBox(height: 16),
                            Text(
                              '192x192',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    PortfolioIcon(size: 400),
                    SizedBox(height: 16),
                    Text(
                      '400x400 for icon creation',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Manual Icon Creation Instructions:',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '1. Take screenshots of the icons above',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '2. Create the following files:',
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        '• web/favicon.png (32x32)\n• web/icons/Icon-192.png (192x192)\n• web/icons/Icon-512.png (512x512)\n• web/icons/Icon-maskable-192.png (copy of 192px)\n• web/icons/Icon-maskable-512.png (copy of 512px)',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '3. Rebuild your app with: flutter build web',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Alternatively, use an online tool like favicon.io to generate icons from the screenshot.',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
