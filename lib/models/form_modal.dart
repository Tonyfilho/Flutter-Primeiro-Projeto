import 'package:flutter/material.dart';
import 'package:primeiro_projeto/helpers/hour_helpers.dart';
import 'package:primeiro_projeto/models/hours.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormModal extends StatelessWidget {
  FormModal({super.key});

  ///este metodo será usado para cadastrar e para editar
  String _title = "Add";
  String _confirmationButton = "Save";
  String _skipButton = "Cancel";

  ///usaremos os controladores e temos q instalar este plugins
  /// flutter pub add mask_text_input_formatter

  /// começaremos fazendo o form
  TextEditingController _dataController = TextEditingController();

  ///criaremos a primeira mascara
  final dataMaskFormatter = MaskTextInputFormatter(mask: '##/##/####');

  TextEditingController _minutesController = TextEditingController();

  ///criando a segunda mascara
  final minutesMaskFormatter = MaskTextInputFormatter(mask: '##/##');

  TextEditingController _descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  ///Metodo ShowFormModel
  void showFormModal({Hours? model, BuildContext? context}) {
    ///faremos as verificações
    if (model != null) {
      _title = "Edit";
      _dataController.text = model.data;
      _minutesController.text = HourHelpers.minutesToHours(model.minutos);

      ///apesar de fazer a verificação mesmo assim temos que usar "!"
      if (model.descricao != null) {
        _descricaoController.text = model.descricao!;
      }
      // _confirmationButton = "Update";
      // _skipButton = "Quit";
    }
    ///nosso modal com borderRadio Circular 
    ///sempre temos que adicionar o contexto que é contexto que diz onde tem que mostrar o item o item na tela.
       ///aqui verificaremos o tamnho da tela e devolveremos um Container()
          /// o contexto vai buscar todas as informação da tela , ex tamanho, espaço etc.
    showModalBottomSheet(context: context!, shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24)),), builder: (context)  {
        return Container(
          ///of(context) pega o tamnho da tela com base no contexto
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(32),
          ///temos criar um child onde startarmos o ListView onde formataremos e mostraremos como deve ser digitado pelo user no form
          child: ListView(
            children: [
              ///aqui termos uma lista de campos 
              ///teremos o texto com tilulo e  contexto
              Text(_title, style: Theme.of(context).textTheme.headlineSmall,),
              ///aqui teremos os outros campos do form
              TextFormField()
               
            ],
          ) ,

        );
    },);

   


  }
}
