
    // Sends a GET request to a valid URL and receives a successful response.
import 'package:event_app/core/api/api_manager.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';


class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('ApiManager', () {
    test('should send a GET request to a valid URL and receive a successful response', () async {
      // Arrange
      const url = 'https://example.com';
      final response = http.Response('{"message": "Success"}', 200);
      final httpClient = MockHttpClient();
      when(httpClient.get(Uri.parse(url), headers: anyNamed('headers')))
          .thenAnswer((_) async => response);
      ApiManager.setHttpClient(httpClient);

      // Act
      final result = await ApiManager.apiRequest(url, 'GET');

      // Assert
      expect(result.statusCode, 200);
      expect(result.data, {"message": "Success"});
    });
  });
}
