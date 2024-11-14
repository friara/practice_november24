// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class Book {
//   final String title;
//   final String author;

//   Book(this.title, this.author);
// }

// class App4 extends StatefulWidget {
//   const App4({super.key});

//   @override
//   State<StatefulWidget> createState() {
//     return _App4State();
//   }
// }

// class _App4State extends State<App4> {
//   //final
//   //final

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: 'Book App',
//       routerDelegate: _routerDelegate,
//       routeInformationParser: _routeInformationParser,
//     );
//   }
// }

// class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {
//   @override
//   Future<BookRoutePath> parseRouteInformation(
//       RouteInformation routeInformation) async {
//     final uri = routeInformation.uri;

//     //Handle '/'
//     if (uri.pathSegments.isEmpty) return BookRoutePath.home();

//     //Handle '/book/:id'
//     if (uri.pathSegments.length == 2) {
//       if (uri.pathSegments[0] != 'book') return BookRoutePath.unknown();
//       var remaining = uri.pathSegments[1];
//       var id = int.tryParse(remaining);
//       if (id == null) return BookRoutePath.unknown();
//       return BookRoutePath.details(id);
//     }

//     //Handle unknown routes
//     return BookRoutePath.unknown();
//   }
// }

// class BookRouterDelegate extends RouterDelegate<BookRoutePath>
//     with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {
//   @override
//   final GlobalKey<NavigatorState> navigatorKey;

//   Book? _selectedBook;
//   bool show404 = false;

//   List<Book> books = [
//     Book('Jane Eyres', 'Pride and Prejudice'),
//     Book('Eric Byrne', 'People who play games'),
//     Book('Erich Fromm', 'The art of loving'),
//   ];

//   BookRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

//   @override
//   BookRoutePath get currentConfiguration {
//     if (show404) return BookRoutePath.unknown();
//     return _selectedBook = null
//         ? BookRoutePath.home()
//         : BookRoutePath.details(books.indexOf(_selectedBook!));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       key: navigatorKey,
//       pages: [
//         MaterialPage(
//           key: const ValueKey('BooksListPage'),
//           child: BooksListScreen(
//             books: books,
//             onTapped: _handleBookTapped,
//           ),
//         ),
//         if (show404)
//           const MaterialPage(
//             key: ValueKey('UnknownPage'),
//             child: UnknownScreen(),
//           )
//         else if (_selectedBook != null)
//           BookDetailsPage(book: _selectedBook!)
//       ],
//       onPopPage: (route, result) {
//         if (!route.didPop(result)) {
//           return false;
//         }
//         //Update the list of pages by setting _selectedBook to null
//         _selectedBook = null;
//         show404 = false;
//         notifyListeners();

//         return true;
//       },
//     );
//   }

//   @override
//   Future<void> setNewRoutePath(BookRoutePath configuration) async {
//     if (configuration.isUnknown) {
//       _selectedBook = null;
//       show404 = true;
//       return;
//     }

//     if (configuration.isDetailsPage) {
//       if (configuration.id! < 0 || configuration.id > books.length - 1) {
//         show404 = true;
//         return;
//       }

//       _selectedBook = books[configuration.id!];
//     } else {
//       _selectedBook = null;
//     }

//     show404 = false;
//   }

//   void _handleBookTapped(Book book) {
//     if (book.title == 'unknown') {
//       show404 = true;
//     } else {
//       _selectedBook = book;
//     }

//     notifyListeners();
//   }
// }

// class BookDetailsPage extends Page {}

// class BookRoutePath {}

// class BooksListScreen extends StatelessWidget {
//   final List<Book> books;
//   final ValueChanged<Book> onTapped;

//   const BooksListScreen({
//     super.key,
//     required this.books,
//     required this.onTapped,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: ListView(
//         children: [
//           for( var book in books)
//           ListTile(
//             title: Text(book.title),
//             subtitle: Text(book.author),
//             onTap: () => onTapped(book),
//           ),
//           ListTile(
//             title: const Text('unlnown'),
//             subtitle: const Text('author'),
//             onTap: () => onTapped(Book('unknown', 'author')),
//           )
//         ],
//       ),
//     );
//   }
// }
