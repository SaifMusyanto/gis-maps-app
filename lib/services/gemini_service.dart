import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:gis_maps_app/database/constants.dart';
import 'package:mime/mime.dart';
import 'dart:io';
import 'dart:typed_data';

class GeminiService {
  Future<String> uploadFileToGemini(String filePath, String prompt, Schema schema) async {
    File file = File(filePath);
    final String mimeType = lookupMimeType(filePath) ?? 'application/octet-stream';
    final Uint8List bytes = await file.readAsBytes();
    final content = Content('user', [
      TextPart(prompt),
      DataPart(mimeType, bytes),
    ]);

    try {
      GenerateContentResponse response;

      final generateCv = GenerativeModel(
        model: Constants.geminiModelId,
        apiKey: Constants.geminiApiKey,
        generationConfig: GenerationConfig(
          responseMimeType: 'application/json',
          responseSchema: schema,
        ),
      );
      final content = [
        Content('user', [
          TextPart(prompt),
          DataPart(mimeType, bytes),
        ])
      ];

      response = await generateCv.generateContent(content);

      if (response.text != null) {
        print('Generated Response: ${response.text}');
        return response.text!;
      } else {
        throw Exception('No valid response from Gemini');
      }
    } catch (e) {
      print('Error: $e');
      return 'Error: ${e.toString()}';
    }
  }
}
