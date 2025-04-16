import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SavedPhotosRecord extends FirestoreRecord {
  SavedPhotosRecord._(
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

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  bool hasEvent() => _event != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _photo = snapshotData['photo'] as DocumentReference?;
    _event = snapshotData['event'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('saved_photos');

  static Stream<SavedPhotosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SavedPhotosRecord.fromSnapshot(s));

  static Future<SavedPhotosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SavedPhotosRecord.fromSnapshot(s));

  static SavedPhotosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SavedPhotosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SavedPhotosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SavedPhotosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SavedPhotosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SavedPhotosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSavedPhotosRecordData({
  DateTime? createdAt,
  DocumentReference? user,
  DocumentReference? photo,
  DocumentReference? event,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'user': user,
      'photo': photo,
      'event': event,
    }.withoutNulls,
  );

  return firestoreData;
}

class SavedPhotosRecordDocumentEquality implements Equality<SavedPhotosRecord> {
  const SavedPhotosRecordDocumentEquality();

  @override
  bool equals(SavedPhotosRecord? e1, SavedPhotosRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.user == e2?.user &&
        e1?.photo == e2?.photo &&
        e1?.event == e2?.event;
  }

  @override
  int hash(SavedPhotosRecord? e) =>
      const ListEquality().hash([e?.createdAt, e?.user, e?.photo, e?.event]);

  @override
  bool isValidKey(Object? o) => o is SavedPhotosRecord;
}
