import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/domain/failure/network_failure.dart';

class NetworkRepository {
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

  Future<Either<NetworkFailure, dynamic>> post(String url, Map body) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.post(uri, body: body);
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

  Future<Either<NetworkFailure, dynamic>> delete(String url) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.delete(uri);
      final failure = _handleStatusCode(response.statusCode);
      if (failure != null) {
        return left(failure);
      }
      return right(jsonDecode(response.body));
    } catch (e) {
      return left(NetworkFailure(error: e.toString()));
    }
  }

  Future<Either<NetworkFailure, dynamic>> put(String url, Map body) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.put(uri, body: body);
      final failure = _handleStatusCode(response.statusCode);
      if (failure != null) {
        return left(failure);
      }
      return right(jsonDecode(response.body));
    } catch (e) {
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
