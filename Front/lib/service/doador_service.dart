import 'package:desafio_wk_technology/model/doador_media_idade_tipo.dart';
import 'package:desafio_wk_technology/model/doadores_estado.dart';
import 'package:desafio_wk_technology/model/doadores_faixa_etaria_imc.dart';
import 'package:desafio_wk_technology/model/doadores_tipo_receptor.dart';
import 'package:desafio_wk_technology/model/obesidade.dart';
import 'package:desafio_wk_technology/path/path.dart';
import 'package:desafio_wk_technology/service/http_service.dart';
import 'package:dio/dio.dart';

class DoadorService {
  HttpService httpService = HttpService();

  Future<List<DoadoresEstado>> fetchDoadoresEstado() async {
    try {
      var response = await httpService.get(url, doadorPorEstado);
      var data = response.data as List;
      return data.map((json) => DoadoresEstado.fromJson(json)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<DoadoresTipoReceptor>> fetchDoadorRecptador() async {
    try {
      var response = await httpService.get(url, doadorRecptadores);
      var data = response.data as List;
      return data.map((json) => DoadoresTipoReceptor.fromJson(json)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<DoadorMediaIdadeTipo>> fetchDoadorMediaIdadePorTipo() async {
    try {
      var response = await httpService.get(url, mediaDoador);
      var data = response.data as List;
      return data.map((json) => DoadorMediaIdadeTipo.fromJson(json)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<DoadoresFaixaEtariaIMC>> fetchDoadorFaixaEtariaIMC() async {
    try {
      var response = await httpService.get(url, doadorFaixaIdadeIMC);
      var data = response.data as List;
      return data.map((json) => DoadoresFaixaEtariaIMC.fromJson(json)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<Obesidade?> fetchObesidadeGenero() async {
    try {
      var response = await httpService.get(url, obesoPorGenero);
      return Obesidade.fromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }
  Future upload(String filePath, String fileName) async{
    FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(filePath, filename: fileName),
      });
    return httpService.post(url, 'carregar', formData);
  }
}
