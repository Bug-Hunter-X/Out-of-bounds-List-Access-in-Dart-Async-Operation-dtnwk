```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      // Check if data is not empty and has the necessary element
      if (data.isNotEmpty && data[0] is Map && data[0].containsKey('name')) {
        final String firstElement = data[0]['name'];
        print(firstElement);
      } else {
        print('Data is empty or missing the required key.');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```