import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_angel_valdiviezo/bloc/bloc.dart';
import 'package:test_flutter_angel_valdiviezo/disruptive_app.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationBloc()),
      ],
      child: const DisruptiveApp()
    )
  );
}
