import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_cnt/widgets/coordinates_form_field.dart';
import 'package:hackathon_cnt/widgets/picture_form_field.dart';
import 'package:hackathon_cnt/widgets/radio_form_field.dart';

class HighwayFormScreenArgs {
  final String id;
  final String highwayName;

  HighwayFormScreenArgs({@required this.id, @required this.highwayName});
}

class HighwayFormScreen extends StatefulWidget {
  static const routeName = "/highway-form";

  @override
  _HighwayFormScreenState createState() => _HighwayFormScreenState();
}

class _HighwayFormScreenState extends State<HighwayFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _highwayType;
  String _highwayProfile;
  String _criticalLocation;
  String _criticalLocationPicture;

  _submit() {
    final HighwayFormScreenArgs args =
        ModalRoute.of(context).settings.arguments;
    CollectionReference highways =
        FirebaseFirestore.instance.collection('highways');

    highways.doc(args.id).update({
      'highwayType': _highwayType,
      'highwayProfile': _highwayProfile,
      'criticalLocation': _criticalLocation,
      'criticalLocationPicture': _criticalLocationPicture,
    });
  }

  @override
  Widget build(BuildContext context) {
    final HighwayFormScreenArgs args =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text('Rota ${args.highwayName}')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: CoordinatesFormField(),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Geometria da via',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              RadioFormField(
                title: 'Tipo de Via',
                value: _highwayType,
                options: [
                  RadioOption(
                    label: 'Pista dupla com canteiro central',
                    value: "pista_dupla_com_canteiro_central",
                  ),
                  RadioOption(
                    label: 'Pista dupla com barreira central',
                    value: "pista_dupla_com_barreira_central",
                  ),
                  RadioOption(
                    label: 'Pista dupla com faixa central',
                    value: "pista_dupla_com_faixa_central",
                  ),
                  RadioOption(
                    label: 'Pista simples mão única',
                    value: "pista_simples_mão_única",
                  ),
                  RadioOption(
                    label: 'Pista simples de mão dupla',
                    value: "pista_simples_de_mão_dupla",
                  ),
                ],
                onChange: (value) {
                  setState(() {
                    _highwayType = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              RadioFormField(
                title: 'Perfil da Rodovia',
                value: _highwayProfile,
                options: [
                  RadioOption(
                    label: 'Plano',
                    value: "plano",
                  ),
                  RadioOption(
                    label: 'Ondulado',
                    value: "ondulado",
                  ),
                ],
                onChange: (value) {
                  setState(() {
                    _highwayProfile = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Pavimento',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              RadioFormField(
                title: 'Ponto Crítico',
                value: _criticalLocation,
                options: [
                  RadioOption(
                    label: 'Não possui',
                    value: "não_possui",
                  ),
                  RadioOption(
                    label: 'Erosão da pista',
                    value: "erosão_da_pista",
                  ),
                  RadioOption(
                    label: 'Buraco grande',
                    value: "buraco_grande",
                  ),
                  RadioOption(
                    label: 'Passagem em nível',
                    value: "passagem_em_nível",
                  ),
                  RadioOption(
                    label: 'Obra no pavimento',
                    value: "obra_no_pavimento",
                  ),
                  RadioOption(
                    label: 'Balança em operação',
                    value: "balança_em_operação",
                  ),
                  RadioOption(
                    label: 'Outro(s)',
                    value: "outros",
                  ),
                ],
                onChange: (value) {
                  setState(() {
                    _criticalLocation = value;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0),
                child: PictureFormField(
                  onChange: (image) {
                    setState(() {
                      _criticalLocationPicture = image;
                    });
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                width: double.infinity,
                height: 50,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('Finalizar'),
                  onPressed: () {
                    _submit();
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
