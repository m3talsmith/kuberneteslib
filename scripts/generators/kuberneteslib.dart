import 'dart:io';

void main() {
  final dir = Directory('lib/src');
  final regex = RegExp(r'(.*)\.dart');

  final exports = <String>[];
  final exclude = ['.g.dart', '_web.dart', '_io.dart'];
  dir.listSync(recursive: true).forEach((file) {
    if (regex.hasMatch(file.path)) {
      if (exclude.any((e) => file.path.contains(e))) return;
      if (file.path.contains('_stub.dart')) {
        final path = file.path.replaceAll('lib/', '');
        final ioPath = path.replaceAll('_stub.dart', '_io.dart');
        final webPath = path.replaceAll('_stub.dart', '_web.dart');
        exports.add('''export '$path'
  if (dart.library.io) '$ioPath'
  if (dart.library.html) '$webPath';
''');
        return;
      }
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
