import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile_socket/App/store/socket_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final txtNome  = TextEditingController();
  final txtEmail = TextEditingController();

  final socketSotre = SocketStore();

  @override
  void initState() {
    socketSotre.connect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(socketSotre.isLoading ? "Conectando..." : "Chat com Socket.IO"),
          ),
          body: socketSotre.isLoading ?
          Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          ) : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: txtNome,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: txtEmail,
                  decoration: InputDecoration(
                    labelText: 'Mensagem',
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text("Enviar"),
                    onPressed: () {
                      socketSotre.sendSms(sms: "Nome: ${txtNome.text.trim()} | ${txtEmail.text.trim()}");
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: ListView(
                        children: socketSotre.data.map((e) => Text(e)).toList(),
                      )
                )
              ],
            ),
          ),
        );
      }
    );
  }
}