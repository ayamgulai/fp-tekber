import '../models/bookModels.dart';

final List<Book> books = [
  Book(
    title: "The Great Gatsby",
    types: Types.novel,
    pages: 180,
    pageNow: 120,
    isCompleted: false,
    dateAdded: DateTime.now(),
    note: "A classic novel about the American Dream."
  ),
  Book(
    title: "Physics for Beginners",
    types: Types.education,
    pages: 300,
    pageNow: 300,
    isCompleted: true,
    dateAdded: DateTime.now(),
    note: "Completed, covers the basics of physics."
  ),
  Book(
    title: "Flutter Development",
    types: Types.references,
    pages: 450,
    pageNow: 230,
    isCompleted: false,
    dateAdded: DateTime.now(),
    note: "A guide to building apps with Flutter."
  ),
  Book(
    title: "Cooking Guide",
    types: Types.other,
    pages: 150,
    pageNow: 150,
    isCompleted: true,
    dateAdded: DateTime.now(),
    note: "A handy reference for easy recipes."
  ),
  Book(
    title: "Mystery of the Old House",
    types: Types.novel,
    pages: 220,
    pageNow: 50,
    isCompleted: false,
    dateAdded: DateTime.now(),
    note: "An intriguing mystery novel."
  ),
  Book(
    title: "Biology 101",
    types: Types.education,
    pages: 350,
    pageNow: 320,
    isCompleted: false,
    dateAdded: DateTime.now(),
    note: "Basic concepts of biology for beginners."
  ),
  Book(
    title: "Advanced Math",
    types: Types.references,
    pages: 500,
    pageNow: 500,
    isCompleted: true,
    dateAdded: DateTime.now(),
    note: "A comprehensive guide to advanced math."
  ),
  Book(
    title: "Gardening Tips",
    types: Types.other,
    pages: 90,
    pageNow: 20,
    isCompleted: false,
    dateAdded: DateTime.now(),
    note: "Tips and tricks for successful gardening."
  ),
  Book(
    title: "Romantic Novel",
    types: Types.novel,
    pages: 250,
    pageNow: 250,
    isCompleted: true,
    dateAdded: DateTime.now(),
    note: "A touching romantic story."
  ),
  Book(
    title: "Introduction to Chemistry",
    types: Types.education,
    pages: 280,
    pageNow: 100,
    isCompleted: false,
    dateAdded: DateTime.now(),
    note: "An introductory text for chemistry students."
  ),
];
