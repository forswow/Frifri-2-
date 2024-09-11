import 'dart:collection';
import 'dart:convert';

import 'package:crypto/crypto.dart';

base mixin class Signature {
  SplayTreeMap<String, dynamic> _convertToSplayTreeMap(
      Map<String, dynamic> map) {
    final SplayTreeMap<String, dynamic> splayTreeMap = SplayTreeMap();

    map.forEach((key, value) {
      if (value is Map) {
        splayTreeMap[key] =
            _convertToSplayTreeMap(value as Map<String, dynamic>);
      } else if (value is List) {
        splayTreeMap[key] = value.map(
          (e) => _convertToSplayTreeMap(e),
        );
      } else {
        splayTreeMap[key] = value;
      }
    });

    return splayTreeMap;
  }

  String _flattenParameters(SplayTreeMap<String, dynamic> params) {
    final List<String> values = [];

    params.forEach((key, value) {
      if (value is Iterable) {
        value.toList().forEach((element) {
          values.add(_flattenParameters(element));
        });
      } else if (value is SplayTreeMap<String, dynamic>) {
        values.add(_flattenParameters(value));
      } else {
        values.add(value.toString());
      }
    });

    return values.join(':');
  }

  String createSignature(Map<String, dynamic> params, String token) {
    // Step 1: Rearrange parameters alphabetically
    // SplayTreeMap make it automatically sorted
    final SplayTreeMap<String, dynamic> splayTreeMap =
        _convertToSplayTreeMap(params);

    // Step 2: Flatten all parameters into a single string
    // separated by columns
    String result = _flattenParameters(splayTreeMap);

    // Step 3: Add token in the beginning
    result = '$token:$result';

    // Step 4: Hash it with MD5
    final bytes = utf8.encode(result);
    final md5Signature = md5.convert(bytes).toString();
    return md5Signature;
  }
}
