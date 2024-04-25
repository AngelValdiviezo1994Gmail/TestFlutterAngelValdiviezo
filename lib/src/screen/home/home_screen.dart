//import 'package:auto_size_text/auto_size_text.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_angel_valdiviezo/environments/environments.dart';
import 'package:test_flutter_angel_valdiviezo/src/models/models.dart';

//import 'package:provider/provider.dart';

CadenaConexion objCadConHome = CadenaConexion();
UsuarioType? objUserGeneralHome;

//ignore: must_be_immutable
class HomeScreen extends StatelessWidget{
  static const String routerName = 'homeScreen';
  UsuarioType? objUserGeneralHomeEntrada;

  //ignore: use_super_parameters
  HomeScreen({Key? key, objUserGeneralHomeEntrada}) : super (key: key) {
    objUserGeneralHome = objUserGeneralHomeEntrada;
  } 

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    /*
    Provider.of<WalletServices>(context).obtenerCredito(objUserGeneralHome?.identificacion ?? '');
    CupoCreditoType credito = Provider.of<WalletServices>(context, listen: false).objCredito;
    objUserGeneralHome!.cupoCredito = credito; 
    */

    return Scaffold(
        body: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 5,),
                        
                        Row(
                          children: [
                            const SizedBox(width: 17,),
                            const Text('Favoritos', style: TextStyle( fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black)),
                            const SizedBox(width: 15),
                            IconButton(
                              icon: const Icon(Icons.star_border,size: 30,),
                              tooltip: '',
                              onPressed: (){},
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 50,),
                      ],
                    ),
                  )
                  
      );
    }
}
