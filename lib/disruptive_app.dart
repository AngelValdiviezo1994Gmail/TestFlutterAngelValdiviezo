
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_angel_valdiviezo/src/principal_screen.dart';
import 'package:test_flutter_angel_valdiviezo/src/screen/screen.dart';

import '/src/widgets/widget.dart';

class DisruptiveApp extends StatefulWidget {

  //ignore: use_super_parameters 
  const DisruptiveApp({Key? key}) : super (key: key);

  @override
  State<DisruptiveApp> createState() => DisruptiveAppState();
}

class DisruptiveAppState extends State<DisruptiveApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

@override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProspectoTypeService('', ''),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => AutenticacionService(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => PagoService(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        builder: (varContext, varChild) {
            return MaxScaleTextWidget(
              max: 1.0,
              child: varChild,
            );
          },
          debugShowCheckedModeBanner: false,
          title: '',
          initialRoute: CheckAuthScreen.routerName,
          navigatorKey: navigatorKey,
          scaffoldMessengerKey: messengerKey,
          home: PrincipalScreen(),
          theme: ThemeData(
            primaryColor: Colors.black,
            appBarTheme: const AppBarTheme(
              color: Colors.black,
            ),
          ),
          routes: {
            /*
            AuthenticationScreen.routerName: (_) => const AuthenticationScreen(),
            AutenticacionErrorScreen.routerName: (_) => AutenticacionErrorScreen(null,'', '','',false,false,'',''),
            CheckAuthScreen.routerName: (_) => const CheckAuthScreen(),
            RegistroUsuarioScreen.routerName: (_) => RegistroUsuarioScreen(),
            ContraseniaScreen.routerName: (_) => ContraseniaScreen(correoUser: ''),
            HistorialCobroScreen.routerName: (_) => HistorialCobroScreen(),
            PagosFrmScreen.routerName: (_) => PagosFrmScreen(),
            */
          }
      ),
    );
  }
}