
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:test_flutter_angel_valdiviezo/environments/environments.dart';
import 'package:test_flutter_angel_valdiviezo/src/models/models.dart'; 

DigimonDetalleModel? objDigimon;
ColoresApp objColoresModals = ColoresApp();
int contadorGrdField = 0;

//ignore: must_be_immutable
class ModalDetalleDigimon extends StatelessWidget {
  
  DigimonDetalleModel? objDigimonTmp;

  ModalDetalleDigimon({Key? key, required objDigimonTmp}) : super(key: key) {
    
    if(objDigimonTmp != null) {
      objDigimon = objDigimonTmp;
      //contadorGrdField = objDigimon!.fields.length;
      if(objDigimon!.fields.length < 4) {
        contadorGrdField = objDigimon!.fields.length;
      } else {
        contadorGrdField = 4;
      }
    }

  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SimpleDialogOption(
      onPressed: (){},
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              color: Colors.transparent,
              height: size.height * 0.08,
              width: size.width * 0.8,
              alignment: Alignment.center,
              child: AutoSizeText(
                objDigimon?.name ?? '', 
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontFamily: 'Montserrat', fontWeight: FontWeight.bold, ),
                maxLines: 2,
                presetFontSizes: const [28,26,24,22,20,18,16,14,12,10],
                textAlign: TextAlign.center,
              )
            ),

            const SizedBox(height: 5,),

            Container(
              color: Colors.transparent,
              width: 190,
              height: 190,
              child: PinchZoom(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(objDigimon!.images[0].href),
                      fit: BoxFit.contain
                    ),
              
                    borderRadius: const BorderRadius.all(Radius.circular(350)),
                    border: Border.all(
                      width: 2,
                      color: objColoresModals.naranjaDisruptive,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
            ),
            
            SizedBox(height: size.height * 0.02,),

            Container(
              color: Colors.transparent,
              height: size.height * 0.09,
              width: size.width * 0.88,
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.15,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          'Nivel',
                          style: TextStyle(color: objColoresModals.naranjaDisruptive,fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                          maxLines: 2,
                          presetFontSizes: const [16,14,12,10],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: size.width * 0.15,
                        color: Colors.transparent,
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          'Atributo',
                          style: TextStyle(color: objColoresModals.naranjaDisruptive,fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                          maxLines: 2,
                          presetFontSizes: const [16,14,12,10],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: size.width * 0.15,
                        color: Colors.transparent,
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          'Type',
                          style: TextStyle(color: objColoresModals.naranjaDisruptive,fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                          maxLines: 2,
                          presetFontSizes: const [16,14,12,10],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        width: size.width * 0.15,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          objDigimon != null && objDigimon!.levels.length > 0 ? '${objDigimon?.levels[0].level}' : '---------',
                          style: TextStyle(color: Colors.black,fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                          maxLines: 2,
                          presetFontSizes: const [16,14,12,10],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      
                      Container(
                        width: size.width * 0.17,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          objDigimon != null && objDigimon!.attributes.length > 0 ? '${objDigimon?.attributes[0].attribute}' : '---------',
                          style: const TextStyle(color: Colors.black,fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                          maxLines: 2,
                          presetFontSizes: const [16,14,12,10],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      
                      Container(
                        width: size.width * 0.18,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          objDigimon != null && objDigimon!.types.length > 0 ? '${objDigimon?.types[0].type}' : '---------',
                          style: const TextStyle(color: Colors.black,fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                          maxLines: 2,
                          presetFontSizes: const [16,14,12,10],
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ],
                  ),
                
                ],
              )
            ),

            SizedBox(height: size.height * 0.02,),

            if(objDigimon != null && objDigimon!.fields.length > 0)
            Container(
              color: Colors.transparent,
              height: size.height * 0.18,
              width: size.width * 0.95,
              alignment: Alignment.center,              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  

                  AutoSizeText(
                    'Fields',
                    style: TextStyle(color: objColoresModals.naranjaDisruptive,fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                    maxLines: 2,
                    presetFontSizes: const [16,14,12,10],
                    textAlign: TextAlign.center,
                  ),
                  
                  /*
                  Container(
                    width: size.width * 0.65,
                    height: size.height * 0.08,
                    color: Colors.transparent,
                    child: GridView.custom(
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount:  contadorGrdField,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,                                    
                        repeatPattern: QuiltedGridRepeatPattern.same,
                        pattern: const [
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 2),
                    
                                    ],
                                  ),
                                  childrenDelegate: SliverChildBuilderDelegate(
                                    (context, index) => DigimonField(null,objDigimon!.fields[index]),
                                    childCount: objDigimon!.fields.length
                                  ),
                                ),
                  ),
                  */
          
                  Container(
                    width: size.width * 0.65,
                    height: size.height * 0.09,
                    color: Colors.transparent,
                    child: AlignedGridView.count(
                      crossAxisCount: contadorGrdField,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      itemBuilder: (context, index) {
                        return DigimonField(null,objDigimon!.fields[index]);
                      },
                    ),
                  )
                  
                ],
              )
            ),

          ],
        )
      ),
    );
  }
}


//ignore: must_be_immutable
class DigimonField extends StatelessWidget {
  Field? objPrd;

  DigimonField(Key? key, Field objPrdct) : super (key: key){
    objPrd = objPrdct;
  }

  @override
  Widget build(BuildContext context) {
    //final GlobalKey<FormFieldState> keyCantidadProductos = GlobalKey<FormFieldState>();
    final sizeGrd = MediaQuery.of(context).size;

    return Container(
      width: sizeGrd.width * 0.1,
      height: sizeGrd.height * 0.09,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      
        child: Container(
          color: Colors.transparent,
          width: sizeGrd.width * 0.1,
          height: sizeGrd.height * 0.09,
          child: Center(
            child: Column(
              children: [

                Container(
                  color: Colors.transparent,
                  width: sizeGrd.width * 0.1,
                  height: sizeGrd.height * 0.05,
                  child: GestureDetector(
                    onTap: () async {
                    
                    },
                    child: Container(
                      color: Colors.transparent,
                      width: sizeGrd.width * 0.1,
                      height: sizeGrd.height * 0.07,
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
                    
                AutoSizeText(
                    objPrd!.field,
                    style: const TextStyle(color: Colors.black,fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                    maxLines: 1,
                    presetFontSizes: const [16,14,12,10],
                    textAlign: TextAlign.center,
                  ),
                
              ],
            ),
          ),
        ),
      
    );
  }
}
