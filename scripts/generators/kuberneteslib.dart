import 'dart:io';

void main() {
  final dir = Directory('lib/src');
  final regex = RegExp(r'(.*)\.dart');

  final exports = <String>[];
  final exclude = ['.g.', '_web', '_io', '_stub'];
  dir.listSync(recursive: true).forEach((file) {
    if (regex.hasMatch(file.path)) {
      if (exclude.any((e) => file.path.contains(e))) return;
      exports.add("export '${file.path.replaceAll('lib/', '')}';");
    }
  });

  final readme = File('README.md');
  final readmeContent = readme.readAsStringSync();
  var content = '''
library kuberneteslib;

${readmeContent.split('\n').map((line) => '/// $line').join('\n')}

${exports.join('\n')}
''';

  final file = File('lib/kuberneteslib.dart');
  file.writeAsStringSync(content);
}
