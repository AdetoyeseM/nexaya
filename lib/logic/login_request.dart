
 // ignore_for_file: use_build_context_synchronously
 
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:nexaya/models/login_model.dart';
import 'package:nexaya/screens/homepage.dart';

// ViewModel class for handling login logic
class LoginViewModel extends ChangeNotifier {
  // A notifier to indicate loading state
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  // Method to handle login
  Future<LoginModel> login(
    BuildContext? context,
  ) async {
    LoginModel? loginModel;
    try {
      // Start loading state
      isLoading.value = true;
      notifyListeners();

      // URL for login API endpoint
      var url =
          "https://api.mockfly.dev/mocks/9858e7e1-968c-432a-a420-d814bb18ac40/user";

      // Sending POST request to login
      ApiResponse response =
          await post(url: url, body: {}, context: context);

      // Checking response status
      if (response.statusCode != 200) {
        // If status code is not 200, stop loading and notify listeners
        isLoading.value = false;
        notifyListeners();
      } else {
        // If status code is 200, parse response into LoginModel
        loginModel = LoginModel.fromJson(response.data);
        // Navigate to homepage with login data
        await Navigator.pushReplacement(context!,
            MaterialPageRoute(builder: (context) {
          return Homepage(
            data: loginModel!,
          );
        }));
      }
    } catch (e) {
      // Catching any errors during login process
      isLoading.value = false;
      notifyListeners();
    } finally {
      // Ensure loading state is stopped even if an error occurs
      isLoading.value = false;
      notifyListeners();
    }
    // Return the login model
    return loginModel!;
  }
}

// Generic class to represent API response
class ApiResponse<T> {
  final T? data; // Data received from API
  final String? message; // Message received from API
  final int statusCode; // HTTP status code

  // Constructor
  ApiResponse({this.data, this.message, required this.statusCode});
}

// Function to make a POST request
Future<ApiResponse> post({
  BuildContext? context,
  required String? url,
  String? token,
  Map<String, dynamic>? body,
  String? message,
}) async {
  // Unfocus current focus (keyboard) if any
  if (context != null) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
  
  // Parse URL
  var uri = Uri.parse(url!);
  var response;
  var responseData;

  try {
    // Send POST request with specified body and headers
    response = await http.post(uri, body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    }).timeout(const Duration(seconds: 15)); // Timeout after 15 seconds

    // Decode response body from JSON
    responseData = jsonDecode(response.body);
  } catch (err) {
    // Handle different types of errors
    switch (err) {
      case SocketException:
        responseData = "Socket Exception";
        // Pop context if applicable
        if (context != null) {
          if (context.mounted) Navigator.pop(context);
        }
        break;
      case TimeoutException:
        responseData = "Timeout Exception";
        // Pop context if applicable
        if (context != null) {
          if (context.mounted) Navigator.pop(context);
        }
        break;
      case FormatException:
        responseData = "Format Exception";
        // Pop context if applicable
        if (context != null) {
          if (context.mounted) Navigator.pop(context);
        }
        break;
      default:
        responseData = err;
    }
  }

  // Return API response
  return ApiResponse<Map<String, dynamic>>(
    data: responseData,
    statusCode: response != null ? response.statusCode : 504, // Default status code
  );
}
