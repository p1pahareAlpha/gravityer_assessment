import 'dart:developer';

import 'package:dio/dio.dart';

class PokeCardsService {
  final Dio _dio = Dio();

  // Fetch Pokémon cards
  Future<List<dynamic>> fetchPokemonCards({String searchText = ""}) async {
    final String baseUrl = searchText.isEmpty
        ? "https://api.pokemontcg.io/v2/cards?page=1&pageSize=10"
        : "https://api.pokemontcg.io/v2/cards?q=set.name:$searchText";

    try {
      final response = await _dio.get(
        baseUrl,
      );

      if (response.statusCode == 200) {
        // Parse and return the cards list
        return response.data['data'];
      } else {
        throw Exception(
            "Failed to fetch Pokémon cards. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      log("Error fetching Pokémon cards: $e");
      throw Exception("Error fetching Pokémon cards: $e");
    }
  }
}
