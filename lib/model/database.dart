import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yourtea/model/tea.dart';
import 'package:yourtea/model/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService ({this.uid});

  final CollectionReference teaCollection = Firestore.instance.collection('tea');
  Future updateUserData(String firstname, String lastname, String address, int contact) async {
    // ignore: deprecated_member_use
    return await teaCollection.document(uid).setData({
      'firstname': firstname,
      'lastname': lastname,
      'address': address,
      'contact': contact,
    });
  }

  List<Tea> _teaListSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Tea(
        firstname: doc.data['firstname'] ?? '',
        lastname: doc.data['lastname'] ?? '',
        address: doc.data['address'] ?? '',
        contact: doc.data['contact'] ?? 0

      );
    }).toList();
  }

  UserData _userDataSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      firstname: snapshot.data['firstname'],
      lastname: snapshot.data['lastname'],
      address: snapshot.data['address'],
      contact: snapshot.data['contact'],
    );
  }


  Stream<List<Tea>> get tea {
    return teaCollection.snapshots()
    .map(_teaListSnapshot);
  }

  Stream<UserData> get userData {
    return teaCollection.document(uid).snapshots()
    .map(_userDataSnapshot);
  }
}