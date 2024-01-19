import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

String uuidToShortId(String uuidString) {
  List<int> bytes = Uuid.parse(uuidString);

  var shortId = base64Encode(bytes)
      .substring(0, 22)
      .replaceAll("/", "_")
      .replaceAll("+", "-");
  debugPrint('Parsed Uuid: ${Uuid.unparse(bytes).toString()}');
  debugPrint('uuidToShortId: $shortId');
  return shortId;
}

String shortIdToUuid(String shortId) {
  // Replace '-' with '+' and '_' with '/' before decoding
  shortId = shortId.replaceAll("-", "+").replaceAll("_", "/");

  // Add padding if needed
  while (shortId.length % 4 != 0) {
    shortId += '=';
  }

  // Decode base64
  List<int> bytes = base64Decode(shortId);

  // Debug print the decoded bytes
  debugPrint('Decoded Bytes: $bytes');

  // Convert bytes to UUID string
  String uuidString = Uuid.unparse(bytes);

  // Debug print the original UUID string
  debugPrint('Original UUID: $uuidString');

  return uuidString;
}
