// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContactModel on _ContactModelBase, Store {
  final _$nameAtom = Atom(name: '_ContactModelBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$cellphoneAtom = Atom(name: '_ContactModelBase.cellphone');

  @override
  String get cellphone {
    _$cellphoneAtom.reportRead();
    return super.cellphone;
  }

  @override
  set cellphone(String value) {
    _$cellphoneAtom.reportWrite(value, super.cellphone, () {
      super.cellphone = value;
    });
  }

  final _$phoneAtom = Atom(name: '_ContactModelBase.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$_ContactModelBaseActionController =
      ActionController(name: '_ContactModelBase');

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_ContactModelBaseActionController.startAction(
        name: '_ContactModelBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_ContactModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCellPhone(String value) {
    final _$actionInfo = _$_ContactModelBaseActionController.startAction(
        name: '_ContactModelBase.setCellPhone');
    try {
      return super.setCellPhone(value);
    } finally {
      _$_ContactModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPhone(String value) {
    final _$actionInfo = _$_ContactModelBaseActionController.startAction(
        name: '_ContactModelBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_ContactModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
cellphone: ${cellphone},
phone: ${phone}
    ''';
  }
}
