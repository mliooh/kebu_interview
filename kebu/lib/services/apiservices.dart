import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Base URL for API endpoints

const baseUrl = 'https://gateway-test.kebu.io';
const login_endpoint = "/api/account/v2/auth/token";
const refreshtoken_endpont = "/api/account/v2/token/refresh";
const error_endpoint = "/api/v1/profile/public/error/codes";

// Global variables for access and refresh tokens
String? accessToken;
String? refreshToken;

// Function to obtain authentication token


class ApiService{
  final _storage = const FlutterSecureStorage();

  // get error codes
  Future<List<Map<String, String>>?> fetchErrorCodes() async {
    final url = Uri.parse('$baseUrl$error_endpoint');
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200){
        final data = jsonDecode(response.body);
        return List<Map<String, String>>.from(data['errorCodes']);
      }
    }
    catch (e){
      print("error fetching error codes");
    }
    return null;
  }

// get auth codes and login

Future<Map<String, dynamic>?> authenticate(String username, String password) async {
  final url = Uri.parse('$baseUrl$login_endpoint');
  final body = jsonEncode({
    'username': username,
    'password': password,
    'deviceId': null,
    'category': 'CLIENT',
  });

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      // Handle API errors
      print('Error: ${response.statusCode} - ${response.body}');
      return null;
    }
  } catch (e) {
    // Handle other errors, like no internet connection
    print('Error: $e');
    return null;
  }
}

// Save tokens securely
  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await _storage.write(key: 'access_token', value: accessToken);
    await _storage.write(key: 'refresh_token', value: refreshToken);
  }

  // Refresh token
  Future<Map<String, dynamic>?> refreshAccessToken() async {
    final url = Uri.parse('$baseUrl/api/account/v2/token/refresh');
    final refreshToken = await _storage.read(key: 'refresh_token');
    if (refreshToken == null) return null;

    final body = jsonEncode({
      'refreshToken': refreshToken,
      'category': 'CLIENT',
    });
    try {
      final response = await http.post(url, body: body, headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print('Error refreshing access token: $e');
    }
    return null;
  }

  // Get stored access token
  Future<String?> getAccessToken() async {
    return await _storage.read(key: 'access_token');
  }

  //Logout
  Future<void> logout() async {
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');
  }

}