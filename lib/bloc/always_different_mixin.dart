/// BLoC fix mixin
mixin AlwaysDifferent {
  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object obj) => false;
}
