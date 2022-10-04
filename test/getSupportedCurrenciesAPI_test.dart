import 'dart:convert';
import 'package:Currency_Converter/API_requests/API_requests.dart';
import 'package:Currency_Converter/DataBaseProvider/HiveCurrencyDBProvider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  group('getSupportedCurrencies', () {
    test(
        'returns list of supported currencies when http response is successful',
        () async {
      // Mock the API call to return a json response with http status 200 Ok //
      final mockHTTPClient = MockClient((request) async {
        // Create sample response of the HTTP call //
        final response = {
          "success": true,
          "symbols": {
            "AED": "United Arab Emirates Dirham",
            "AFN": "Afghan Afghani"
          }
        };

        return Response(jsonEncode(response), 200);
      });
      // Check whether getSupportedCurrencies function returns a List of dynamic from the Hive box

      expect(await APIRequests().getSupportedCurrencies(mockHTTPClient),
          isA<Map<String, dynamic>>());
    });

    test('return error message when http response is unsuccessful', () async {
      // Mock the API call to return an
      // empty json response with http status 404
      final mockHTTPClient = MockClient((request) async {
        final response = {};
        return Response(jsonEncode(response), 404);
      });
      expect(await APIRequests().getSupportedCurrencies(mockHTTPClient), {});
    });
  });
}
