import 'dart:collection';
import 'dart:convert';

import 'package:crypto/crypto.dart';

base mixin class Signature {
  // Convert a Map to a SplayTreeMap
  SplayTreeMap<String, dynamic> _convertToSplayTreeMap(
      Map<String, dynamic> map) {
    final SplayTreeMap<String, dynamic> splayTreeMap = SplayTreeMap();

    map.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        splayTreeMap[key] = _convertToSplayTreeMap(value);
      } else if (value is List) {
        splayTreeMap[key] = value
            .map((e) =>
                e is Map<String, dynamic> ? _convertToSplayTreeMap(e) : e)
            .toList();
      } else {
        splayTreeMap[key] = value;
      }
    });

    return splayTreeMap;
  }

  // Flatten parameters into a single string
  String _flattenParameters(SplayTreeMap<String, dynamic> params) {
    final StringBuffer buffer = StringBuffer();

    params.forEach((key, value) {
      if (value is Iterable) {
        for (final element in value) {
          buffer.write(_flattenParameters(element is Map<String, dynamic>
              ? _convertToSplayTreeMap(element)
              : element));
        }
      } else if (value is SplayTreeMap<String, dynamic>) {
        buffer.write(_flattenParameters(value));
      } else {
        buffer.write(value.toString());
      }
      buffer.write(':'); // Add separator after each value
    });

    // Remove the last separator if buffer is not empty
    if (buffer.isNotEmpty) {
      buffer.write(buffer
          .toString()
          .substring(0, buffer.length - 1)); // Remove the last colon
    }

    return buffer.toString();
  }

  // Create the signature
  String createSignature(Map<String, dynamic> params, String token) {
    // Step 1: Convert and sort parameters
    final SplayTreeMap<String, dynamic> splayTreeMap =
        _convertToSplayTreeMap(params);

    // Step 2: Flatten parameters
    String result = _flattenParameters(splayTreeMap);

    // Step 3: Add token at the beginning
    result = '$token:$result';

    // Step 4: Hash it with MD5
    final bytes = utf8.encode(result);
    final md5Signature = md5.convert(bytes).toString();
    return md5Signature;
  }
}
