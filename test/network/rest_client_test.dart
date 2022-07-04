import 'package:dio/dio.dart';
import 'package:flutter_library/models/book.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_library/services/rest_client.dart';

void main() {
  RestClient? restClient;

  setUp(() {
    Dio dio = Dio();
    restClient = RestClient(dio);
  });

  void _testBook(Book? book) {
    expect(book, isNotNull);

    expect(book?.id, isNotNull);
    expect(book?.id, isNotNaN);
    expect(book?.id, isPositive);

    expect(book?.name, isNotNull);
  }

  test('test books given from restClient', () async {
    List<Book>? result;
    try {
      result = await restClient?.storages();

      result?.forEach((book) => _testBook(book));

      expect(result, isNotNull);
    } on DioError catch (error) {
      fail(error.message);
    }
  });
}