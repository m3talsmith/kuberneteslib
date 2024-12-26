import 'dart:io';

import 'package:kuberneteslib/src/resource/resource_kind.dart';
import 'package:humanizer/humanizer.dart';

void main() {
  final generatedFiles = <String>[];
  final statusCases = <String>[];
  final imports = <String>[];
  final kinds = ResourceKind.values.map((e) => e.name).toList();
  for (final kind in kinds) {
    if (kind == 'unknown') continue;
    final humizedKind = SymbolName(kind).toHumanizedName();
    final parts = humizedKind.split(' ');
    final kindSnakeCased = parts.join('_');
    final kindPascalCased = parts.map((e) => e.toTitleCase()).join('');
    final kindCamelCased = parts
        .asMap()
        .entries
        .map((e) => e.key == 0 ? e.value : e.value.toTitleCase())
        .join('');
    final pathName = 'lib/src/status';
    final filename = '$pathName/$kindSnakeCased.dart';
    final content = '''
import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part '$kindSnakeCased.g.dart';

@JsonSerializable()
class ${kindPascalCased}Status implements Status {
  const ${kindPascalCased}Status();

  @override
  factory ${kindPascalCased}Status.fromJson(Map<String, dynamic> json) =>
      _\$${kindPascalCased}StatusFromJson(json);

  @override
  Map<String, dynamic> toJson() => _\$${kindPascalCased}StatusToJson(this);
}
''';
    final dir = Directory('$pathName/$kindSnakeCased');
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
    final gitkeep = File('$pathName/$kindSnakeCased/.gitkeep');
    if (!gitkeep.existsSync()) {
      gitkeep.writeAsStringSync('');
    }
    final file = File(filename);
    if (!file.existsSync()) {
      file.writeAsStringSync(content);
      generatedFiles.add(filename);
    }

    statusCases.add('''
      case ResourceKind.$kindCamelCased:
        return ${kindPascalCased}Status.fromJson(json);
  ''');
    imports.add('import \'$kindSnakeCased.dart\';');
  }

  final statusPart = '''
import '../resource/resource_kind.dart';

${imports.join('\n')}

class Status {
  const Status();

  factory Status.fromJson(Map<String, dynamic> json) {
    switch (ResourceKind.fromString(json['kind'])) {
      ${statusCases.join('\n')}
      default:
        throw UnimplementedError('Unknown status kind: \${json['kind']}');
    }
  }

  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
''';

  final statusFile = File('lib/src/status/status.dart');
  statusFile.writeAsStringSync(statusPart);

  print('Generated files: $generatedFiles');
}
