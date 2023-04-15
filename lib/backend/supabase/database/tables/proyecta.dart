import '../database.dart';

class ProyectaTable extends SupabaseTable<ProyectaRow> {
  @override
  String get tableName => 'PROYECTA';

  @override
  ProyectaRow createRow(Map<String, dynamic> data) => ProyectaRow(data);
}

class ProyectaRow extends SupabaseDataRow {
  ProyectaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProyectaTable();

  int get idCine => getField<int>('ID_CINE')!;
  set idCine(int value) => setField<int>('ID_CINE', value);

  int get idPelicula => getField<int>('ID_PELICULA')!;
  set idPelicula(int value) => setField<int>('ID_PELICULA', value);

  int get idFecha => getField<int>('ID_FECHA')!;
  set idFecha(int value) => setField<int>('ID_FECHA', value);
}
