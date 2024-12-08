import 'package:flutter/material.dart';
import '../models/bookModels.dart';
import '../service/firestore.dart'; // Import FirestoreService

class FormAddBookPage extends StatefulWidget {
  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<FormAddBookPage> {
  final _formKey = GlobalKey<FormState>();
  final FirestoreService _firestoreService = FirestoreService(); // Instance of FirestoreService

  // Form field variables
  String? _title;
  Types? _selectedType;
  int? _pages;
  String? _note;

  // Helper method to get the display name for enum values
  String _enumToString(Types type) {
    switch (type) {
      case Types.novel:
        return 'Novel';
      case Types.education:
        return 'Education';
      case Types.references:
        return 'References';
      case Types.other:
        return 'Other';
    }
  }

  // Add book and save to Firestore
  void _addBook() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Call the FirestoreService to save the book
      try {
        await _firestoreService.createBook(
          _title!,
          _selectedType!,
          _pages!,
          _note ?? '',
          DateTime.now(),
        );

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Book Added: $_title'),
          ),
        );

        // Reset the form
        _formKey.currentState!.reset();
        setState(() {
          _selectedType = null;
        });
      } catch (e) {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to add book: $e'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Book',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 29, 48, 80),
          ),
        ),
        backgroundColor: const Color(0xFFF0F4FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Judul Buku',
                  hintText: 'Masukkan judul buku di sini',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Judul buku tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) => _title = value,
              ),
              const SizedBox(height: 16.0),

              // Book Type Dropdown
              DropdownButtonFormField<Types>(
                decoration: const InputDecoration(
                  labelText: 'Tipe Buku',
                  border: OutlineInputBorder(),
                ),
                value: _selectedType,
                items: Types.values.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(_enumToString(type)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedType = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Pilih tipe buku';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Number of Pages Field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Halaman Buku',
                  hintText: 'Masukkan jumlah halaman buku di sini',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jumlah halaman tidak boleh kosong';
                  }
                  if (int.tryParse(value) == null || int.parse(value) <= 0) {
                    return 'Masukkan angka yang valid';
                  }
                  return null;
                },
                onSaved: (value) => _pages = int.parse(value!),
              ),
              const SizedBox(height: 16.0),

              // Notes Field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Notes',
                  hintText: 'Masukkan notes mengenai buku ini',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onSaved: (value) => _note = value,
              ),
              const SizedBox(height: 32.0),

              // Add Book Button
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _addBook,
                    icon: const Icon(Icons.add),
                    label: const Text('Add Book'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.lightBlue[100],
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
