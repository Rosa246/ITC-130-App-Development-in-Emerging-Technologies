import 'dart:io';

// Main Function
void main() {
  stdout.write('Enter the file name: ');
  String? fileName = stdin.readLineSync();

// Checking the File Name
  if (fileName != null) {
// Reading the File Contents
    readFileContents(fileName)
        .then((contents) => print('File contents:\n$contents'))
        .catchError((error) {
      print('Error: $error');
    });

// Handling Missing File Name
  } else {
    print('No file name provided.');
  }
}

// Reading File Contents Function
Future<String> readFileContents(String fileName) async {
  try {
    File file = File(fileName);
    if (!file.existsSync()) {
      throw FileSystemException('File not found');
    }

    return await file.readAsString();
  } catch (error) {
    throw Exception('Failed to read file: $error');
  }
}
