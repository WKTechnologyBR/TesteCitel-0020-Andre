import 'package:desafio_wk_technology/model/obesidade.dart';
import 'package:desafio_wk_technology/service/doador_service.dart';
import 'package:flutter/material.dart';

class ObesidadePage extends StatefulWidget {
  const ObesidadePage({super.key});

  @override
  State<ObesidadePage> createState() => _ObesidadePageState();
}

class _ObesidadePageState extends State<ObesidadePage> {
  bool isLoading = true;
  DoadorService service = DoadorService();
  Obesidade obesidade =
      Obesidade(obesidadeFeminina: "0", obesidadeMasculina: "0"); 
 @override
  void initState() {
    super.initState();
    service.fetchObesidadeGenero().then((data) {
      setState(() {
        obesidade = data ?? obesidade;
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
        title: const Text('Obesos por gênero')),
      body: Center(
          child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Homens',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${obesidade.obesidadeMasculina}%',
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Mulheres',
                    style:  TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${obesidade.obesidadeFeminina}%',
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
