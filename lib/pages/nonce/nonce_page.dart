import 'package:flutter/material.dart';
import 'package:hash_sha256/utils/hash_util.dart';

class NoncePage extends StatefulWidget {
  NoncePage({Key? key}) : super(key: key);

  @override
  State<NoncePage> createState() => _NoncePageState();
}

class _NoncePageState extends State<NoncePage> {
  final _formKey = GlobalKey<FormState>();

  String _data = '';
  int _nonce = 0;
  String _hashed = '...';

  void doHash() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        _hashed = HashUtil.hashSHA264(_data + _nonce.toString());
      });
    }
  }

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
                key: _formKey,
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
                    Text('Data:'),
                    TextFormField(
                      maxLines: 10,
                      onChanged: (value) => doHash(),
                      onSaved: (newValue) => _data = newValue ?? '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please fill the form';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Nounce:'),
                    TextFormField(
                      onChanged: (value) => doHash(),
                      onSaved: (newValue) =>
                          _nonce = int.parse(newValue ?? '0'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please fill the form';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Hash:'),
                    Text(_hashed),
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
