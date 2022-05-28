import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labs/homescreen.dart';
import 'package:labs/note.dart';
import 'package:labs/pickerColor.dart';
import 'package:provider/provider.dart';
import 'sqldb.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  var titleController = TextEditingController();

  var contentController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9EAEE),
      appBar: AppBar(
        title: Text(
          'New Note',
          style: GoogleFonts.openSans(fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 500,
                        color: color,
                        child: Container(
                          margin: const EdgeInsets.all(30),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                            Row  (
                              children:[
                                ElevatedButton(
                                onPressed: () {},
                                child: const Icon(Icons.share, color: Colors.black),
                                style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(14),
                                primary: const Color(0xFFE9EAEE), // <-- Button color
                                onPrimary: Colors.red, // <-- Splash color
                                ),),
                              const SizedBox( width: 5,),
                              Text(' Share With your friends',
                              style: GoogleFonts.openSans (
                                fontSize: 18,
                                 color: Colors.white) ),  
                                ]
                              ),
                                // Row(
                                //   children: [
                                //     CircleAvatar(
                                //       child: const Icon(Icons.share),
                                //       backgroundColor: Colors.grey.shade400,
                                //       foregroundColor: Colors.black,
                                //     ),
                                //     const SizedBox(
                                //       width: 10,
                                //     ),
                                //     Text(
                                //       "Share with your friends",
                                //       style: GoogleFonts.openSans(
                                //         color: Colors.grey,
                                //         fontSize: 15,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              const SizedBox(height: 20,),
                            Row  (
                              children:[
                                ElevatedButton(
                                onPressed: () {},
                                child: const Icon(Icons.delete, color: Colors.black),
                                style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(14),
                                primary: const Color(0xFFE9EAEE), // <-- Button color
                                onPrimary: Colors.red, // <-- Splash color
                                ),),
                              const SizedBox(width: 5,),
                              Text(' Delete',
                              style: GoogleFonts.openSans (
                                fontSize: 18,
                                 color: Colors.white) ),  
                                ]
                              ),
                              const SizedBox(height: 20,),
                            Row  (
                              children:[
                                ElevatedButton(
                                onPressed: () {},
                                child: const Icon(Icons.copy, color: Colors.black),
                                style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(14),
                                primary: const Color(0xFFE9EAEE), // <-- Button color
                                onPrimary: Colors.red, // <-- Splash color
                                ),),
                              const SizedBox(width: 5,),
                              Text(' Duplicate',
                              style: GoogleFonts.openSans (
                                fontSize: 18,
                                 color: Colors.white) ),  
                                ]
                              ),
                                // Row(
                                //   children: [
                                //     CircleAvatar(
                                //       child: const Icon(Icons.delete),
                                //       backgroundColor: Colors.grey.shade400,
                                //       foregroundColor: Colors.black,
                                //     ),
                                //     const SizedBox(
                                //       width: 10,
                                //     ),
                                //     Text("Delete",
                                //         style: GoogleFonts.openSans(
                                //           color: Colors.grey,
                                //           fontSize: 15,
                                //         ))
                                //   ],
                                // ),
                                // const SizedBox(
                                //   height: 15,
                                // ),
                                // Row(
                                //   children: [
                                //     CircleAvatar(
                                //       child: const Icon(Icons.copy),
                                //       backgroundColor: Colors.grey.shade400,
                                //       foregroundColor: Colors.black,
                                //     ),
                                //     const SizedBox(
                                //       width: 10,
                                //     ),
                                //     Text(
                                //       "Duplicate",
                                //       style: GoogleFonts.openSans(
                                //         color: Colors.grey,
                                //         fontSize: 15,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              const SizedBox(height: 20,),
                          //   SingleChildScrollView(
                          //  scrollDirection: Axis.horizontal,
                          //  child: Row  (
                          //     children:[
                                MyColorPicker(
                                    onSelectColor: (val) {
                                      setState(() {
                                        color = val;
                                      });
                                    },
                                    availableColors: const [
                                      Color(0xFF1321E0),
                                      Color(0xFFF28B81),
                                      Color(0xFFF7BD02),
                                      Color(0xFFA7FEEB),
                                      Color(0xFFD7AEFC),
                                      Color(0xFFCDFF90),
                                      Color(0xFFAFCBFA),
                                      // Color(0xFFFBCFE9),
                                      Color(0xFFFBF476),
                                      Color(0xFFd20962),
                                    ],
                                    initialColor: color,)
                                    // const Color(0xFF1321E0))
                              // ])),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              icon: const Icon(Icons.more_vert_outlined)),
          IconButton(
            icon: const Icon(
              Icons.check,
            ),
            tooltip: 'complete',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<NoteProvider>().addItem(
                    item: Note(
                        id: Random().nextInt(1000),
                        title: titleController.text,
                        content: contentController.text));
                context.read<NoteProvider>().getNotes();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()));
              }
            },
          ),
        ],
        backgroundColor: color,
      ),
      body: Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: titleController,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  hintText: '  Type Somthing ...',
                  border: InputBorder.none,
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "It is not allowed to leave the title empty ";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: contentController,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  hintText: '  Type Somthing ...',
                  border: InputBorder.none,
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "It is not allowed to leave the content empty ";
                  }
                  return null;
                },
              ),
            ]),
          )),
    );
  }
}

var color =  const Color(0xFF1321E0);
