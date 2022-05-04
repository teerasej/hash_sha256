import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HashPage extends StatefulWidget {
  HashPage({Key? key}) : super(key: key);

  @override
  State<HashPage> createState() => _HashPageState();
}

class _HashPageState extends State<HashPage> {
  String hashed = '...';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Center(
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
          ),
          BottomAppBar(
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
          ),
        ],
      ),
    );
  }
}
