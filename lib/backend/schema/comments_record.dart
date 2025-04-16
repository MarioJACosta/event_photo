import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "photo" field.
  DocumentReference? _photo;
  DocumentReference? get photo => _photo;
  bool hasPhoto() => _photo != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _photo = snapshotData['photo'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  DateTime? createdAt,
  DocumentReference? user,
  DocumentReference? photo,
  String? comment,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'user': user,
      'photo': photo,
      'comment': comment,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.user == e2?.user &&
        e1?.photo == e2?.photo &&
        e1?.comment == e2?.comment;
  }

  @override
  int hash(CommentsRecord? e) =>
      const ListEquality().hash([e?.createdAt, e?.user, e?.photo, e?.comment]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
