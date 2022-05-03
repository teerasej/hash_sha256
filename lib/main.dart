import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
  String hashed = '...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Data:',
              ),
              TextField(
                onChanged: (value) {
                  var bytes = utf8.encode(value);

                  setState(() {
                    hashed = sha256.convert(bytes).toString();
                  });
                },
              ),
              Text(
                hashed,
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
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
                TextSpan(
                  text: ' | ',
                ),
                TextSpan(
                  style: TextStyle(
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
      ),
    );
  }
}
