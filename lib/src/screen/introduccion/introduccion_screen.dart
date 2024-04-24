import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:test_flutter_angel_valdiviezo/environments/environments.dart';
/*

Fuentes objFuentesSplash = Fuentes();

*/

CadenaConexion objCadConIntroduccionScreen = CadenaConexion();
ColoresApp objColoresAppSplash = ColoresApp();

class IntroduccionScreen extends StatefulWidget {

  //ignore: use_super_parameters
  const IntroduccionScreen({
    Key? key,
  }) : super(key: key);

  static const String routerName = 'IntroduccionScreen';
  @override
  IntroduccionScreenState createState() => IntroduccionScreenState();

}

class IntroduccionScreenState extends State<IntroduccionScreen>{

  @override
  void initState() {
    /*
    if(Platform.isAndroid) {
      FlutterBranchSdk.initSession().listen((data) {
        if (data.containsValue('https://enrolapp.app.link/NdJ6nFzRbK?bnc_validate=true')) {
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(builder: (context) => GenialPrevioInicioScreen(null,varObjProspectoBuscaCorreo)),
          );
        }
        if (data.containsValue('https://enrolapp.app.link/NdJ6nFzRbK?bnc_validate=false')) {
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(builder: (context) => ErrorSuscripcionScreen(null,varObjProspectoBuscaCorreo)),
          );
        }
      }, onError: (_) {
        //PlatformException platformException = error as PlatformException;
      });
    
    }
    */
    super.initState();
  }

