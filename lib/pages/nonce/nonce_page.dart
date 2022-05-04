import 'package:flutter/material.dart';

class NoncePage extends StatefulWidget {
  NoncePage({Key? key}) : super(key: key);

  @override
  State<NoncePage> createState() => _NoncePageState();
}

class _NoncePageState extends State<NoncePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 600,
          child: Card(
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'A Block',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Nounce:'),
                    TextFormField(),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Data:'),
                    TextFormField(
                      maxLines: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Hash:'),
                    Text('...'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
