import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../const/messages.dart';
import '../error/exceptions.dart';

class HttpService extends http.BaseClient {
  final http.Client client;
  final List<String> unauthorizedRoutes;
  bool checkedOptionalUpdate = false;

  HttpService({
    required this.client,
    required this.unauthorizedRoutes,
  });

  String inMemoryToken = '';

  Future<void> userAccessToken() async {
    // UserModel user = await localDataSource.getCachedUser();
    // _inMemoryToken = user.loginToken;
  }

  @override
  Future<http.Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return super.post(
      url,
      body: body != null ? json.encode(body) : null,
      headers: headers,
      encoding: encoding,
    );
  }

  @override
  Future<http.Response> put(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return super.put(url,
        body: body != null ? json.encode(body) : null,
        headers: headers,
        encoding: encoding);
  }

  @override
  Future<http.Response> delete(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return super.delete(url,
        body: body != null ? json.encode(body) : null,
        headers: headers,
        encoding: encoding);
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    request.headers.update('Accept', (_) => 'application/json',
        ifAbsent: () => 'application/json');
    request.headers.update('Content-Type', (_) => 'application/json',
        ifAbsent: () => 'application/json');
    log(request.toString(), name: 'request');
    late http.StreamedResponse response;
    bool unAuth = false;
    for (String uR in unauthorizedRoutes) {
      if (request.url.path.contains(uR)) {
        response = await sendUnauthenticated(request);
        unAuth = true;
      }
    }
    if (!unAuth) {
      response = await sendAuthenticated(request);
    }
    log(response.statusCode.toString(), name: 'STATUS_CODE');
    if (response.statusCode == 502) {
      log('----------------------------- server is updating now');
      // NavigatorStateExtension(navigationKey.currentState!)
      //     .clearStackAndNavigate(ServerDownPage.routeName);
    } else if (response.statusCode == 401) {
      log('----------------------------- unAuthenticated');
      try {
        // await localDataSource.removeCachedUser();
      } catch (e) {
        log(e.toString());
      } finally {
        // NavigatorStateExtension(navigationKey.currentState!)
        //     .clearStackAndNavigate(SignInPage.routeName);
      }
      //TODO: edit msg
      throw ServerException(message: genericErrorMessage);
    }
    return response;
  }

  Future<http.StreamedResponse> sendAuthenticated(
      http.BaseRequest request) async {
    await userAccessToken();
    request.headers.update('Authorization', (_) => inMemoryToken,
        ifAbsent: () => inMemoryToken);
    var response = await client.send(request);
    return response;
  }

  Future<http.StreamedResponse> sendUnauthenticated(
      http.BaseRequest request) async {
    var response = await client.send(request);
    return response;
  }
}
