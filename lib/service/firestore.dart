import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/bookModels.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference books =
      FirebaseFirestore.instance.collection('book');
  final CollectionReference accounts =
      FirebaseFirestore.instance.collection('account');
  Map<String, dynamic>? userData;
  String? userPass;

  // CREATE
  Future<void> createBook(
    String title,
    Types types,
    int pages,
    String note,
    DateTime dateAdded,
  ) async {
    await books.add({
      'title': title,
      'types': types.toString().split('.').last,
      'pages': pages,
      'pageNow': 0,
      'isCompleted': false,
      'note': note,
      'dateAdded': FieldValue.serverTimestamp(),
      'dateFinished': DateTime(9999, 12, 31),
    });
  }

  // READ
  Stream<List<Book>> getBooks() {
    return books // Nama koleksi di Firestore
        .snapshots() // Stream<QuerySnapshot>
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        final data =
            doc.data() as Map<String, dynamic>; // Ambil data dari dokumen

        return Book(
          id: doc.reference.id,
          title: data['title'],
          types: Types.values
              .firstWhere((e) => e.toString() == 'Types.${data['types']}'),
          pages: data['pages'],
          pageNow: data['pageNow'] ?? 0,
          isCompleted: data['isCompleted'] ?? false,
          note: data['note'],
          dateAdded: (data['dateAdded'] as Timestamp).toDate(),
          dateFinished: (data['dateFinished'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }

  // UPDATE
  Future<void> updateProgress(
    String id,
    int pageNow,
    int pages,
  ) async {
    await books.doc(id).update({
      'pageNow': pageNow,
      'isCompleted': (pageNow < pages) ? false : true,
      'dateFinished': (pageNow < pages)
          ? DateTime(9999, 12, 31)
          : FieldValue.serverTimestamp(),
    });
  }

  // DELETE
  Future<void> deleteBook(String id) async {
    await books.doc(id).delete();
  }

  // ADD ACCOUNT
  Future<void> addAccount(String email, String password) async {
    await accounts.add({
      'email': email,
      'password': password,
    });
  }

  // EMAIL CHECK
  Future<Map<String, dynamic>?> getAccountInfo(String email) async {
    QuerySnapshot querySnapshot =
        await accounts.where('email', isEqualTo: email).get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first.data() as Map<String, dynamic>;
    }
    return null;
  }
}
