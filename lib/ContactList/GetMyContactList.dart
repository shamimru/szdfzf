import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class Getmycontactlist extends StatefulWidget {
  @override
  _GetmycontactlistState createState() => _GetmycontactlistState();
}

class _GetmycontactlistState extends State<Getmycontactlist> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    getContactList();
  }

  Future<void> getContactList() async {
    bool permissionGranted = await FlutterContacts.requestPermission();
    if (!permissionGranted) return;

    List<Contact> fetchedContacts = await FlutterContacts.getContacts(
      withProperties: true,
      withPhoto: true,
    );

    setState(() {
      contacts = fetchedContacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      body: contacts.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(contact.displayName),
            subtitle: Text(contact.phones.isNotEmpty ? contact.phones[0].number : 'No phone'),
            leading: contact.photo != null
                ? CircleAvatar(backgroundImage: MemoryImage(contact.photo!))
                : CircleAvatar(child: Icon(Icons.person)),
          );
        },
      ),
    );
  }
}
