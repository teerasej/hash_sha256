import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:hash_sha256/utils/block_hash_model.dart';

class HashUtil {
  static String hashSHA264(String data, String nonce) {
    var bytes = utf8.encode(data + nonce);

    return sha256.convert(bytes).toString();
  }

  static Future<BlockHashModel> hashWithZeroCountCondition(
      String data, int zeroCount,
      {int nonce = 0}) async {
    var count = zeroCount;
    var validating = '';
    var completedZeroCount = false;
    while (!completedZeroCount) {
      validating = HashUtil.hashSHA264(data, '$nonce');

      var setOfZeroes = validating.substring(0, count).split('');
      var zeroCount = 0;

      for (var char in setOfZeroes) {
        if (!char.contains('0')) {
          break;
        } else {
          zeroCount += 1;
        }
      }

      if (zeroCount == setOfZeroes.length) {
        completedZeroCount = true;
      } else {
        nonce += 1;
      }
    }

    return BlockHashModel(
      validating,
      nonce: nonce,
    );
  }
}
