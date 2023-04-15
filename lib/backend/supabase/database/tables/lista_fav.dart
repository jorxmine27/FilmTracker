import '../database.dart';

class ListaFavTable extends SupabaseTable<ListaFavRow> {
  @override
  String get tableName => 'LISTA_FAV';

  @override
  ListaFavRow createRow(Map<String, dynamic> data) => ListaFavRow(data);
}

class ListaFavRow extends SupabaseDataRow {
  ListaFavRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ListaFavTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get idPelicula => getField<int>('ID_PELICULA')!;
  set idPelicula(int value) => setField<int>('ID_PELICULA', value);
}
