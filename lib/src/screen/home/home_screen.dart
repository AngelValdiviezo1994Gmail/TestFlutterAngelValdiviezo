//import 'package:auto_size_text/auto_size_text.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_angel_valdiviezo/environments/environments.dart';
import 'package:test_flutter_angel_valdiviezo/src/models/models.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:test_flutter_angel_valdiviezo/src/services/services.dart';
import 'package:test_flutter_angel_valdiviezo/src/widgets/widget.dart';
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
    
    return FutureBuilder(
      future: DigimonService().getDigimons('80'),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: AutoSizeText(
                '!UPS¡, intenta acceder después de unos minutos.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            );
          }

          if (snapshot.hasData){

            DigimonModel  objDigimons = snapshot.data as DigimonModel;

            return GridView.custom(
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: const [
                  QuiltedGridTile(2, 2),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 2),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) => DigimonData(null,objDigimons.content[index]),
                childCount: objDigimons.content.length
              ),
            );
          }
          
          return Center(
            child: Container(
              width: size.width * 0.4,
              height: size.height * 0.3,
              color: Colors.transparent,
              child: Image.asset('assets/loadingEnrolApp.gif'),
            ),
          );
      }
    );
  
  }
}

//ignore: must_be_immutable
class DigimonData extends StatelessWidget {
  DigiDataModel? objPrd;

  DigimonData(Key? key, DigiDataModel objPrdct) : super (key: key){
    objPrd = objPrdct;
  }

  @override
  Widget build(BuildContext context) {
    //final GlobalKey<FormFieldState> keyCantidadProductos = GlobalKey<FormFieldState>();
    final sizeGrd = MediaQuery.of(context).size;
    return Container(
      width: sizeGrd.width * 0.65,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 3,
        ),
      ),
      child: FittedBox(
        child: Container(
          color: Colors.transparent,
          width: sizeGrd.width * 0.7,//- 120, 
          child: Center(
            child: Column(
              children: [
                Container(
                  color: Colors.transparent,
                  width: sizeGrd.width * 0.95,
                  height: sizeGrd.height * 0.35,
                  child: GestureDetector(
                    onTap: () async {
                      DigimonDetalleModel objDet = await DigimonService().getDigimonsById(objPrd?.id.toString() ?? '');

                      showDialog(
                        //barrierDismissible: false,
                        context: context,
                        builder: (context) =>
                          SimpleDialog(
                            alignment: Alignment.center, 
                            children: [
                            ModalDetalleDigimon(
                              objDigimonTmp: objDet,
                            ),
                          ]
                        ),
                      );            
                    },
                    child: Container(
                        color: Colors.transparent,
                        width: sizeGrd.width,
                        height: sizeGrd.height * 0.3,
                        child: CachedNetworkImage(
                          imageUrl: objPrd!.image,
                          fadeInCurve: Curves.bounceIn,
                          errorWidget: ((context, error, stackTrace) {
                            return Container(
                              color: Colors.transparent,
                              child: Image.asset('assets/no-image.jpg'),
                            );
                          }),
                        ),
                      
                      )
                  ),
                ),
                    
                Container(
                      color: Colors.transparent,
                      width: sizeGrd.width * 0.66,//200,
                      height: sizeGrd.height * 0.05,
                      child: AutoSizeText(
                        objPrd?.name ?? '', //objPrd!.descripcionProducto ?? '',//'Harina Pan de Maíz Blanco Precocida 500g',
                        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        maxLines: 4,
                        presetFontSizes: const [14, 12, 10, 8, 6],
                      ),
                    ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
