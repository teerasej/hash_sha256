import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hash_sha256/pages/hash/hash_page.dart';
import 'package:hash_sha256/pages/nonce/nonce_page.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nextflow: Hash SHA256',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Hash SHA256'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final tab = TabBar(tabs: <Tab>[
    Tab(icon: Icon(Icons.arrow_forward)),
    Tab(icon: Icon(Icons.arrow_downward)),
    Tab(icon: Icon(Icons.arrow_back)),
  ]);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nextflow Blockchain training - tools'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Hash'),
              Tab(text: 'Nounce'),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  HashPage(),
                  NoncePage(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Nextflow.in.th - click for more: ',
                    ),
                    TextSpan(
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => {
                              launchUrl(
                                Uri.https(
                                  'nextflow.in.th',
                                  '/blockchain-for-developer-training-workshop',
                                ),
                              )
                            },
                      text: 'Blockchain Application Development Training',
                    ),
                    const TextSpan(
                      text: ' | ',
                    ),
                    TextSpan(
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => {
                              launchUrl(
                                Uri.https(
                                  'nextflow.in.th',
                                  'course/google-flutter-for-web-dev',
                                ),
                              )
                            },
                      text: 'Flutter Training',
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
