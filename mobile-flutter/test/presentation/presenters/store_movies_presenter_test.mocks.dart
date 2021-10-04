// Mocks generated by Mockito 5.0.15 from annotations
// in movies_flix/test/presentation/presenters/store_movies_presenter_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:movies_flix/app/domain/entities/entities.dart' as _i4;
import 'package:movies_flix/app/domain/usecases/load_movies.dart' as _i5;
import 'package:flutter/foundation.dart' as _i3;
import 'package:flutter/src/widgets/framework.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeWidget_0 extends _i1.Fake implements _i2.Widget {
  @override
  String toString({_i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeInheritedWidget_1 extends _i1.Fake implements _i2.InheritedWidget {
  @override
  String toString({_i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeDiagnosticsNode_2 extends _i1.Fake implements _i3.DiagnosticsNode {
  @override
  String toString(
          {_i3.TextTreeConfiguration? parentConfiguration,
          _i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeMovieEntity_3 extends _i1.Fake implements _i4.MovieEntity {}

/// A class which mocks [BuildContext].
///
/// See the documentation for Mockito's code generation for more information.
class MockBuildContext extends _i1.Mock implements _i2.BuildContext {
  MockBuildContext() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Widget get widget => (super.noSuchMethod(Invocation.getter(#widget),
      returnValue: _FakeWidget_0()) as _i2.Widget);
  @override
  bool get debugDoingBuild => (super
          .noSuchMethod(Invocation.getter(#debugDoingBuild), returnValue: false)
      as bool);
  @override
  _i2.InheritedWidget dependOnInheritedElement(_i2.InheritedElement? ancestor,
          {Object? aspect}) =>
      (super.noSuchMethod(
          Invocation.method(
              #dependOnInheritedElement, [ancestor], {#aspect: aspect}),
          returnValue: _FakeInheritedWidget_1()) as _i2.InheritedWidget);
  @override
  void visitAncestorElements(bool Function(_i2.Element)? visitor) =>
      super.noSuchMethod(Invocation.method(#visitAncestorElements, [visitor]),
          returnValueForMissingStub: null);
  @override
  void visitChildElements(_i2.ElementVisitor? visitor) =>
      super.noSuchMethod(Invocation.method(#visitChildElements, [visitor]),
          returnValueForMissingStub: null);
  @override
  _i3.DiagnosticsNode describeElement(String? name,
          {_i3.DiagnosticsTreeStyle? style =
              _i3.DiagnosticsTreeStyle.errorProperty}) =>
      (super.noSuchMethod(
          Invocation.method(#describeElement, [name], {#style: style}),
          returnValue: _FakeDiagnosticsNode_2()) as _i3.DiagnosticsNode);
  @override
  _i3.DiagnosticsNode describeWidget(String? name,
          {_i3.DiagnosticsTreeStyle? style =
              _i3.DiagnosticsTreeStyle.errorProperty}) =>
      (super.noSuchMethod(
          Invocation.method(#describeWidget, [name], {#style: style}),
          returnValue: _FakeDiagnosticsNode_2()) as _i3.DiagnosticsNode);
  @override
  List<_i3.DiagnosticsNode> describeMissingAncestor(
          {Type? expectedAncestorType}) =>
      (super.noSuchMethod(
          Invocation.method(#describeMissingAncestor, [],
              {#expectedAncestorType: expectedAncestorType}),
          returnValue: <_i3.DiagnosticsNode>[]) as List<_i3.DiagnosticsNode>);
  @override
  _i3.DiagnosticsNode describeOwnershipChain(String? name) =>
      (super.noSuchMethod(Invocation.method(#describeOwnershipChain, [name]),
          returnValue: _FakeDiagnosticsNode_2()) as _i3.DiagnosticsNode);
  @override
  String toString() => super.toString();
}

/// A class which mocks [LoadMovies].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoadMovies extends _i1.Mock implements _i5.LoadMovies {
  MockLoadMovies() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i4.MovieEntity>> index(int? page, int? limit) =>
      (super.noSuchMethod(Invocation.method(#index, [page, limit]),
              returnValue:
                  Future<List<_i4.MovieEntity>>.value(<_i4.MovieEntity>[]))
          as _i6.Future<List<_i4.MovieEntity>>);
  @override
  _i6.Future<_i4.MovieEntity> show(int? id) =>
      (super.noSuchMethod(Invocation.method(#show, [id]),
              returnValue: Future<_i4.MovieEntity>.value(_FakeMovieEntity_3()))
          as _i6.Future<_i4.MovieEntity>);
  @override
  _i6.Future<void> store(_i4.MutationMovieEntity? entity) =>
      (super.noSuchMethod(Invocation.method(#store, [entity]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> update(int? id, _i4.MutationMovieEntity? entity) =>
      (super.noSuchMethod(Invocation.method(#update, [id, entity]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> destroy(int? id) =>
      (super.noSuchMethod(Invocation.method(#destroy, [id]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> rating(int? id, int? value) =>
      (super.noSuchMethod(Invocation.method(#rating, [id, value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> comment(int? id, String? value) =>
      (super.noSuchMethod(Invocation.method(#comment, [id, value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  String toString() => super.toString();
}
