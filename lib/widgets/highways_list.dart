import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_cnt/screens/form_screen.dart';

class HighwaysList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference highways =
        FirebaseFirestore.instance.collection('highways');

    return FutureBuilder<QuerySnapshot>(
      future: highways.get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('deu erro');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) {
            return _HighwaysListTile(
              name: snapshot.data.docs[index].data()["name"],
              uf: snapshot.data.docs[index].data()["uf"],
            );
          },
        );
      },
    );
  }
}

class _HighwaysListTile extends StatelessWidget {
  final String name;
  final String uf;

  _HighwaysListTile({this.name, this.uf});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.name),
      subtitle: Text(this.uf),
      trailing: Icon(Icons.chevron_right),
      onTap: () => Navigator.pushNamed(context, FormScreen.routeName),
    );
  }
}
