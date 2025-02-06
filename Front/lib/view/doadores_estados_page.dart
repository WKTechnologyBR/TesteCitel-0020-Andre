import 'package:desafio_wk_technology/components/info_sem_dados.dart';
import 'package:desafio_wk_technology/model/doadores_estado.dart';
import 'package:desafio_wk_technology/service/doador_service.dart';
import 'package:flutter/material.dart';

class DoadoaresEstadoPage extends StatefulWidget {
  const DoadoaresEstadoPage({super.key});

  @override
  State<DoadoaresEstadoPage> createState() => _DoadoaresEstadoPageState();
}

class _DoadoaresEstadoPageState extends State<DoadoaresEstadoPage> {
  List<DoadoresEstado> doadores = [];
  bool isLoading = true;
  DoadorService service = DoadorService();
  @override
  void initState() {
    super.initState();
    service.fetchDoadoresEstado().then((data) {
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
        title: const Text('Doadores por estado'),),
      body: Container(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : doadores.isEmpty ? const InfoSemDados() :ListView.builder(
          itemCount: doadores.length,
          itemBuilder: (context, index) {
            final doador = doadores[index];
            return ListTile(
              title: Text('Estado ${doador.estado},  Quantidade de doador: ${doador.total}'),
            );
          },
        ),
      ),
    );
  }
}
