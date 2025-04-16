import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PhotosRecord extends FirestoreRecord {
  PhotosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "comments" field.
  int? _comments;
  int get comments => _comments ?? 0;
  bool hasComments() => _comments != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _url = snapshotData['url'] as String?;
    _likes = castToType<int>(snapshotData['likes']);
    _description = snapshotData['description'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _comments = castToType<int>(snapshotData['comments']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('photos');

  static Stream<PhotosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PhotosRecord.fromSnapshot(s));

  static Future<PhotosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PhotosRecord.fromSnapshot(s));

  static PhotosRecord fromSnapshot(DocumentSnapshot snapshot) => PhotosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PhotosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PhotosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PhotosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PhotosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPhotosRecordData({
  String? uid,
  String? url,
  int? likes,
  String? description,
  DateTime? createdAt,
  DocumentReference? owner,
  int? comments,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'url': url,
      'likes': likes,
      'description': description,
      'created_at': createdAt,
      'owner': owner,
      'comments': comments,
    }.withoutNulls,
  );

  return firestoreData;
}

class PhotosRecordDocumentEquality implements Equality<PhotosRecord> {
  const PhotosRecordDocumentEquality();

  @override
  bool equals(PhotosRecord? e1, PhotosRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.url == e2?.url &&
        e1?.likes == e2?.likes &&
        e1?.description == e2?.description &&
        e1?.createdAt == e2?.createdAt &&
        e1?.owner == e2?.owner &&
        e1?.comments == e2?.comments;
  }

  @override
  int hash(PhotosRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.url,
        e?.likes,
        e?.description,
        e?.createdAt,
        e?.owner,
        e?.comments
      ]);

  @override
  bool isValidKey(Object? o) => o is PhotosRecord;
}
