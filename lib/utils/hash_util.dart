import 'dart:convert';
import 'package:crypto/crypto.dart';

class HashUtil {
  static String hashSHA264(String data, String nonce) {
    var bytes = utf8.encode(data + nonce);

    return sha256.convert(bytes).toString();
  }
}
