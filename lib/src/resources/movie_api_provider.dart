import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = 'c1d0956dd3284f563ac65a60ac9633ce';

  Future<ItemModel> fetchMovieList() async {
    print("entered");
    final response = await client.get(
      "https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey"
    );
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
