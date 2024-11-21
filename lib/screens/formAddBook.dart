import 'package:flutter/material.dart';
import '../models/bookModels.dart';

class FormAddBookPage extends StatefulWidget {
  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<FormAddBookPage> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  Types _selectedType = Types.novel; 
  int _pages = 0;
  int _pageNow = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Buku Baru'),
        backgroundColor: const Color.fromARGB(255, 88, 169, 235),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'Judul Buku',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan judul buku',
                ),
                onSaved: (value) {
                  if (value != null) _title = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Judul buku tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text(
                'Tipe Buku',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              DropdownButtonFormField<Types>(
                value: _selectedType,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  if (value != null) setState(() => _selectedType = value);
                },
                items: Types.values.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type.name),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),

              Text(
                'Halaman Sekarang',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan halaman sekarang',
                ),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  if (value != null) _pageNow = int.parse(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Halaman sekarang tidak boleh kosong';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Harap masukkan angka';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              Text(
                'Jumlah Halaman',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan jumlah halaman',
                ),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  if (value != null) _pages = int.parse(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jumlah halaman tidak boleh kosong';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Harap masukkan angka';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),

              //Save
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // Debugging log
                    print('Buku Ditambahkan: $_title');
                    print('Tipe: $_selectedType');
                    print('Halaman: $_pageNow dari $_pages');

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Buku berhasil ditambahkan!')),
                    );
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, 
                  foregroundColor: Colors.white, 
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: Text('Simpan Buku'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
