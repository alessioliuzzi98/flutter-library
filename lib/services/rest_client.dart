import 'package:dio/dio.dart';
import 'package:flutter_library/models/book.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

/// The Rest Client API service to gather forecast information
@RestApi(baseUrl: '${RestClient.baseUrl}/')
abstract class RestClient {
  /// The API baseUrl
  static const String baseUrl = 'https://flutter-library-32ace-default-rtdb.europe-west1.firebasedatabase.app';

  /// Helper factory to generate the RestClient constructor
  factory RestClient(Dio dio) => _RestClient(dio);

  @GET('/storages.json')
  /// The method to gather storages from the API servers
  Future<List<Book>?> storages();

  @GET('/my_books.json')
  /// The method to gather my books from the API servers
  Future<List<Book>?> myBooks();

  @GET('/wishlist.json')
  /// The method to gather wishlist from the API servers
  Future<List<Book>?> wishlist();
}