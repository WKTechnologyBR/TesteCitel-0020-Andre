import 'package:desafio_wk_technology/components/toast_custom.dart';
import 'package:desafio_wk_technology/service/doador_service.dart';
import 'package:desafio_wk_technology/view/doadores_estados_page.dart';
import 'package:desafio_wk_technology/view/doadores_media_idade_tipo_page.dart';
import 'package:desafio_wk_technology/view/doadores_tipo_recptor_page.dart';
import 'package:desafio_wk_technology/view/imc_page.dart';
import 'package:desafio_wk_technology/view/obesidade_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DoadorService _service = DoadorService();
    bool isLoading = false;

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      _uploadFile(file.name, file.path!);
    } 
  }

loading(bool status){
  setState(() {
          isLoading = status;
  });
}

void _uploadFile(String fileName, String filePath) async {
      try {
        loading(true);
        await _service.upload(
          filePath, fileName
        );
        ToastCustom.showToast(context,  'Arquivo carregado com sucesso');
        loading(false);
      } catch (e) {
        loading(false);
        ToastCustom.showToast(context,  'Erro ao fazer upload verifique o arquivo');
      }
    }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Dados de doadores',
            style: TextStyle(color: Colors.black)),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.analytics),
              title: const Text('Doadores por estado'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DoadoaresEstadoPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.analytics),
              title: const Text('Doadores por receptor'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DoadoaresTipoRecptadorPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.analytics),
              title: const Text('IMC idade'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const IMCPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.analytics),
              title: const Text('Obesos por gênero'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ObesidadePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.analytics),
              title: const Text('Média de doadores/tipo'),
              onTap: () {
                // Ação ao clicar no item
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DoadoresMediaIdadeTipoPage()),
                ); // Fecha o drawer
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:  isLoading
              ? const CircularProgressIndicator()
              :  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _pickFile,
                  child: const Text('Selecionar Arquivo', style: TextStyle(color: Colors.black),),
                ),
              ],
            )),
      ),
    );
  }
}
