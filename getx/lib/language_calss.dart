import 'package:get/get_navigation/src/root/internacionalization.dart';

class LanguageClass extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'message': "what is your name",
          'name': "India"
        },
    'hi_IN': {
      'message': "आपका क्या नाम है",
      'name': "भारत"
    }
      };
}
