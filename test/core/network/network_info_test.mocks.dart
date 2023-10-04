// Mocks generated by Mockito 5.4.2 from annotations
// in coin_tracker_app/test/core/network/network_info_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i2;
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
// ignore_for_file: subtype_of_sealed_class

class _FakeDuration_0 extends _i1.SmartFake implements Duration {
  _FakeDuration_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAddressCheckResult_1 extends _i1.SmartFake
    implements _i2.AddressCheckResult {
  _FakeAddressCheckResult_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [InternetConnectionChecker].
///
/// See the documentation for Mockito's code generation for more information.
class MockInternetConnectionChecker extends _i1.Mock
    implements _i2.InternetConnectionChecker {
  @override
  Duration get checkInterval => (super.noSuchMethod(
        Invocation.getter(#checkInterval),
        returnValue: _FakeDuration_0(
          this,
          Invocation.getter(#checkInterval),
        ),
        returnValueForMissingStub: _FakeDuration_0(
          this,
          Invocation.getter(#checkInterval),
        ),
      ) as Duration);

  @override
  Duration get checkTimeout => (super.noSuchMethod(
        Invocation.getter(#checkTimeout),
        returnValue: _FakeDuration_0(
          this,
          Invocation.getter(#checkTimeout),
        ),
        returnValueForMissingStub: _FakeDuration_0(
          this,
          Invocation.getter(#checkTimeout),
        ),
      ) as Duration);

  @override
  List<_i2.AddressCheckOptions> get addresses => (super.noSuchMethod(
        Invocation.getter(#addresses),
        returnValue: <_i2.AddressCheckOptions>[],
        returnValueForMissingStub: <_i2.AddressCheckOptions>[],
      ) as List<_i2.AddressCheckOptions>);

  @override
  set addresses(List<_i2.AddressCheckOptions>? value) => super.noSuchMethod(
        Invocation.setter(
          #addresses,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.Future<bool> get hasConnection => (super.noSuchMethod(
        Invocation.getter(#hasConnection),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<_i2.InternetConnectionStatus> get connectionStatus =>
      (super.noSuchMethod(
        Invocation.getter(#connectionStatus),
        returnValue: _i3.Future<_i2.InternetConnectionStatus>.value(
            _i2.InternetConnectionStatus.connected),
        returnValueForMissingStub:
            _i3.Future<_i2.InternetConnectionStatus>.value(
                _i2.InternetConnectionStatus.connected),
      ) as _i3.Future<_i2.InternetConnectionStatus>);

  @override
  _i3.Stream<_i2.InternetConnectionStatus> get onStatusChange =>
      (super.noSuchMethod(
        Invocation.getter(#onStatusChange),
        returnValue: _i3.Stream<_i2.InternetConnectionStatus>.empty(),
        returnValueForMissingStub:
            _i3.Stream<_i2.InternetConnectionStatus>.empty(),
      ) as _i3.Stream<_i2.InternetConnectionStatus>);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get isActivelyChecking => (super.noSuchMethod(
        Invocation.getter(#isActivelyChecking),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i3.Future<_i2.AddressCheckResult> isHostReachable(
          _i2.AddressCheckOptions? options) =>
      (super.noSuchMethod(
        Invocation.method(
          #isHostReachable,
          [options],
        ),
        returnValue:
            _i3.Future<_i2.AddressCheckResult>.value(_FakeAddressCheckResult_1(
          this,
          Invocation.method(
            #isHostReachable,
            [options],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.AddressCheckResult>.value(_FakeAddressCheckResult_1(
          this,
          Invocation.method(
            #isHostReachable,
            [options],
          ),
        )),
      ) as _i3.Future<_i2.AddressCheckResult>);
}
