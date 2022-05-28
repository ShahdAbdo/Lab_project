// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labs/MyNote.dart';
import 'package:labs/emptyscreen.dart';
import 'package:provider/provider.dart';
import 'note.dart';
import 'sqldb.dart';
import 'notscreen.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  Note note = Note(id: 1, title: "", content: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFE9EAEE),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'MY Notes',
            style: GoogleFonts.openSans(fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF1321E0),
        ),
        body: context.watch<NoteProvider>().notes.isEmpty
            ? const EmptyScreen()
            : const MyNote(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NoteScreen()));
          },
          child: Container(
            height: 60,
            width: 60,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.purpleAccent,
                  Color(0xFF1321E0),
                ],
              ),
            ),
            child: const Icon(
              Icons.add,
            ),
          ),
        ));
  }
}
