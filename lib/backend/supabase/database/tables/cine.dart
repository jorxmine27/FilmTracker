import '../database.dart';

class CineTable extends SupabaseTable<CineRow> {
  @override
  String get tableName => 'CINE';

  @override
  CineRow createRow(Map<String, dynamic> data) => CineRow(data);
}

class CineRow extends SupabaseDataRow {
  CineRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CineTable();

  int get id => getField<int>('ID')!;
  set id(int value) => setField<int>('ID', value);

  String? get nombre => getField<String>('NOMBRE');
  set nombre(String? value) => setField<String>('NOMBRE', value);

  String? get ubicacion => getField<String>('UBICACION');
  set ubicacion(String? value) => setField<String>('UBICACION', value);

  String? get imagen => getField<String>('IMAGEN');
  set imagen(String? value) => setField<String>('IMAGEN', value);

  String? get latLng => getField<String>('LatLng');
  set latLng(String? value) => setField<String>('LatLng', value);
}
