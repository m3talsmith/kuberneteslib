import 'dart:io';

void main() {
  final dir = Directory('lib/src');
  final regex = RegExp(r'(.*)\.dart');

  final exports = <String>[];
  final exclude = ['.g.dart', '_web.dart', '_io.dart'];
  dir.listSync(recursive: true).forEach((file) {
    if (regex.hasMatch(file.path)) {
      if (exclude.any((e) => file.path.contains(e))) return;
//       if (file.path.contains('_io.dart')) {
//         final ioPath = file.path.replaceAll('lib/', '');
//         final webPath = ioPath.replaceAll('_io.dart', '_web.dart');
//         exports.add('''
// export '${ioPath}'
//     if (dart.library.io) '${ioPath}'
//     if (dart.library.js_interop) '${webPath}';
// ''');
//         return;
//       }
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
