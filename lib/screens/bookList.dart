import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fp_tekber/models/bookModels.dart';
import 'package:fp_tekber/service/firestore.dart';
import 'package:fp_tekber/screens/bookDetails.dart';
// import '../data/bookData.dart';

class BookListPage extends StatelessWidget {
  final bool? isCompleted; // Null jika dipanggil dari Home
  final void Function(int)? onTabSelected; // Callback untuk mengatur tab aktif

  BookListPage({this.isCompleted, this.onTabSelected});
  final FirestoreService _firestoreService = FirestoreService();
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: StreamBuilder<List<Book>>(
        stream: _firestoreService.getBooks(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Tidak ada buku.'));
          }
                  // Konversi dari QuerySnapshot ke List<Book>
        final books = snapshot.data!;
              // Filter buku berdasarkan status
    final filteredBooks = isCompleted == null
        ? books // Untuk Home, tampilkan semua buku
        : books.where((book) => book.isCompleted == isCompleted).toList();

    
    if (isCompleted == null) {
      
      final readingBooks = books
          .where((book) => book.isCompleted == false)
          .take(3)
          .toList();
      final completedBooks = books
          .where((book) => book.isCompleted == true)
          .take(3)
          .toList();
    
  return CustomScrollView(
    slivers: [
      // Bagian "Currently Reading"
     
      SliverToBoxAdapter(
        child: GridView.builder(
          padding: const EdgeInsets.all(14.0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.5 / 1,
          ),
          itemCount: readingBooks.length + 1, 
          itemBuilder: (context, index) {
            if (index < readingBooks.length) {
              final book = readingBooks[index];
              final progress = book.pageNow / book.pages;

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetailPage(
                        book: book, // Buku yang akan ditampilkan
                        bookList: books, // Kirim daftar buku
                      ),
                    ),
                  );
                },
                child: Card(
                  color: const Color.fromARGB(255, 242, 249, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.black, width: 0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            book.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          book.types.toString().split('.').last,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 8.0),
                        LinearProgressIndicator(
                          value: progress,
                          minHeight: 4.0,
                          color: const Color.fromARGB(255, 58, 88, 78),
                          backgroundColor: const Color.fromARGB(255, 186, 186, 186),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              // Grid untuk tombol aksi dengan Card yang transparan
              return Card(
                color: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Tombol "Add Book" dengan ikon "+"
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/addBook');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 159, 210, 254), // Warna latar belakang
                        minimumSize: const Size(double.infinity, 50),
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        textStyle: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.add, color: Colors.black), // Ikon "+"
                          SizedBox(width: 8.0), // Jarak antara ikon dan teks
                          Text(
                            'Add Book',
                            style: TextStyle(color: Colors.black), // Warna teks menjadi hitam
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Tombol "Show More" dengan ikon panah ke kanan
                    ElevatedButton(
                      onPressed: () {
                         if (onTabSelected != null) onTabSelected!(1);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Warna latar belakang putih
                        side: const BorderSide(color: Colors.black, width: 0.5), // Border hitam
                        minimumSize: const Size(double.infinity, 50),
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        textStyle: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.arrow_forward, color: Color.fromARGB(255, 82, 141, 120)), // Ikon panah ke kanan
                          SizedBox(width: 8.0), // Jarak antara teks dan ikon
                          Text(
                            'Show More',
                            style: TextStyle(color: Color.fromARGB(255, 82, 141, 120)), // Warna teks menjadi hitam
                          ),                                 
                        ],
                      ),
                    ),
                  ],
                ),

              );
            }
          },
        ),
      ),
      // Bagian "Completed Books"
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Completed Books',
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (index < completedBooks.length) {
              final book = completedBooks[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 242, 249, 255),
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    title: Text(
                      book.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(book.types.toString().split('.').last),
                    onTap: () {
                      Navigator.pushNamed(context, '/booksDetail', arguments: book);
                    },
                  ),
                ),
              );
            }
          },
          childCount: completedBooks.length,
        ),
      ),
      // Tombol "Show More"
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                if (onTabSelected != null) onTabSelected!(2);
              },
              style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Warna latar belakang putih
                        side: const BorderSide(color: Colors.black, width: 0.5), // Border hitam
                        minimumSize: const Size(double.infinity, 50),
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        textStyle: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.arrow_forward, color: Color.fromARGB(255, 82, 141, 120)), // Ikon panah ke kanan
                          SizedBox(width: 8.0), // Jarak antara teks dan ikon
                          Text(
                            'Show More',
                            style: TextStyle(color: Color.fromARGB(255, 82, 141, 120)), // Warna teks menjadi hitam
                          ),                                 
                        ],
                      ),
            ),
          ),
        ),
      ),
    ],
  );
    };

      

    // Tampilan untuk "Currently Reading" atau "Completed"
    return Scaffold(
  appBar: AppBar(
    title: Text(isCompleted == true ? 'Completed Books' : 'Currently Reading'),
  ),
  body: ListView.builder(
    itemCount: (isCompleted == false ? filteredBooks.length + 1 : filteredBooks.length), 
    itemBuilder: (context, index) {
      if (isCompleted == false && index == 0) {
        // Tombol "Add Book" hanya muncul jika isCompleted == false
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/addBook'); // Navigasi ke halaman tambah buku
            },
            icon: const Icon(Icons.add),
            label: const Text('Add Book'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 159, 210, 254),
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              textStyle: const TextStyle(fontSize: 16.0),
            ),
          ),
        );
      }

      // List item untuk buku
      final book = filteredBooks[isCompleted == false ? index - 1 : index]; // Kurangi index hanya jika isCompleted == false
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 242, 249, 255),
            border: Border.all(
              color: Colors.black,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            title: Text(
              book.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book.types.toString().split('.').last),
                const SizedBox(height: 8.0),
                if (!book.isCompleted)
                  LinearProgressIndicator(
                    value: book.pageNow / book.pages,
                    minHeight: 4.0,
                    color: const Color.fromARGB(255, 58, 88, 78),
                    backgroundColor: const Color.fromARGB(255, 186, 186, 186),
                  ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailPage(
                    book: book, // Buku yang akan ditampilkan
                    bookList: books, // Kirim daftar buku
                  ),
                ),
              );
            },
          ),
        ),
      );
    },
  ),

);
        },
      ),

      );
  }
}
