import 'dart:convert';

import 'package:architecture_basics/domain/failures/network_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class NetworkRepository {
  // Take Url as parameter
  // return Map<String,dynamic> as json
  // And do exception handling

  Future<Either<NetworkFailure, dynamic>> get(String url) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.get(uri);
      final failure = _handleStatusCode(response.statusCode);
      if (failure != null) {
        return left(failure);
      }
      return right(jsonDecode(response.body));
    } catch (e) {
      // return left() for failure
      return left(NetworkFailure(error: e.toString()));
    }
  }

  NetworkFailure? _handleStatusCode(int code) {
    if (code == 401) {
      return NetworkFailure(error: "UnAuthorized");
    }
    return null;
  }
}
