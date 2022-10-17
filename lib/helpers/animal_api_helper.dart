import 'dart:convert';

import 'package:fire_base_second/models/animal.dart';
import 'package:http/http.dart' as http;

class AnimalHelper {
  AnimalHelper._();

  static final AnimalHelper animalHelper = AnimalHelper._();

  Future<Animal?> fetchAnimalData({required String animalName}) async {
    Map<String, String> apiKey = {
      "X-Api-Key": "yagBhMB92gTUUUw9kb3Fvw==maoHhxPMMr1bW7nk"
    };

    http.Response response = await http.get(
        Uri.parse(
          "https://api.api-ninjas.com/v1/animals?name=$animalName",
        ),
        headers: apiKey);
    if (response.statusCode == 200) {
      List<dynamic> decodedData = jsonDecode(response.body);

      Animal myAnimal = Animal.fromMap(data: decodedData[0]);

      return myAnimal;
    }
    return null;
  }
}
