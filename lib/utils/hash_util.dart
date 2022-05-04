import 'dart:convert';
import 'package:crypto/crypto.dart';

class HashUtil {
  static String hashSHA264(String value) {
    var bytes = utf8.encode(value);

    return sha256.convert(bytes).toString();
  }
}
