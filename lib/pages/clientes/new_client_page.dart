import 'package:client/models/client_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import 'package:client/controllers/home_controller.dart';
import 'package:client/controllers/order_controller.dart';
import 'package:client/models/order_model.dart';
import 'package:client/pages/home_page.dart';
import 'package:client/utils/app_routes.dart';

class NewClientPage extends StatefulWidget {
  Client client;
  String title;
  NewClientPage({Key key, this.title = "Adicionar Cliente", this.client})
      : super(key: key);
  @override
  _NewClientPageState createState() => _NewClientPageState();
}

class _NewClientPageState extends State<NewClientPage> {
  final _formKey = GlobalKey<FormState>();
  // final _phoneController = TextEditingController();
  final _phoneController = TextEditingController();
  final _mailController = TextEditingController();
  final _nomeController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isEdition = false;

  @override
  void initState() {
    super.initState();
    if (widget.client != null) {
      initialValues(widget.client);
      isEdition = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 33, 33, 1),
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          elevation: 2,
          centerTitle: true,
          backgroundColor: Color.fromRGBO(33, 33, 33, 1),
          title: Padding(
            padding: EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
            child: Text(
              // 'Adicionar Cliente',
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                letterSpacing: 0.27,
                // color: Colors.grey[800],
                color: Colors.white,
                fontFamily: 'Prompt',
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.blueAccent),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(
                    isEdition ? Icons.person : Icons.person_add_alt_1,
                    size: 110,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _nomeController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Nome",
                            filled: true,
                            fillColor: Colors.grey[800],
                            labelStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (text) {
                            if (text.isEmpty) {
                              return "Nome inválido";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: _mailController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "E-mail",
                            filled: true,
                            fillColor: Colors.grey[800],
                            labelStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (text) {
                            if (text.isEmpty) {
                              return "E-mail inválido";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            MaskedInputFormater('(##) #####-####')
                          ],
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Telefone",
                            filled: true,
                            fillColor: Colors.grey[800],
                            labelStyle: TextStyle(color: Colors.grey),
                          ),
                          onChanged: (text) {},
                          validator: (text) {
                            if (text.isEmpty) {
                              return "Telefone inválido";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                      height: 50,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        textColor: Colors.white,
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Confirmar".toUpperCase(),
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            // Order order = Order();
                            final mail = _mailController.text;
                            final phone = _phoneController.text;
                            final nome = _nomeController.text;
                            print(mail + phone + nome);

                            HomeController homeController = HomeController();

                            if (isEdition) {
                              homeController.editClient(
                                  mail, phone, nome, widget.client.id);
                              Navigator.pop(context);
                            } else {
                              homeController.addClient(mail, phone, nome);
                            }
                            // Navigator.popAndPushNamed(context, 'HOME')
                            //     .then((value) {
                            //   setState(() {
                            //     // refresh state
                            //   });
                            // });
                            Navigator.pop(context);
                          }
                        },
                      )),
                ],
              )),
        ),

        // }
      ),
    );
  }

  void initialValues(Client client) {
    // Timestamp timestamp = UserModel.of(context).userData['birth'];
    // print(UserModel.of(context).userData['birth'].toString());
    // DateTime date =
    //     DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
    // _cepController.text = UserModel.of(context).userData['cep'];
    // _adressController.text = UserModel.of(context).userData['adress'];
    // _adressComplementController.text =
    //     UserModel.of(context).userData['adress_complement'];
    // _birthController.text = formatDate(date, [dd, '/', mm, '/', yyyy]);
    // //_genderText = UserModel.of(context).userData['gender'];
    // _mailController.text = UserModel.of(context).userData['name'];
    _mailController.text = client.email;
    _phoneController.text = client.telefone;
    _nomeController.text = client.nome;
  }
}
