import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex/models/pokemon_generation_response.dart';
import 'package:pokedex/repositories/pokemon_repository_interface.dart';

class PokemonRepository extends IPokemonRepository {
  final Dio _dio;

  PokemonRepository(this._dio);

  @override
  Future<PokemonGenerationResponse> getAllPokemonsByGeneration(
      int generation) async {
    try {
      var response = await _dio.get('/generation/$generation');

      return PokemonGenerationResponse.fromJson(response.toString());
    } on DioError catch (ex) {
      // Assumming there will be an errorMessage property in the JSON object
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw new Exception(errorMessage);
    }
  }
}
