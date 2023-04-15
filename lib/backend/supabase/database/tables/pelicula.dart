import '../database.dart';

class PeliculaTable extends SupabaseTable<PeliculaRow> {
  @override
  String get tableName => 'PELICULA';

  @override
  PeliculaRow createRow(Map<String, dynamic> data) => PeliculaRow(data);
}

class PeliculaRow extends SupabaseDataRow {
  PeliculaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PeliculaTable();

  int get id => getField<int>('ID')!;
  set id(int value) => setField<int>('ID', value);

  String? get nombre => getField<String>('NOMBRE');
  set nombre(String? value) => setField<String>('NOMBRE', value);

  double? get valoracion => getField<double>('VALORACION');
  set valoracion(double? value) => setField<double>('VALORACION', value);

  String? get imagen => getField<String>('IMAGEN');
  set imagen(String? value) => setField<String>('IMAGEN', value);

  String? get duracion => getField<String>('DURACION');
  set duracion(String? value) => setField<String>('DURACION', value);

  String? get sinopsis => getField<String>('SINOPSIS');
  set sinopsis(String? value) => setField<String>('SINOPSIS', value);

  String? get trailer => getField<String>('TRAILER');
  set trailer(String? value) => setField<String>('TRAILER', value);
}
