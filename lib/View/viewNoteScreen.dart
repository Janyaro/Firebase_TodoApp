import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import 'package:flutter/material.dart';

import 'package:note_app/Utility/utils.dart';
import 'package:note_app/View/addNote.dart';

class ViewNoteScreen extends StatefulWidget {
  const ViewNoteScreen({super.key});

  @override
  State<ViewNoteScreen> createState() => _ViewNoteScreenState();
}

class _ViewNoteScreenState extends State<ViewNoteScreen> {
  final ref = FirebaseDatabase.instance.ref('Table');
  final searchController = TextEditingController();
  final editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'View Note',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: searchController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Search',
                  border: OutlineInputBorder()),
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: FirebaseAnimatedList(
                defaultChild: const Text('Loading'),
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  String title = snapshot.child('title').value.toString();
                  String id = snapshot.child('id').value.toString();
                  if (searchController.text.isEmpty) {
                    return Card(
                      elevation: 4,
                      child: ListTile(
                        title: Text(snapshot.child('title').value.toString()),
                        subtitle: Text(snapshot.child('id').value.toString()),
                        trailing: PopupMenuButton(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                child: ListTile(
                              onTap: () {
                                showMyDialog(title, id);
                                Navigator.pop(context);
                              },
                              leading: const Icon(Icons.edit),
                              title: const Text('Edit'),
                            )),
                            PopupMenuItem(
                                child: ListTile(
                              onTap: () {
                                ref.child(id).remove();
                                Navigator.pop(context);
                              },
                              leading: const Icon(Icons.delete),
                              title: const Text('Delete'),
                            )),
                          ],
                        ),
                      ),
                    );
                  } else if (title.toLowerCase().contains(
                      searchController.text.toLowerCase().toString())) {
                    return Card(
                      elevation: 4,
                      child: ListTile(
                        title: Text(snapshot.child('title').value.toString()),
                        subtitle: Text(snapshot.child('id').value.toString()),
                        trailing: PopupMenuButton(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                child: ListTile(
                              onTap: () {
                                showMyDialog(title, id);
                                Navigator.pop(context);
                              },
                              leading: const Icon(Icons.edit),
                              title: const Text('Edit'),
                            )),
                            PopupMenuItem(
                                child: ListTile(
                              onTap: () {
                                ref.child(id).remove();
                                Navigator.pop(context);
                              },
                              leading: const Icon(Icons.delete),
                              title: const Text('Delete'),
                            )),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Card(
                      elevation: 4,
                      child: ListTile(
                        title: Text(snapshot.child('title').value.toString()),
                        subtitle: Text(snapshot.child('id').value.toString()),
                        trailing: PopupMenuButton(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                child: ListTile(
                              onTap: () {
                                showMyDialog(title, id);
                                Navigator.pop(context);
                              },
                              leading: const Icon(Icons.edit),
                              title: const Text('Edit'),
                            )),
                            PopupMenuItem(
                                child: ListTile(
                              onTap: () {
                                ref.child(id).remove();
                                Navigator.pop(context);
                              },
                              leading: const Icon(Icons.delete),
                              title: const Text('Delete'),
                            )),
                          ],
                        ),
                      ),
                    );
                  }
                }),
          )
        ],
      ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.deepPurple,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddNoteScreen()));
            },
            shape: const CircleBorder(),
          ),
        ),
      ),
    );
  }

  Future<void> showMyDialog(String title, String id) async {
    editController.text = title;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              controller: editController,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    ref
                        .child(id)
                        .update({'title': editController.text.toString()}).then(
                            (value) {
                      Utils().toastMessage('Data Update');
                      Navigator.pop(context);
                    }).onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
                  },
                  child: Text('Ok')),
            ],
          );
        });
  }
}
