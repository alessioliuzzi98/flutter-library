import 'package:flutter/cupertino.dart';
import 'package:flutter_library/services/rest_client.dart';
import 'package:flutter_library/models/book.dart';

class MainRepository {
  // RestClient to get data from Api
  final RestClient restClient;

  // MainRepository named constructor
  MainRepository({required this.restClient});

  Future<List<Book>?> storages() async {
    List<Book>? response;

    try {
      response = await restClient.storages();
    } on Error catch (error) {
      throw Exception("Network error");
    }

    return response;
  }

  Future<List<Book>?> myBooks() async {
    List<Book>? response;

    try {
      response = await restClient.myBooks();
    } on Error catch (error) {
      throw Exception("Network error");
    }

    return response;
  }

  Future<List<Book>?> wishlist() async {
    List<Book>? response;

    try {
      response = await restClient.wishlist();
    } on Error catch (error) {
      throw Exception("Network error");
    }

    return response;
  }
}
