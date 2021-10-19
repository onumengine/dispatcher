import 'dart:io';

String readLocation(String fileName) =>
    File('test/dummy_data/$fileName').readAsStringSync();