  List<Widget> renderLstCustomTabs(){
    final sizeScreenLst = MediaQuery.of(context).size;
    List<Widget> lstTabs = [
      Container(
        width: sizeScreenLst.width, 
        height: sizeScreenLst.height, 
        decoration: const BoxDecoration(
          image: DecorationImage(
             image: AssetImage('assets/SplBnv1.png'),
             fit: BoxFit.fill
          ),
        ),
        child: Column(
          children: <Widget>[
            //const SizedBox(height: 22,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    const Text(''),
                    MaterialButton(
                      shape: const CircleBorder(),
                      disabledColor: Colors.white,
                      elevation: 0,
                      color: Colors.transparent,
                      child: Container(color: Colors.transparent, child: const Icon(Icons.close,color: Colors.white,size: 30,),),
                      onPressed: () => exit(0), 
                    ),
                ],
            ),
          
            Container(
              color: Colors.transparent,
              width: sizeScreenLst.width * 0.75,
              height: sizeScreenLst.height * 0.2,
            ),

            Container(
              color: Colors.transparent,
              alignment: Alignment.bottomCenter,
              width: sizeScreenLst.width * 0.78,
              height: sizeScreenLst.height * 0.2,
              child: Center(
                child: AutoSizeText(
                  
                  '¡Hola!',
                  style: TextStyle(color: objColoresAppSplash.naranjaDisruptive,),
                  
                  presetFontSizes: const [84,82,80,78,76,74,72,70,68,66,64,62,60,58,56,54,52,50,48,46,44,42,40,38,36,34,32,30,28,26,24,22,20,18,16,14,12,10,8],
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              width: sizeScreenLst.width * 0.63,
              height: sizeScreenLst.height * 0.1,
              child: const Center(
                child: AutoSizeText(
                  'Estás a un paso de vivir la experiencia',
                  style: TextStyle(color: Colors.white),
                  presetFontSizes: [36,34,32,30,28,26,24,22,20,18,16,14,12,10,8],
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),


            Container(
              color: Colors.transparent,
              height: sizeScreenLst.height * 0.2,
              child: Row(
                children: [
                  Expanded(
                    child:  

                    CachedNetworkImage(
                      height: sizeScreenLst.height * 0.1,//70,
                      width: sizeScreenLst.width * 0.15,//80,
                      placeholder: (context,url) =>
                        Image.asset("assets/loadingEnrolApp.gif",
                          height: 40.0,
                          width: sizeScreenLst.width * 0.2,
                        ),
                        imageUrl: '${objCadConIntroduccionScreen.endPointImagenes}IcEnRolApp.png',
                        fadeInCurve: Curves.bounceIn,
                        errorWidget: ((context,error,stackTrace) {
                          return Container(
                            color: Colors.transparent,
                            child: Image.asset('assets/no-image.jpg'),
                          );
                        }
                      ),
                    ),
                        
            
            
                  ),
                ],
              ),
            ),


          ]
        ),
      ),
      
      Container(
        width: sizeScreenLst.width, 
        height: sizeScreenLst.height,
        //child: Image.asset('assets/SplBnv2.png',matchTextDirection: true,height: 60,),
        decoration: const BoxDecoration(
          image: DecorationImage(
             image: AssetImage('assets/SplBnv2.png'),
             fit: BoxFit.fill
          ),
        ),
        child: Column(
          children: <Widget>[
            
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    const Text(''),
                    MaterialButton(
                      shape: const CircleBorder(),
                      disabledColor: Colors.white,
                      elevation: 0,
                      color: Colors.transparent,
                      child: Container(color: Colors.transparent, child: const Icon(Icons.close,color: Colors.white,size: 30,),),
                      onPressed: () => exit(0), 
                    ),
                ],
            ),
            
            
            Container(
              color: Colors.transparent,
              width: sizeScreenLst.width * 0.75,
              height: sizeScreenLst.height * 0.28,
            ),
            
            Container(
              color: Colors.transparent,
              width: sizeScreenLst.width * 0.58,
              height: sizeScreenLst.height * 0.45,
              alignment: Alignment.topCenter,
              child: RichText(
                maxLines: 15,
                softWrap: true,
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Recuerda que',
                  style: TextStyle(color: objColoresAppSplash.naranjaDisruptive, fontSize: 26,),
                  children: <TextSpan>[
                    const TextSpan(text: ' para suscribirte al servicio debes ser', style: TextStyle(color: Colors.white, fontSize: 26,)),
                    TextSpan(text: ' autorizado',style: TextStyle(color: objColoresAppSplash.naranjaDisruptive, fontSize: 26)),
                    const TextSpan(text: ' por tu empleador o familiar',style: TextStyle(color: Colors.white, fontSize: 26)),
                  ],
                ),
              )
            ),


          ]
        ),
      ),
      
      Container(
        width: sizeScreenLst.width, 
        height: sizeScreenLst.height,
        //child: Image.asset('assets/SplBnv3.png',matchTextDirection: true,height: 60,),
        decoration: const BoxDecoration(
          image: DecorationImage(
             image: AssetImage('assets/SplBnv3.png'),
             fit: BoxFit.fill
          ),
        ),
        child: Column(
          children: <Widget>[ 
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    const Text(''),
                    MaterialButton(
                      shape: const CircleBorder(),
                      disabledColor: Colors.white,
                      elevation: 0,
                      color: Colors.transparent,
                      child: Container(color: Colors.transparent, child: const Icon(Icons.close,color: Colors.white,size: 30,),),
                      onPressed: () => exit(0), 
                    ),
                ],
            ),
            
            SizedBox(height: sizeScreenLst.height * 0.03,),//30,),

            Container(
              color: Colors.transparent,
              alignment: Alignment.bottomCenter,
              width: sizeScreenLst.width * 0.55,
              height: sizeScreenLst.height * 0.21,
              child: const Center(
                child: AutoSizeText(
                  '',
                  style: TextStyle(color: Colors.transparent),
                  presetFontSizes: [24,22,20,18,16,14,12,10,8],
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            Container(
              color: Colors.transparent,
              alignment: Alignment.bottomCenter,
              width: sizeScreenLst.width * 0.86,
              height: sizeScreenLst.height * 0.125,
              child: const AutoSizeText(
                'Suscríbete y descubre la nueva experiencia',
                style: TextStyle(color: Colors.white),
                presetFontSizes: [26,24,22,20,18,16,14,12,10,8],
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            
            SizedBox(height: sizeScreenLst.height * 0.03,),//30,),

            Container(
              color: Colors.transparent,
              height: sizeScreenLst.height * 0.2,
              child: Row(
                children: [
                  Expanded(
                    child: 
             
                    CachedNetworkImage(
                      height: sizeScreenLst.height * 0.1,//70,
                      width: sizeScreenLst.width * 0.15,//80,
                      placeholder: (context,url) =>
                        Image.asset("assets/loadingEnrolApp.gif",
                          height: 40.0,
                          width: sizeScreenLst.width * 0.2,
                        ),
                        imageUrl: '${objCadConIntroduccionScreen.endPointImagenes}IcEnRolApp.png',
                        fadeInCurve: Curves.bounceIn,
                        errorWidget: ((context,error,stackTrace) {
                          return Container(
                            color: Colors.transparent,
                            child: Image.asset('assets/no-image.jpg'),
                          );
                        }
                      ),
                    ),
                          
            
                  ),
                ],
              ),
            ),

            //const SizedBox(height: 30,),
            SizedBox(height: sizeScreenLst.height * 0.03,),//30,),

            Expanded(
                child: 
                  Center(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: sizeScreenLst.width * 0.8,
                          height: sizeScreenLst.height * 0.06,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(sizeScreenLst.width * 0.02)),
                            disabledColor: Colors.grey,
                            elevation: 10,
                            color: objColoresAppSplash.naranjaDisruptive,
                            child: Container( color: Colors.transparent, child: const Text('QUIERO SUSCRIBIRME',style: TextStyle(color: Colors.white, fontSize: 13))),
                            onPressed: () {
                              /*
                              Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(builder: (context) => const TipoSuscriptorScreen()),
                              );
                              */
                            }
                          ),
                        ),

                        SizedBox(height: sizeScreenLst.height * 0.03,),

                        Container(
                          color: Colors.transparent,
                          width: sizeScreenLst.width * 0.95,
                          child: const Divider(
                            color: Colors.white60,
                          ),
                        ),
                        
                        SizedBox(height: sizeScreenLst.height * 0.015,),

                        Container(
                          width: sizeScreenLst.width * 0.8,
                          height: sizeScreenLst.height * 0.06,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: objColoresAppSplash.naranjaDisruptive,
                              width: sizeScreenLst.width * 0.004,
                              style: BorderStyle.solid
                            ),
                            borderRadius: BorderRadius.circular(sizeScreenLst.width * 0.02)
                          ),
                          child: GestureDetector(
                            onTap: () {
                              /*
                              Navigator.push(
                                context,
                                CupertinoPageRoute(builder: (context) => const AuthenticationScreen()),
                              );
                              */
                            },
                            child: Container(color: Colors.transparent, alignment: Alignment.center, child: const Text('INICIAR SESIÓN',style: TextStyle(color: Colors.white, fontSize: 13))),
                          )
                        ),
                        
                        SizedBox(height: sizeScreenLst.height * 0.03,),

                    ],
                  )
                ),
              ),

          ],
        ),
      ),
    ];

    return lstTabs;
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false,
        child: IntroSlider(
          /*
          autoScroll: true,
          backgroundColorAllSlides: Colors.black,
          */
          renderSkipBtn: const Text('', style: TextStyle(color:  Colors.black),),
          renderNextBtn: const Text('', style: TextStyle(color:  Colors.black),),
          renderDoneBtn: const Text('', style: TextStyle(color:  Colors.black)),
          /*
          colorDot: Colors.white,
          colorActiveDot: Colors.white,
          sizeDot: 8.0,
          typeDotAnimation: DotSliderAnimation.SIZE_TRANSITION,
          */
          listCustomTabs: renderLstCustomTabs(),
          scrollPhysics: const BouncingScrollPhysics(),
          //hideStatusBar: false,
          //onDonePress: ()=> print('navegar'),
        ),
      ),
    );
  }


}
