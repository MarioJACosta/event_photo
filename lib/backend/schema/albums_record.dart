import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlbumsRecord extends FirestoreRecord {
  AlbumsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "photoIds" field.
  List<DocumentReference>? _photoIds;
  List<DocumentReference> get photoIds => _photoIds ?? const [];
  bool hasPhotoIds() => _photoIds != null;

  // "eventId" field.
  DocumentReference? _eventId;
  DocumentReference? get eventId => _eventId;
  bool hasEventId() => _eventId != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _userID = snapshotData['userID'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _photoIds = getDataList(snapshotData['photoIds']);
    _eventId = snapshotData['eventId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('albums');

  static Stream<AlbumsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AlbumsRecord.fromSnapshot(s));

  static Future<AlbumsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AlbumsRecord.fromSnapshot(s));

  static AlbumsRecord fromSnapshot(DocumentSnapshot snapshot) => AlbumsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AlbumsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AlbumsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AlbumsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AlbumsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAlbumsRecordData({
  String? uid,
  DocumentReference? userID,
  String? name,
  DateTime? createdAt,
  DocumentReference? eventId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'userID': userID,
      'name': name,
      'createdAt': createdAt,
      'eventId': eventId,
    }.withoutNulls,
  );

  return firestoreData;
}

class AlbumsRecordDocumentEquality implements Equality<AlbumsRecord> {
  const AlbumsRecordDocumentEquality();

  @override
  bool equals(AlbumsRecord? e1, AlbumsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.userID == e2?.userID &&
        e1?.name == e2?.name &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.photoIds, e2?.photoIds) &&
        e1?.eventId == e2?.eventId;
  }

  @override
  int hash(AlbumsRecord? e) => const ListEquality().hash(
      [e?.uid, e?.userID, e?.name, e?.createdAt, e?.photoIds, e?.eventId]);

  @override
  bool isValidKey(Object? o) => o is AlbumsRecord;
}
