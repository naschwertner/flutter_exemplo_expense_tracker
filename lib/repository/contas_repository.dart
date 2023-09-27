import 'package:expense_tracker/models/banco.dart';
import 'package:expense_tracker/models/categoria.dart';
import 'package:expense_tracker/models/tipo_transacao.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/conta.dart';

class ContasRepository {
  Future<List<Conta>> listarContas() async {
    final supabase = Supabase.instance;
        final rows = await supabase.client.from('contas')
        .select<List<Map<String, dynamic>>>();

        final contas = rows.map((row) => Conta(
          id: row['id'],
          descricao: row ['descricao'],
          tipoConta: TipoConta.values[row['tipo_conta']],
          bancoId: row['banco'],
        )).toList();

        return contas;

}
}

//create table contas (
  //id bigint generated always as identity primary key,
  //descricao text not null,
  //tipo_conta integer not null,
  //banco text,
  //ativo boolean default true
//);


