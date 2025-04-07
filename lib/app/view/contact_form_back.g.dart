// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_form_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContactFormBack on _ContactFormBack, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??=
          Computed<bool>(() => super.isValid, name: '_ContactFormBack.isValid'))
      .value;

  late final _$contactAtom =
      Atom(name: '_ContactFormBack.contact', context: context);

  @override
  Contact get contact {
    _$contactAtom.reportRead();
    return super.contact;
  }

  bool _contactIsInitialized = false;

  @override
  set contact(Contact value) {
    _$contactAtom
        .reportWrite(value, _contactIsInitialized ? super.contact : null, () {
      super.contact = value;
      _contactIsInitialized = true;
    });
  }

  @override
  String toString() {
    return '''
contact: ${contact},
isValid: ${isValid}
    ''';
  }
}
