import 'package:flutter_dotenv/flutter_dotenv.dart';

class DatabaseConstants {
  DatabaseConstants._();

  static const String users = "users";
  static const String createdAt = "createdAt";

  static const String name = "name";
  static const String email = "email";
  static const String uId = "uId";
  static const String blood = "blood";
  static const String height = "height";
  static const String weight = "weight";
  static const String dateOfBirth = "dateOfBirth";
  static const String profileImage = "profileImage";

  static const String profile = "profile";
  static const String error = "error";
  static final String serverClientId = dotenv.get(
    'GOOGLE_SERVER_CLIENT_ID',
    fallback: '',
  );

  static const String imagesPath = "images";
  static const String profilePath = "profile";
  static const String medicinePath = "medicine";
  static const String prescriptionPath = "prescription";
  static const String raysPath = "rays";
  static const String analysisPath = "analysis";
  static const String notesPath = "notes";

  static final String geminiApiKey = dotenv.get("GEMINI_API_KEY");
}
