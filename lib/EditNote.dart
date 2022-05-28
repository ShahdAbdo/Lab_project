// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labs/notscreen.dart';
import 'package:labs/sqldb.dart';
import 'package:provider/provider.dart';
import 'homescreen.dart';
import 'note.dart';
import 'pickerColor.dart';

class EditNote extends StatefulWidget {
  Note note;
  EditNote({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  var titleController = TextEditingController();

  var contentController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
     titleController.text = widget.note.title;
    contentController.text = widget.note.content;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:color,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Note',
          style: GoogleFonts.openSans(fontSize: 20, color: Colors.white),
        ),
        // Icon(Icons.arrow_back , color: Colors.black,),
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
                              const SizedBox(width: 5,),
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
                                InkWell(
                                   onTap: (){
                                        //  context
                                        //     .read<NoteProvider>()
                                        //     .deleteNote(widget.note.id)
                                        //     .then((value) {
                                        //   context
                                        //       .read<NoteProvider>()
                                        //       .getNotes();
                                        //   Navigator.pushReplacement(
                                        //       context,
                                        //       MaterialPageRoute(
                                        //           builder: (context) =>
                                        //               const HomeScreen()));
                                        // });
                                      },
                              child:Row  (
                                children:[
                                ElevatedButton(
                                onPressed: () {
                                          context
                                            .read<NoteProvider>()
                                            .deleteNote(widget.note.id)
                                            .then((value) {
                                          context
                                              .read<NoteProvider>()
                                              .getNotes();
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomeScreen()));
                                        });
                                },
                                child: const Icon(Icons.delete, color: Colors.black),
                                style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(14),
                                primary: const Color(0xFFE9EAEE), // <-- Button color
                                onPrimary: Colors.red, // <-- Splash color
                                ),),
                                 const SizedBox( width: 5,),
                              Text(' Delete',
                              style: GoogleFonts.openSans (
                                fontSize: 18,
                                 color: Colors.white) ),  
                                ]
                              ),
                                  // child: Row(
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
                                const SizedBox(
                                  height: 20,
                                ),
                                 MyColorPicker(
                                     onSelectColor: (val) {
                                       setState(() {
                                         color = val;
                                       });
                                     },
                                     availableColors: const [
                                       Color(0xFF1321E0),
                                       Colors.green,
                                       Colors.greenAccent,
                                       Colors.yellow,
                                       Colors.orange,
                                       Colors.red,
                                       Colors.purple,
                                       Colors.grey,
                                       Colors.deepOrange,
                                       Colors.teal
                                     ],
                                     initialColor: const Color (0xFF1321E0))
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
            color: Colors.white,
            onPressed: () {
               if (formKey.currentState!.validate()) {
                  context
                      .read<NoteProvider>()
                      .updateNote(
                          id: widget.note.id,
                          item: Note(
                              id: widget.note.id,
                              title: titleController.text,
                              content: contentController.text,
                              ))
                      .then((value) {
                    context.read<NoteProvider>().getNotes();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  const HomeScreen()));
                  });
                }
            },
          ),
        ],
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
