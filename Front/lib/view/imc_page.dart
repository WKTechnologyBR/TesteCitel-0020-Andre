import 'package:desafio_wk_technology/components/info_sem_dados.dart';
import 'package:desafio_wk_technology/model/doadores_faixa_etaria_imc.dart';
import 'package:desafio_wk_technology/service/doador_service.dart';
import 'package:flutter/material.dart';

class IMCPage extends StatefulWidget {
  const IMCPage({super.key});

  @override
  State<IMCPage> createState() => _IMCPageState();
}

class _IMCPageState extends State<IMCPage> {
  bool isLoading = true;
  DoadorService service = DoadorService();
  List<DoadoresFaixaEtariaIMC> doadores = []; 
   @override
  void initState() {
    super.initState();
    service.fetchDoadorFaixaEtariaIMC().then((data) {
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
        title: const Text('IMC por faixa etária')),
      body: Container(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : doadores.isEmpty ? const InfoSemDados() : ListView.builder(
          itemCount: doadores.length,
          itemBuilder: (context, index) {
            final doador = doadores[index];
            return ListTile(
              title: Text('Faixa etária ${doador.faixaEtaria},  IMC: ${doador.imcMedio}'),
            );
          },
        ),
      ),
    );
  }
}
