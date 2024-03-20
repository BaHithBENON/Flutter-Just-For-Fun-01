// Sends a request to an invalid URL and receives an error response.
import 'package:event_app/core/api/api_manager.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('ApiManager', () {
    test('should send a request to an invalid URL and receive an error response', () async {
      // Arrange
      const url = 'https://invalid-url';
      final response = http.Response('{"message": "Error"}', 404);
      final httpClient = MockHttpClient();
      when(httpClient.get(Uri.parse(url), headers: anyNamed('headers')))
          .thenAnswer((_) async => response);
      ApiManager.setHttpClient(httpClient);

      // Act
      final result = await ApiManager.apiRequest(url, 'GET');

      // Assert
      expect(result.statusCode, 404);
      expect(result.data, {"message": "Error"});
    });
  });
}
