import 'dart:async';

import 'package:kuraimas/app/modules/detail/models/characters_model.dart';
import 'package:kuraimas/app/modules/detail/models/detail_model.dart';
import 'package:kuraimas/app/modules/home/models/season_model.dart';
import 'package:get/get.dart';

class ApiProvider extends GetConnect {
  final url = 'https://api.jikan.moe/v3';

  @override
  void onInit() {
    allowAutoSignedCert = true;
  }

  dynamic fetch(String query) async => await get(
        url + query,
      ).timeout(
        Duration(seconds: 60),
        onTimeout: () =>
            throw TimeoutException('Can\'t connect in 10 seconds.'),
      );

  Future<SeasonModel> fetchSeason(int year, String season) async {
    final response = await fetch("/season/$year/$season");

    if (response.status.hasError) {
      print(response.statusText);
      return Future.error(response.statusText);
    } else {
      return SeasonModel.fromJson(response.body);
    }
  }

  Future<DetailModel> fetchDetail(String id) async {
    final response = await fetch("/kuraimas/$id");

    if (response.status.hasError) {
      print(response.statusText);

      return Future.error(response.statusText);
    } else {
      return DetailModel.fromJson(response.body);
    }
  }

  Future<CharactersModel> fetchCharacter(String id) async {
    final response = await fetch("/kuraimas/$id/characters_staff");

    if (response.status.hasError) {
      print(response.statusText);

      return Future.error(response.status);
    } else {
      return CharactersModel.fromJson(response.body);
    }
  }
}
