import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrl = dotenv.get('API_URL', fallback: 'http://localhost/');
String clientCredentials = dotenv.get('GRANT_TYPE', fallback: 'BlueBees');
String masterClient = dotenv.get('CLIENT_ID', fallback: 'BlueBees');
String clientSecret = dotenv.get('CLIENT_SECRET', fallback: 'BlueBees');
