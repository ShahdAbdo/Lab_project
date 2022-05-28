import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sqldb.dart';
import 'welcomscreen.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NoteProvider()..getNotes()),
      ],
      child: const Myapp(),
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
}

class Myapp extends StatelessWidget {
  const Myapp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcomescreen(),
     
    );
  }
}