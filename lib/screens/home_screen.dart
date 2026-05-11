import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primeiro_projeto/models/hours.dart';

///esta tela será com dados mutáveis, por isto q temos que por StateFull
class HomeScreen extends StatefulWidget {
  final User? user;

  ///No construtor não precisa por o "=" e nem "{}"
  HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///teremos uma lista uma lista de Horas que virá do firebase
  List<Hours> listHours = [];

  ///teremos a instancia do firebase store
  FirebaseFirestore db = FirebaseFirestore.instance;

  ///teremos um @verride no metodo initState para depois mudar o comportamento do InitState
  @override
  void initState() {
    super.initState();

    ///temos q criar um setup do firebase aqui antes e depois
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///teremos um drawer
      drawer: Menu(user: widget.user),
      appBar: AppBar(title: Text("1º App de  Horas")),

      ///teremos o botão
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /***Temos que criar a função do botão */
        },

        ///colocaaremos um icone de adcionar
        child: Icon(Icons.add),
      ),

      ///temos umas uma propriedade  que e o corpo BODY onde passaremos a lista
      ///usaremos um ternario, para tela e ja faremos o css do texto.
      body: (listHours.isEmpty)
          ? const Center(
              child: Text(
                "Do not have Data\n.Lets register our Datatime",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView(
              padding: EdgeInsets.only(left: 4, right: 4),

              ///dentro desta lista temos  filhos, que recebem uma list do tipo generate e tamanho da list
              children: List.generate(listHours.length, (i) {
                Hours localHour = listHours[i];
              }),
            ),
    );
  }
}
