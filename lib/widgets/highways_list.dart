import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_cnt/screens/highway_form_screen.dart';

class HighwaysList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference highways =
        FirebaseFirestore.instance.collection('highways');

    return StreamBuilder(
      stream: highways.snapshots(includeMetadataChanges: true),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('erro');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) {
            final highway = snapshot.data.docs[index];
            final hasCompleted = highway.data()["highwayType"] != null &&
                highway.data()["highwayProfile"] != null &&
                highway.data()["criticalLocation"] != null &&
                highway.data()["criticalLocationPicture"] != null;

            return _HighwaysListTile(
              id: highway.id,
              name: highway.data()["name"],
              uf: highway.data()["uf"],
              hasCompleted: hasCompleted,
              hasPendingWrite: highway.metadata.hasPendingWrites,
            );
          },
        );
      },
    );
  }
}

class _HighwaysListTile extends StatelessWidget {
  final String id;
  final String name;
  final String uf;
  final bool hasPendingWrite;
  final bool hasCompleted;

  _HighwaysListTile({
    this.name,
    this.uf,
    this.id,
    this.hasPendingWrite,
    this.hasCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(name),
          if (hasCompleted)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.check,
                color: hasPendingWrite ? Colors.grey : Colors.green,
                size: 20.0,
              ),
            ),
        ],
      ),
      subtitle: Text(uf),
      trailing: Icon(Icons.chevron_right),
      onTap: () => Navigator.pushNamed(
        context,
        HighwayFormScreen.routeName,
        arguments: HighwayFormScreenArgs(highwayName: name, id: id),
      ),
    );
  }
}
