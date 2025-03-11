import 'package:flutter_dotenv/flutter_dotenv.dart';

String key = dotenv.env['API_KEY'] ?? '';

String mainUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=$key';
