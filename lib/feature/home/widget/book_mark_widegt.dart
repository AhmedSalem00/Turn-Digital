import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookMarkWidegt extends StatefulWidget {
  const BookMarkWidegt({super.key, required bool
  showSnackbar});

  @override
  _BookMarkWidegtState createState() => _BookMarkWidegtState();
}

class _BookMarkWidegtState extends State<BookMarkWidegt> {
  List<Map<String, dynamic>> bookmarkedEvents = [];

  @override
  void initState() {
    super.initState();
    _loadBookmarkedEvents();
  }

  Future<void> _loadBookmarkedEvents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedEvents = prefs.getStringList('bookmarked_events');

    if (savedEvents != null) {
      setState(() {
        bookmarkedEvents = savedEvents.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
      });
    }
  }

  Future<void> _removeBookmarkedEvent(Map<String, dynamic> event) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedEvents = prefs.getStringList('bookmarked_events') ?? [];

    savedEvents.remove(jsonEncode(event));
    await prefs.setStringList('bookmarked_events', savedEvents);

    setState(() {
      bookmarkedEvents.remove(event);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Bookmark removed successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bookmarks")),
      body: bookmarkedEvents.isEmpty
          ? Center(child: Text("No bookmarks found"))
          : ListView.builder(
        itemCount: bookmarkedEvents.length,
        itemBuilder: (context, index) {
          final event = bookmarkedEvents[index];
          return ListTile(
            title: Text(event['title']),
            subtitle: Text(event['date'] ?? ''),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => _removeBookmarkedEvent(event),
            ),
          );
        },
      ),
    );
  }
}
