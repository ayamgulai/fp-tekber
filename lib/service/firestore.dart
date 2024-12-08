import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/bookModels.dart';

class FirestoreService {

  final CollectionReference books = FirebaseFirestore.instance.collection('book');

  // CREATE
  Future<void> createBook(
    String title, 
    Types types, 
    int pages,
    String note, 
    DateTime dateAdded,
    ) 
  async {
    await books.add({
      'title': title,
      'types': types.toString().split('.').last,
      'pages': pages,
      'pageNow': 0,
      'isCompleted': false,
      'note':note,
      'dateAdded': FieldValue.serverTimestamp(),
      'dateFinished': DateTime(9999, 12, 31),
    
    });
  }

  // READ
  Stream<QuerySnapshot> getBooks() {
    return books.orderBy('dateAdded', descending: true).snapshots();
  }

  // UPDATE
  Future<void> updateProgress(
    String id, 
    int pageNow, 
    int pages,
    ) async {
    await books.doc(id).update({
      'pageNow': pageNow,
      'isCompleted': (pageNow < pages)? false : true,
      'dateFinished': (pageNow < pages)? DateTime(9999, 12, 31) :FieldValue.serverTimestamp(),
    });
  }

  // DELETE
  Future<void> deleteBook(String id) async {
    await books.doc(id).delete();
  }

}