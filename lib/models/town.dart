import 'package:flutter/foundation.dart';

@immutable
class Town with Diagnosticable implements Comparable<Town> {
  const Town({
    @required this.name,
    @required this.zipcode,
  })  : assert(name != null),
        assert(zipcode != null);

  Town.fromMap(Map<String, Object> data)
      : name = data['name'] as String,
        zipcode = data['zipcode'] as String;

  final String name;
  final String zipcode;

  Map<String, dynamic> toMap() => <String, Object>{
        'name': name,
        'zipcode': zipcode,
      };

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(StringProperty('name', name))
      ..add(StringProperty('zipcode', zipcode));
    super.debugFillProperties(properties);
  }

  @override
  int compareTo(Town other) => name.compareTo(other.name);
}
