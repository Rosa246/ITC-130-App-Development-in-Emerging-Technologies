import 'dart:convert';
import 'dart:io';
import 'dart:async';

// Main Function
void main() {
  fetchLoveQuote().then((quote) {
    print('Love Quote:');
    print(quote);
  }).catchError((error) {
    print('Error fetching love quote: $error');
  });
}

// Fetching the Love Quote
Future<String> fetchLoveQuote() async {
  final String apiUrl = 'https://love-quote.p.rapidapi.com/lovequote';
  final Map<String, String> headers = {
    'X-RapidAPI-Key': '42438b9a1fmshc0e81298546d0ccp17bf87jsn8f44d7b3db2e',
    'X-RapidAPI-Host': 'love-quote.p.rapidapi.com',
  };

// Making the HTTP Request
  HttpClient httpClient = HttpClient();

  try {
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(apiUrl));
    headers.forEach((key, value) {
      request.headers.set(key, value);
    });
    HttpClientResponse response = await request.close();

// Handling the Response
    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }

    String responseBody = await response.transform(utf8.decoder).join();
    Map<String, dynamic> jsonData = json.decode(responseBody);

    httpClient.close();

    if (jsonData.containsKey('quote') && jsonData['quote'] != null) {
      String quote = jsonData['quote'];
      String author = jsonData['author'] ?? 'Unknown';
      return 'Quote: $quote\nAuthor: $author';
    } else {
      throw Exception('Unexpected response format: ${jsonData}');
    }

    // Error Handling
  } catch (error) {
    httpClient.close();
    throw Exception('Failed to fetch data: $error');
  }
}
