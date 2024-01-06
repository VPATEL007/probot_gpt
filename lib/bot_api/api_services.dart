// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:probot/config.dart';

class ApiServices {
  static var client = http.Client();

  static Future<String> chatCompeletionResponse(String prompt) async {
    var url = Uri.https("api.openai.com", "/v1/chat/completions");
    log("prompt : $prompt");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${appCtrl.firebaseConfigModel!.chatGPTKey}',

      },
      body: json.encode({
        "model": "gpt-3.5-turbo",
        'temperature': 0,
        'max_tokens': 2000,
        'top_p': 1,
        'frequency_penalty': 0.0,
        'presence_penalty': 0.0,
        "messages": [
          {"role": "user", "content": prompt}
        ]
      }),
    );
    // print(LocalStorage.getChatGptApiKey());
    print("hello chat");
    print(
        "Chat respons   =======${jsonDecode(utf8.decode(response.bodyBytes))}");
    // Do something with the response
    Map<String, dynamic> newresponse =
        jsonDecode(utf8.decode(response.bodyBytes));

    return newresponse['choices'][0]['message']['content'];
  }
}
