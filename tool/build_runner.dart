import 'dart:io';

void main() {
  print('🚀 Running build_runner...');
  Process.runSync('flutter', [
    'pub',
    'run',
    'build_runner',
    'build',
    '--delete-conflicting-outputs',
  ], runInShell: true);
  print('✅ Done!');
}
