import 'package:desafio_wk_technology/components/info_sem_dados.dart';
import 'package:desafio_wk_technology/model/doador_media_idade_tipo.dart';
import 'package:desafio_wk_technology/service/doador_service.dart';
import 'package:flutter/material.dart';

class DoadoresMediaIdadeTipoPage extends StatefulWidget {
  const DoadoresMediaIdadeTipoPage({super.key});

  @override
  State<DoadoresMediaIdadeTipoPage> createState() => _DoadoresMediaIdadeTipoPageState();
}

class _DoadoresMediaIdadeTipoPageState extends State<DoadoresMediaIdadeTipoPage> {
  List<DoadorMediaIdadeTipo> doadores = [];
  bool isLoading = true;
  DoadorService service = DoadorService();
  @override
  void initState() {
    super.initState();
    service.fetchDoadorMediaIdadePorTipo().then((data) {
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
        title: const Text('Média de doadores/tipo'),),
      body: Container(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : doadores.isEmpty ? const InfoSemDados() : ListView.builder(
          itemCount: doadores.length,
          itemBuilder: (context, index) {
            final doador = doadores[index];
            return ListTile(
              title: Text('Tipo sanguíneo ${doador.tipo} idade média de doador: ${doador.mediaIdade}'),
            );
          },
        ),
      ),
    );
  }
}
