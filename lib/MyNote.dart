// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labs/notscreen.dart';
import 'package:provider/provider.dart';
import 'EditNote.dart';
import 'note.dart';
import 'sqldb.dart';

class MyNote extends StatelessWidget {
  const MyNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: ((context, index) {
          return noteShape(context.watch<NoteProvider>().notes[index], context);
        }),
        separatorBuilder: ((context, index) => const SizedBox(height: 20,)),
        itemCount: context.watch<NoteProvider>().notes.length);
  }
}

Widget noteShape(Note note, context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditNote(note: note)));
            }, 
      child: Material(
        elevation: 15,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[100],
              ),
              child: Center(
                child: Row(
                  children: [
                    Container(
                      color: color,
                      width: 7,
                      height: double.infinity,
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                note.title,
                                style:  GoogleFonts.openSans(
                                  fontSize: 20.00,
                                  color: const Color(0xff1321e0),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Flexible(
                              child: SizedBox(
                                height: double.infinity,
                                child: Text(
                                  note.content,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style:  GoogleFonts.openSans(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ),
    ),
  );
}
