// Mocks generated by Mockito 5.2.0 from annotations
// in flutter_library/test/bloc/main_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:connectivity/connectivity.dart' as _i3;
import 'package:connectivity_platform_interface/connectivity_platform_interface.dart'
    as _i5;
import 'package:flutter_library/models/book.dart' as _i8;
import 'package:flutter_library/repositories/main_repository.dart' as _i7;
import 'package:flutter_library/services/rest_client.dart' as _i2;
import 'package:logger/src/logger.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeRestClient_0 extends _i1.Fake implements _i2.RestClient {}

/// A class which mocks [Connectivity].
///
/// See the documentation for Mockito's code generation for more information.
class MockConnectivity extends _i1.Mock implements _i3.Connectivity {
  MockConnectivity() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Stream<_i5.ConnectivityResult> get onConnectivityChanged =>
      (super.noSuchMethod(Invocation.getter(#onConnectivityChanged),
              returnValue: Stream<_i5.ConnectivityResult>.empty())
          as _i4.Stream<_i5.ConnectivityResult>);
  @override
  _i4.Future<_i5.ConnectivityResult> checkConnectivity() => (super.noSuchMethod(
          Invocation.method(#checkConnectivity, []),
          returnValue:
              Future<_i5.ConnectivityResult>.value(_i5.ConnectivityResult.wifi))
      as _i4.Future<_i5.ConnectivityResult>);
}

/// A class which mocks [Logger].
///
/// See the documentation for Mockito's code generation for more information.
class MockLogger extends _i1.Mock implements _i6.Logger {
  MockLogger() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void v(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      super.noSuchMethod(Invocation.method(#v, [message, error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      super.noSuchMethod(Invocation.method(#d, [message, error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      super.noSuchMethod(Invocation.method(#i, [message, error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      super.noSuchMethod(Invocation.method(#w, [message, error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      super.noSuchMethod(Invocation.method(#e, [message, error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      super.noSuchMethod(Invocation.method(#wtf, [message, error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  void log(_i6.Level? level, dynamic message,
          [dynamic error, StackTrace? stackTrace]) =>
      super.noSuchMethod(
          Invocation.method(#log, [level, message, error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}

/// A class which mocks [MainRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMainRepository extends _i1.Mock implements _i7.MainRepository {
  MockMainRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RestClient get restClient =>
      (super.noSuchMethod(Invocation.getter(#restClient),
          returnValue: _FakeRestClient_0()) as _i2.RestClient);
  @override
  _i4.Future<List<_i8.Book>?> storages() =>
      (super.noSuchMethod(Invocation.method(#storages, []),
              returnValue: Future<List<_i8.Book>?>.value())
          as _i4.Future<List<_i8.Book>?>);
  @override
  _i4.Future<List<_i8.Book>?> myBooks() =>
      (super.noSuchMethod(Invocation.method(#myBooks, []),
              returnValue: Future<List<_i8.Book>?>.value())
          as _i4.Future<List<_i8.Book>?>);
  @override
  _i4.Future<List<_i8.Book>?> wishlist() =>
      (super.noSuchMethod(Invocation.method(#wishlist, []),
              returnValue: Future<List<_i8.Book>?>.value())
          as _i4.Future<List<_i8.Book>?>);
}
