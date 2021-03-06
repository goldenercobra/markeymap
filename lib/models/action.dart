import 'package:flutter/foundation.dart';

enum ActionType {
  grant,
  letter,
  endorsement,
  legislation,
  action,
  youtube,
  other,
}

extension StringExtension on ActionType {
  String get name => describeEnum(this);
}

extension ActionTypeExtension on String {
  ActionType get action => ActionType.values.firstWhere(
        (ActionType element) => element.name.toLowerCase() == toLowerCase(),
        orElse: () => null,
      );
}

@immutable
class EdAction with Diagnosticable {
  const EdAction({
    this.date,
    @required this.type,
    @required this.description,
    this.funding,
    this.url,
  })  : assert(type != null),
        assert(description != null);

  EdAction.fromRow(List<String> row)
      : date = row[1].isNotEmpty ? row[1] : null,
        type = row[2].action ?? ActionType.other,
        description = row[3],
        funding = row[4].isNotEmpty ? double.tryParse(row[4]) : null,
        url = row[5].isNotEmpty ? row[5] : null;

  EdAction.fromMap(Map<String, Object> data)
      : date = data['date'] as String,
        type = (data['type'] as String).action ?? ActionType.other,
        description = data['description'] as String,
        funding = double.tryParse(data['funding'].toString()),
        url = data['url'] as String;

  final String date;
  final ActionType type;
  final String description;
  final double funding;
  final String url;

  Map<String, dynamic> toMap() => <String, Object>{
        'date': date,
        'type': type.name,
        'description': description,
        'funding': funding,
        'url': url,
      };

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(StringProperty('date', date))
      ..add(EnumProperty<ActionType>('type', type))
      ..add(StringProperty('description', description))
      ..add(DoubleProperty('funding', funding))
      ..add(StringProperty('url', url));
    super.debugFillProperties(properties);
  }
}

extension TotalSecuredExtension on List<EdAction> {
  double get totalSecured =>
      fold<double>(0, (double p, EdAction e) => p + (e.funding ?? 0));
}
