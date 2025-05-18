import 'package:intl/intl.dart';

class Constants {
  static const baseGeminiUrl = 'https://generativelanguage.googleapis.com';
  static const geminiApiKey = 'AIzaSyChKw_uFcg-uENY_BUx55tKk2wo8SWEDOc';
  static const geminiModelId = 'gemini-2.0-flash-lite';
  static const geminiGenerateContent = 'streamGenerateContent';
  static const baseGeminiApiUrl = '$baseGeminiUrl/v1beta/models/$geminiModelId:$geminiGenerateContent?key=$geminiApiKey';

  static DateFormat dateFormat = DateFormat('d MMMM yyyy', 'id');
}