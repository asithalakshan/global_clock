import 'dart:io';

// import 'package:http/http.dart';
import 'dart:convert';

// Future<dynamic> getApi(String url) async {
//   try {
//     final uri = Uri.parse(url);
//     final response = await get(uri);

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception(
//           'Failed to load data. Error code: ${response.statusCode}');
//     }
//   } catch (e) {
//     throw Exception('Failed to load data: $e');
//   }
// }

Future<dynamic> getApi(String url) async {
  try {
    HttpClient httpClient = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

    HttpClientRequest request =
        await httpClient.getUrl(Uri.parse(url)); // Replace with your API URL
    HttpClientResponse response = await request.close();

    if (response.statusCode == 200) {
      String jsonResponse = await response.transform(utf8.decoder).join();
      return jsonDecode(jsonResponse);
    } else {
      throw Exception(
          'Failed to load data. Error code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to load data: $e');
  }
}
