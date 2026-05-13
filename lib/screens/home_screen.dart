import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primeiro_projeto/components/menu.dart';
import 'package:primeiro_projeto/helpers/hour_helpers.dart';
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
    ///aqui será a parte do User q vem do firebase
    return Scaffold(
      ///teremos um drawer que recebe um menu
      drawer: Menu(user: widget.user!),
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
                Hours model = listHours[i];

                ///fazer com que quando passe o dedo e arraste exclui
                ///a chave vamos pegar do Horas
                ///Uma direção de exlusão do final para começo
                ///um background container para ficar no fundo do icone, quando estivermos exluindo algo, o fundo será este container
                return Dismissible(
                  key: ValueKey<Hours>(model),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    ///aqui temos um alinhamento
                    alignment: Alignment.centerRight,

                    ///adcionaremos um padding
                    padding: const EdgeInsets.only(right: 12),

                    ///teremos uma cor
                    color: Colors.red,

                    /// teremos um child onde colocaremos  icone de uma delete
                    child: Icon(Icons.delete, color: Colors.white),
                  ),

                  ///em nosso ondismissed termos q por uma direção
                  onDismissed: (direction) {
                    ///remove será um função criada para remover do firestorage
                    remove(model);
                  },

                  ///este child será um cards
                  child: Card(
                    elevation: 2,

                    ///o filho será uma coluna
                    child: Column(
                      ///aqui dentro teremos varios filho, varias linhas ou campos
                      ///quando temos um card temos algumas propriedades
                      children: [
                        ListTile(
                          ///uma das propriedades é LONGPRESS , quando ficarmos precionado teremos um EVENTO de click
                          onLongPress: () {
                            ///neste caso vamos mostrar uns itens
                            ///criaremos uma função para destar algo na tela
                            
                          },
                          ///teremos outro evento de clicar na TELA e na lista 
                          onTap: () {

                          },
                          ///leading é para ficcar algo ao lado da coluna, como se fosse um icone
                          leading: Icon(Icons.list_alt_rounded, size:56 ,),
                          ///colocaremos um texto no meu do card
                          ///com data e hora usando a classe helpers
                          title: Text("Date: ${model.data} Hours: ${HourHelpers.minutesToHours(model.minutos)}"),
                          ///aqui na parte de baixo teremos o Subtitle
                          subtitle: Text(model.descricao ?? 'Not Data'),
                        ),
                      ],
                    ),
                  ),
                );

                ///temos o Ondimissible
              }),
            ),
    );
  }
void remove(Hours model) {
  ///falta implementar o firestorage aqui no remove
}
}

