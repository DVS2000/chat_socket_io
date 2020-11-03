// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socket_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SocketStore on _SocketStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_SocketStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$connectedAtom = Atom(name: '_SocketStoreBase.connected');

  @override
  bool get connected {
    _$connectedAtom.reportRead();
    return super.connected;
  }

  @override
  set connected(bool value) {
    _$connectedAtom.reportWrite(value, super.connected, () {
      super.connected = value;
    });
  }

  final _$isSendingAtom = Atom(name: '_SocketStoreBase.isSending');

  @override
  bool get isSending {
    _$isSendingAtom.reportRead();
    return super.isSending;
  }

  @override
  set isSending(bool value) {
    _$isSendingAtom.reportWrite(value, super.isSending, () {
      super.isSending = value;
    });
  }

  final _$dataAtom = Atom(name: '_SocketStoreBase.data');

  @override
  ObservableList<String> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(ObservableList<String> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$connectAsyncAction = AsyncAction('_SocketStoreBase.connect');

  @override
  Future<void> connect() {
    return _$connectAsyncAction.run(() => super.connect());
  }

  final _$sendSmsAsyncAction = AsyncAction('_SocketStoreBase.sendSms');

  @override
  Future<void> sendSms({String sms}) {
    return _$sendSmsAsyncAction.run(() => super.sendSms(sms: sms));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
connected: ${connected},
isSending: ${isSending},
data: ${data}
    ''';
  }
}
