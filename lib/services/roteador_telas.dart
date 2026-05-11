import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RouterScreen extends StatelessWidget {
  const RouterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ///ao inves de ter Scarffold que é o default teremos STREAMBUILDER
    /// O 1º Paramentro. O StreamBuider receberá algo para vigiar em nosso caso o FirebaseAuth onde ficaremos com as mudanças de User.
    /// Ou seja caso haja, ele nos retornará.
    /// o Segundo parametro é para construir algo, ou Builder onde recebe mais 2 paramentros
    return const StreamBuilder(stream: FirebaseAuth.instance.userChanges(), builder: builder);
  }
}