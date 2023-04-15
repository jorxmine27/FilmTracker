import '../database.dart';

class ListaVerTable extends SupabaseTable<ListaVerRow> {
  @override
  String get tableName => 'LISTA_VER';

  @override
  ListaVerRow createRow(Map<String, dynamic> data) => ListaVerRow(data);
}

class ListaVerRow extends SupabaseDataRow {
  ListaVerRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ListaVerTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get idPelicula => getField<int>('ID_PELICULA')!;
  set idPelicula(int value) => setField<int>('ID_PELICULA', value);

  int get idCine => getField<int>('ID_CINE')!;
  set idCine(int value) => setField<int>('ID_CINE', value);

  DateTime get fecha => getField<DateTime>('FECHA')!;
  set fecha(DateTime value) => setField<DateTime>('FECHA', value);
}
