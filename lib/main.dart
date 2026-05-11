import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:primeiro_projeto/services/roteador_telas.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();///temos  por para funcionar firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      ///vamos mudar agora usaremos o firebase q direcionará qual tela devemos usar.
      ///com isto vamos criar um gerenciador de telas no lugar do LoginScren();
      ///Criaremos ums Stateless 
     /// home: LoginScreen(),
      home: RouterScreen(),
    );
  }
}
