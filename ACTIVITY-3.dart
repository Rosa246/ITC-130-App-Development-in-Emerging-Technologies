// Importing Libraries
import 'dart:io';

// Main Function
void main() {
  String inputFilePath = 'numbers.txt';

  String outputFilePath = 'result.txt';

  File inputFile = File(inputFilePath);

// Reading Lines from the Input File
  Future<List<String>> linesFuture = inputFile.readAsLines();

// Processing the Lines
  linesFuture.then((List<String> lines) {
    List<int> numbers = [];

// Parsing Each Line
    for (String line in lines) {
      try {
        int number = int.parse(line);
        numbers.add(number);
      } catch (e) {
        print('Error parsing line as integer: $e');
      }
    }

// Calculating the Sum
    int sum = numbers.reduce((value, element) => value + element);

    File outputFile = File(outputFilePath);

// Writing the Sum to the Output File
    outputFile.writeAsString('$sum').then((_) {
      print('Sum saved to $outputFilePath');
    }).catchError((e) {
      print('Error writing sum to file: $e');
    });
  }).catchError((e) {
    print('Error reading file: $e');
  });
}
