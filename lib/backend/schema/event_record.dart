import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventRecord extends FirestoreRecord {
  EventRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "begin_date" field.
  DateTime? _beginDate;
  DateTime? get beginDate => _beginDate;
  bool hasBeginDate() => _beginDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "event_code" field.
  String? _eventCode;
  String get eventCode => _eventCode ?? '';
  bool hasEventCode() => _eventCode != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _beginDate = snapshotData['begin_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _eventCode = snapshotData['event_code'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('event');

  static Stream<EventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventRecord.fromSnapshot(s));

  static Future<EventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventRecord.fromSnapshot(s));

  static EventRecord fromSnapshot(DocumentSnapshot snapshot) => EventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventRecordData({
  String? name,
  DateTime? beginDate,
  DateTime? endDate,
  DocumentReference? owner,
  DateTime? createdAt,
  String? eventCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'begin_date': beginDate,
      'end_date': endDate,
      'owner': owner,
      'created_at': createdAt,
      'event_code': eventCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventRecordDocumentEquality implements Equality<EventRecord> {
  const EventRecordDocumentEquality();

  @override
  bool equals(EventRecord? e1, EventRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.beginDate == e2?.beginDate &&
        e1?.endDate == e2?.endDate &&
        e1?.owner == e2?.owner &&
        e1?.createdAt == e2?.createdAt &&
        e1?.eventCode == e2?.eventCode;
  }

  @override
  int hash(EventRecord? e) => const ListEquality().hash([
        e?.name,
        e?.beginDate,
        e?.endDate,
        e?.owner,
        e?.createdAt,
        e?.eventCode
      ]);

  @override
  bool isValidKey(Object? o) => o is EventRecord;
}
