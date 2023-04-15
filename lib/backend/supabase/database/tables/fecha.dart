import '../database.dart';

class FechaTable extends SupabaseTable<FechaRow> {
  @override
  String get tableName => 'FECHA';

  @override
  FechaRow createRow(Map<String, dynamic> data) => FechaRow(data);
}

class FechaRow extends SupabaseDataRow {
  FechaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FechaTable();

  int get id => getField<int>('ID')!;
  set id(int value) => setField<int>('ID', value);

  DateTime? get fecha => getField<DateTime>('FECHA');
  set fecha(DateTime? value) => setField<DateTime>('FECHA', value);
}
