import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIService {
  // ⚠️ TEMP: hardcode for now (replace with your NEW key)
  static const String _apiKey = "";
  static const String _baseUrl = "https://api.openai.com/v1";

  /// Example: Chat Completion
  Future<String> sendMessage(String prompt) async {
    final url = Uri.parse("$_baseUrl/chat/completions");

    try {
      final response = await http.post(
        url,
        headers: {
          "Authorization": "Bearer $_apiKey",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "model": "gpt-4o-mini",
          "messages": [
            {
              "role": "user",
              "content": prompt,
            }
          ],
          "temperature": 0.7,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["choices"][0]["message"]["content"];
      } else {
        throw Exception("API Error: ${response.body}");
      }
    } catch (e) {
      throw Exception("Failed to connect: $e");
    }
  }
}