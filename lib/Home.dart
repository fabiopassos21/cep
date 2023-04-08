import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

String resultado = "Resultado";
TextEditingController resultController = TextEditingController();
  recuperarCep() async {
        String cepDigitado = resultController.text;
        String url = "https://viacep.com.br/ws/${cepDigitado}/json/";
        http.Response response ;

        response = await http.get(url);
        Map<String,dynamic> retorno = json.decode (response.body);
        String logradouro = retorno ["logradouro"];
        String complemento = retorno ["bairro"];

        setState(() {
          resultado =" ${logradouro},${complemento}";
        });

        print(
          "Resposta: logradouro:  ${logradouro} complemento : ${complemento} "
        );

 // print ("resposta : " + response.statusCode.toString()  );
   //     print ("resposta : " + response.body );


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(
        title: Text("app de cep e tals"),
      ),

      body:Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            RaisedButton(onPressed: recuperarCep,child:
              Text("pressione aqui "),),
TextField(keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: "Coloque aqui o cep",labelStyle:
          TextStyle(
            fontSize: 10

          ),
          ),
  controller: resultController,
),

            Text(resultado),
          ],

        ),
      ),
    );
  }
}




