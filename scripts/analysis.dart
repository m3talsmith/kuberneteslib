import 'dart:io';

analysis() async {
  print('Running dart format');
  ProcessResult process = await Process.run('dart', ['format', '.']);
  if (process.stdout.isNotEmpty) {
    print('[stdout] ${process.stdout}');
    if (process.stdout.contains('0 changed')) {
      print('dart format passed');
    } else {
      final formattedFiles = process.stdout.split('\n');
      if (formattedFiles.isNotEmpty) {
        await Process.run('git', ['add', ...formattedFiles]);
        await Process.run('git', ['commit', '--amend', '-a', '--no-verify']);
      }
    }
  }
  if (process.stderr.isNotEmpty) {
    if (process.stderr.contains('Warning:')) {
      print('dart format warnings, moving on');
    } else {
      print('[stderr] ${process.stderr}');
      if (process.exitCode != 0) {
        print('dart format failed');
        exit(1);
      }
    }
  }

  print('Running dart analyze');
  process = await Process.run('dart', ['analyze', '.']);
  if (process.stdout.isNotEmpty) {
    print('[stdout] ${process.stdout}');
    final exp = RegExp(r'(\d+) issues found');
    final issues = exp.allMatches(process.stdout);
    if (issues.isNotEmpty && issues.first.group(1) != '0') {
      print('dart analyze failed. Try running `dart fix --apply`');
      exit(1);
    } else {
      print('dart analyze passed');
    }
  }
  if (process.stderr.isNotEmpty) {
    if (process.stderr.contains('Warning:')) {
      print('dart analyze warnings, moving on');
    } else {
      print('[stderr] ${process.stderr}');
      if (process.exitCode != 0) {
        print('dart analyze failed');
        exit(1);
      }
    }
  }

  print('Running dart test');
  process = await Process.run('dart', ['test', '.']);
  if (process.stdout.isNotEmpty) {
    print('[stdout] ${process.stdout}');
  }
  if (process.stderr.isNotEmpty) {
    if (process.stderr.contains('Warning:')) {
      print('dart test warnings, moving on');
    } else {
      print('[stderr] ${process.stderr}');
      if (process.exitCode != 0) {
        print('dart test failed');
        exit(1);
      }
    }
  }
}
