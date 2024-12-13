import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/bookModels.dart';
import '../service/firestore.dart';

final Stream<List<Book>> books = FirestoreService().getBooks();