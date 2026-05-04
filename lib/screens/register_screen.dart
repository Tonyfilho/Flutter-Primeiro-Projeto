import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  /// criaremos 4 variasveis do tipo TestEditingController , onde temos os dados cadastrados
  final TextEditingController _emailControlle = TextEditingController();
  final TextEditingController _senhaControlle = TextEditingController();
  final TextEditingController _confirmaSenhaControlle = TextEditingController();
  final TextEditingController _nomeControlle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ///Criaremos a nossa tela
    ///1º Scaffold
    return Scaffold(
      ///2º o body
      body: Container(
        ///3º um background color
        color: Colors.blueAccent,

        ///4º um padding
        padding: EdgeInsets.all(16),

        ///5º o primeiro Filho
        child: Center(
          ///6º o segundo filho, uma coluna
          child: Column(
            ///7º teremos eixo neste caso
            mainAxisAlignment: MainAxisAlignment.center,

            /// 8º colocaremos outras colunas, ou melhor seus FILHOS
            children: [
              /// 9 º o 1º filho desta coluna será outro container
              Container(
                /// 10º  dentro deste container teremos o padding e outros css
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  /// 11º  A cor deste box, e o boderRadius
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),

                /// 12º Temos q criar um FILHO do nosso Container onde adicionaremos os campos do form
                child: Column(
                  /// 12ºA como temos 4 campos temos que ter m array de Filhos
                  children: [
                    FlutterLogo(size: 76),
                    SizedBox(height: 16),

                    /// 13º campos Nome, email, senha e consfirmaSenha e Decoration ou PlaceHolder
                    TextField(
                      controller: _nomeControlle,
                      decoration: InputDecoration(hintText: "Name"),
                    ),

                    /// 13º campo Nome e Decoration ou PlaceHolder
                    SizedBox(height: 16),
                    TextField(
                      controller: _emailControlle,
                      decoration: InputDecoration(hintText: "E-Mail"),
                    ),

                    /// 13º campo Nome e Decoration ou PlaceHolder
                    SizedBox(height: 16),
                    TextField(
                      obscureText: true,
                      controller: _senhaControlle,
                      decoration: InputDecoration(hintText: "Password"),
                    ),

                    /// 13º campo Nome e Decoration ou PlaceHolder
                    SizedBox(height: 16),
                    TextField(
                      obscureText: true,
                      controller: _confirmaSenhaControlle,
                      decoration: InputDecoration(hintText: "Confirm Password"),
                    ),
                     SizedBox(height: 16),
                     /// 14º criaremos o botãopara enviar o cadastro em forma de Widget
                     ElevatedButton(onPressed: (){
                      
                     }, child: Text("Register !!!")),
                     SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
