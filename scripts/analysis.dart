import 'dart:io';

analysis() async {
  print('Running dart format');
  ProcessResult process = await Process.run('dart', ['format', '.']);
  if (process.stdout.isNotEmpty) {
    print(process.stdout);
  }
  if (process.stderr.isNotEmpty) {
    if (process.stderr.contains('Warning:')) {
      print('dart format warnings, moving on');
    } else {
      print(process.stderr);
      if (process.exitCode != 0) {
        print('dart format failed');
        exit(1);
      }
    }
  }

  print('Running dart analyze');
  process = await Process.run('dart', ['analyze', '.']);
  if (process.stdout.isNotEmpty) {
    print(process.stdout);
  }
  if (process.stderr.isNotEmpty) {
    if (process.stderr.contains('Warning:')) {
      print('dart analyze warnings, moving on');
    } else {
      print(process.stderr);
      if (process.exitCode != 0) {
        print('dart analyze failed');
        exit(1);
      }
    }
  }

  print('Running dart test');
  process = await Process.run('dart', ['test', '.']);
  if (process.stdout.isNotEmpty) {
    print(process.stdout);
  }
  if (process.stderr.isNotEmpty) {
    if (process.stderr.contains('Warning:')) {
      print('dart test warnings, moving on');
    } else {
      print(process.stderr);
      if (process.exitCode != 0) {
        print('dart test failed');
        exit(1);
      }
    }
  }
}
