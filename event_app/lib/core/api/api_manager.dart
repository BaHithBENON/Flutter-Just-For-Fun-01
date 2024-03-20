import 'dart:convert';

import 'package:mockito/mockito.dart';

import 'api_response.dart';
import 'package:http/http.dart' as http;

class ApiManager {

  // ignore: unused_field
  static http.Client _httpClient = http.Client();

  // Method to set httpClient
  static void setHttpClient(http.Client client) {
      _httpClient = client;
  }

  static var headerContent = <String, String>{
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  /// Sends an HTTP request to the specified [requestUrl] with the given [method]
  /// and optional [header] and [data].
  ///
  /// The [header] parameter specifies whether to include the [headerContent] in the
  /// request headers. The [data] parameter is the request body, which is encoded as JSON
  /// if [header] is true.
  ///
  /// Returns a [Future] that completes with the response from the API.
  static Future<dynamic> apiRequest(
    var requestUrl, // The URL to send the request to.
    var method, // The HTTP method to use.
    {
      var header = false, // Whether to include the request headers.
      var data, // The request body.
    }) async {

    // Parse the request URL into a Uri object.
    var url = Uri.parse(requestUrl);

    // Encode the request body as JSON if the header is true.
    var body = header ? jsonEncode(data) : data;

    // Send the HTTP request and wait for the response.
    var res;
    switch (method) {
      case 'GET':
        res = await http.get(url, headers: header ? headerContent : null);
        break;
      case 'POST':
        res = await http.post(url, headers: header ? headerContent : null, body: body);
        break;
      case 'PUT':
        res = await http.put(url, headers: header ? headerContent : null, body: body);
        break;
      case 'PATCH':
        res = await http.patch(url, headers: header ? headerContent : null, body: body);
        break;
      case 'DELETE':
        res = await http.delete(url, headers: header ? headerContent : null);
        break;
      default:
    }

    // Convert the HTTP response to an ApiResponse object and return it.
    return ApiResponse.toResponse(res);
  }
}

class MockHttpClient extends Mock implements http.Client {
}
