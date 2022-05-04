import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool _mining = false;

  void doHash() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        _hashed = HashUtil.hashSHA264(_data, _nonce.toString());
      });
    }
  }

  void mindHash() async {
    var result = await HashUtil.hashWithZeroCountCondition(
      _data,
      3,
      nonce: _nonce,
    );

    setState(() {
      _mining = false;
      _hashed = result.hashed;
      _nonce = result.nonce;
    });
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
                    const Text(
                      'A Block',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Data:'),
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Nounce:'),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: TextEditingController(text: '$_nonce'),
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
                    // const Text(
                    //     'Zero number in hash\'prefix to make hash valid:'),
                    // TextFormField(
                    //   keyboardType: TextInputType.number,
                    //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    //   controller: TextEditingController(text: '$_nonce'),
                    //   onChanged: (value) => doHash(),
                    //   onSaved: (newValue) =>
                    //       _nonce = int.parse(newValue ?? '0'),
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please fill the form';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Text('Hash:'),
                    Text(_hashed),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 75,
                      child: ElevatedButton(
                        onPressed: !_mining
                            ? () {
                                setState(() {
                                  _mining = true;
                                  mindHash();
                                });
                              }
                            : null,
                        child: Row(
                          children: [
                            const Text('Mine'),
                            _mining
                                ? const CircularProgressIndicator()
                                : Container()
                          ],
                        ),
                      ),
                    )
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
