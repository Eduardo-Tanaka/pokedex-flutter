import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:pokedex/models/pokemon/pokemon_response.dart';
import 'package:pokedex/models/pokemon_generation_response.dart';
import 'package:pokedex/repositories/pokemon_repository_interface.dart';

class PokemonRepository extends IPokemonRepository {
  final Dio _dio;

  PokemonRepository(this._dio);

  @override
  Future<PokemonGenerationResponse> getAllPokemonsByGeneration(
      int generation) async {
    try {
      var response = await _dio.get(
        '/generation/$generation',
        options: buildCacheOptions(
          Duration(days: 7),
        ),
      );
      return PokemonGenerationResponse.fromJson(response.toString());
    } on DioError catch (ex) {
      // Assumming there will be an errorMessage property in the JSON object
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw new Exception(errorMessage);
    }
  }

  @override
  Future<PokemonResponse> getPokemonById(int id) async {
    try {
      var response = await _dio.get(
        '/pokemon/$id',
        options: buildCacheOptions(
          Duration(days: 7),
        ),
      );
      return PokemonResponse.fromJson(response.toString());
    } on DioError catch (ex) {
      // Assumming there will be an errorMessage property in the JSON object
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw new Exception(errorMessage);
    }
  }
}
