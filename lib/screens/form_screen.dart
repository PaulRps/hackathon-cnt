import 'package:flutter/material.dart';
import 'package:hackathon_cnt/widgets/session_item.dart';

class FormScreen extends StatefulWidget {
  static const routeName = "/form";

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String var1 = '1';
  String var2 = '1';
  String var3 = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(
        children: [
          SessionItem(
              title: '1.1 Tipo de Via',
              options: [
                SessionItemOption('1', 'Pista dupla com canteiro central'),
                SessionItemOption('2', 'Pista dupla com barreira central'),
                SessionItemOption('3', 'Pista dupla com faixa central'),
                SessionItemOption('4', 'Pista simples mão única'),
                SessionItemOption('5', 'Pista simples de mão dupla'),
              ],
              onChange: (value) {
                setState(() {
                  this.var1 = value;
                });
              },
              groupValue: this.var1),
          SessionItem(
              title: '1.2 Perfil da Rodovia',
              options: [
                SessionItemOption('1', 'Plano'),
                SessionItemOption('2', 'Ondulado'),
              ],
              onChange: (value) {
                setState(() {
                  this.var2 = value;
                });
              },
              groupValue: this.var2),
          SessionItem(
              title: '2.3 Ponto Crítico (foto obrigratória)',
              options: [
                SessionItemOption('1', 'Não possui'),
                SessionItemOption('2', 'Ponte caída'),
                // SessionItemOption('3', 'Erosão da pista'),
                // SessionItemOption('4', 'Buraco grande'),
                // SessionItemOption('5', 'Passagem em nível'),
                // SessionItemOption('6', 'Obra no pavimento'),
                SessionItemOption('7', 'Balança em operação'),
                SessionItemOption('8', 'Outro(s) (identificar em Comentários)'),
              ],
              onChange: (value) {
                setState(() {
                  this.var3 = value;
                });
              },
              groupValue: this.var3)
        ],
      ),
    );
  }
}
