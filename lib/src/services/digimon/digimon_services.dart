

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:test_flutter_angel_valdiviezo/environments/environments.dart';
import 'package:test_flutter_angel_valdiviezo/src/models/models.dart';

const digiStorage = FlutterSecureStorage();
MensajesAlertas digiMensajesProspectoService = MensajesAlertas();
ResponseValidation digiResponseValidationService = ResponseValidation();

class DigimonService extends ChangeNotifier{

  final String endPoint = CadenaConexion().apiDigimons;
  final String endPointDetalle = CadenaConexion().apiDetalleDigimons;  

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  String varPassWordActual = '';
  String varPassWord = '';
  String varPassWordConfirm = '';
  DigimonModel? digiModel;

  bool isOscuredConfirm = true;
  bool get varIsOscuredConfirm => isOscuredConfirm;
  set varIsOscuredConfirm (bool value){
    isOscuredConfirm = value;
    notifyListeners();
  }

  bool tieneUbicacion = false;
  bool get varTieneUbicacion => tieneUbicacion;
  set varTieneUbicacion(bool value){
    tieneUbicacion = value;
    notifyListeners();
  }

  String varDireccion = '';
  String varCorreo = '';
  String varUbicacionLat = '';
  String varUbicacionLong = '';


  String cedulaSelect = 'assets/BtnCedula_Gris.png';
  String pasaporteSelect = 'assets/BtnPasaporte_Blanco.png';

  String get varCedulaSelect => cedulaSelect;
  set varCedulaSelect (String value){
    cedulaSelect = value;
    notifyListeners();
  }

  String get varPasaporteSelect => pasaporteSelect;
  set varPasaporteSelect (String value){
    pasaporteSelect = value;
    notifyListeners();
  }

  String varCedula = '';
  String varPasaporte = '';

  bool isOscuredAntigua = true;
  bool get varIsOscuredAntigua => isOscuredAntigua;
  set varIsOscuredAntigua (bool value){
    isOscuredAntigua = value;
    notifyListeners();
  }

  bool isOscured = true;
  bool get varIsOscured => isOscured;
  set varIsOscured (bool value){
    isOscured = value;
    notifyListeners();
  }

  getDigimons(String cantidadPage) async {
    try{
      final baseURL = '$endPoint?pageSize=$cantidadPage';//endPoint;//20

      final varResponse = await http.get(Uri.parse(baseURL));
      if(varResponse.statusCode != 200) return null;

      final prospRsp = DigimonModel.fromJson(varResponse.body);
      return prospRsp;
    }
    on SocketException catch (_) {
      Fluttertoast.showToast(
        msg: digiMensajesProspectoService.mensajeFallaInternet,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
          
    }
  }

  getDigimonsById(String id) async {
    try{
      final baseURL = '$endPointDetalle/digimon/$id';//endPoint;//20

      final varResponse = await http.get(Uri.parse(baseURL));
      if(varResponse.statusCode != 200) return null;

      final prospRsp = DigimonDetalleModel.fromJson(varResponse.body);
      return prospRsp;
    
     } on TimeoutException catch (_) {
      Fluttertoast.showToast(
        msg: digiMensajesProspectoService.mensajeTiempoEspera,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    } on SocketException catch (_) {
      Fluttertoast.showToast(
        msg: digiMensajesProspectoService.mensajeFallaInternet,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    } on HttpException catch (_) {
      Fluttertoast.showToast(
        msg: digiMensajesProspectoService.mensajePeticion,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    } on FormatException catch (_) {
      Fluttertoast.showToast(
        msg: digiMensajesProspectoService.mensajeErrorFormato,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
  }

  

}
