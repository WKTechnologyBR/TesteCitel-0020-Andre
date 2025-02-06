import 'package:desafio_wk_technology/components/info_sem_dados.dart';
import 'package:desafio_wk_technology/model/doadores_tipo_receptor.dart';
import 'package:desafio_wk_technology/service/doador_service.dart';
import 'package:flutter/material.dart';

class DoadoaresTipoRecptadorPage extends StatefulWidget {
  const DoadoaresTipoRecptadorPage({super.key});

  @override
  State<DoadoaresTipoRecptadorPage> createState() => _DoadoaresTipoRecptadorPageState();
}

class _DoadoaresTipoRecptadorPageState extends State<DoadoaresTipoRecptadorPage> {
  List<DoadoresTipoReceptor> doadores = [];
  bool isLoading = true;
  DoadorService service = DoadorService();
  @override
  void initState() {
    super.initState();
    service.fetchDoadorRecptador().then((data) {
      setState(() {
        doadores = data;
        isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.red,
        title: const Text('Doadores por receptador'),),
      body: Container(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : doadores.isEmpty ? const InfoSemDados() : ListView.builder(
          itemCount: doadores.length,
          itemBuilder: (context, index) {
            final doador = doadores[index];
            return ListTile(
              title: Text('Tipo sanguíneo ${doador.tipoReceptor},  Quantidade de doador: ${doador.quantidadeDoadores}'),
            );
          },
        ),
      ),
    );
  }
}
