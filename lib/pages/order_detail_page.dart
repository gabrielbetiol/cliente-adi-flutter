import 'package:client/controllers/order_controller.dart';
import 'package:client/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final Order ordem;

  DetailPage(this.ordem);

  // final controller = OrderController();

  @override
  Widget build(BuildContext context) {
    String dataAberturaFormatada = _dataFormatada(ordem.dataAbertura);
    String dataFinalizacaoFormatada = _dataFormatada(ordem.dataFinalizacao);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey[50],
//         iconTheme: IconThemeData(color: Colors.grey),
//         elevation: 0,
//       ),
//       body: Container(

//       ),
//     );
//   }
// }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: <Widget>[
                Text(
                  ordem.descricao.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'Prompt-ExtraLight',
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent lacinia, odio ut placerat finibus, ipsum risus consectetur ligula, non mattis mi neque ac mi."),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 50,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.event),
                            SizedBox(
                              width: 8.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "data abertura",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                Text(dataAberturaFormatada),
                              ],
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.event_available),
                            SizedBox(
                              width: 8.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "data finalização",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                Text(dataFinalizacaoFormatada),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Comentários:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent lacinia, odio ut placerat finibus, ipsum risus consectetur ligula, non mattis mi neque ac mi."),
                  ordem.preco,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent lacinia, odio ut placerat finibus, ipsum risus consectetur ligula, non mattis mi neque ac mi."),
                  ordem.status,
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('finalizar'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _dataFormatada(String dataEntr) {
    if (dataEntr != null) {
      DateTime dateAbertura = DateTime.parse(dataEntr);
      DateFormat dateFormat = DateFormat("dd/MM/yyyy");
      String formattedDate = dateFormat.format(dateAbertura);
      return formattedDate;
    }
    return '--';
    // Convertendo a string de data pra DateTime e alterando o formato de exibição
  }
}
