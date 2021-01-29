import 'package:client/controllers/order_controller.dart';
import 'package:client/models/order_model.dart';
import 'package:client/pages/home_page.dart';
import 'package:client/utils/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_masked_text/flutter_masked_text.dart';

class NewOrderPage extends StatefulWidget {
  @override
  _NewOrderPageState createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {
  final _formKey = GlobalKey<FormState>();
  // final _priceController = TextEditingController();
  final _priceController =
      MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',');
  final _descriptionController = TextEditingController();
  final _idController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    initialValues();
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
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    // 'Ordens de Serviço',
                    'Nova Ordem de Serviço',
                    textAlign: TextAlign.left,
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
              ],
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
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(
                    Icons.handyman,
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
                        // DropdownButton<String>(
                        //   hint: Text("Cliente"),
                        //   isExpanded: true,
                        //   underline: Container(
                        //     height: 2,
                        //     color: Colors.grey[350],
                        //   ),
                        //   value: _typeText,
                        //   onChanged: (String newValue) {
                        //     setState(() {
                        //       _typeText = newValue;
                        //     });
                        //   },
                        //   items: <String>[
                        //     'Legume',
                        //     'Fruta',
                        //     'Mel',
                        //     'Pão',
                        //     'Ovos',
                        //     'Queijo',
                        //     'Doce',
                        //   ].map<DropdownMenuItem<String>>((String value) {
                        //     return DropdownMenuItem<String>(
                        //       value: value,
                        //       child: Text(value),
                        //     );
                        //   }).toList(),
                        // ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: _idController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "ID Cliente",
                            filled: true,
                            fillColor: Colors.grey[800],
                            labelStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (text) {
                            if (text.isEmpty) {
                              return "Id inválido";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: _descriptionController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Descrição",
                            filled: true,
                            fillColor: Colors.grey[800],
                            labelStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (text) {
                            if (text.isEmpty) {
                              return "Descrição inválida";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: _priceController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Preço",
                            filled: true,
                            fillColor: Colors.grey[800],
                            labelStyle: TextStyle(color: Colors.grey),
                          ),
                          onChanged: (text) {},
                          validator: (text) {
                            if (text.isEmpty) {
                              return "Preço inválido";
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
                            "Criar".toUpperCase(),
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            // Order order = Order();
                            final descricao = _descriptionController.text;
                            final preco = double.parse(_priceController.text);
                            final id = int.parse(_idController.text);
                            // print(id.toString() + preco.toString() + descricao);
                            OrderController orderController = OrderController();

                            orderController.add(descricao, preco, id);
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

  void initialValues() {
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
    // _descriptionController.text = UserModel.of(context).userData['name'];
  }
}
