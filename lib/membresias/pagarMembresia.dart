import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treino/Mainmenu/MainMenu.dart';
import 'package:treino/states/buyMembresias.dart';

class PagarMembresia extends StatefulWidget {
  @override
  _PagarMembresiaState createState() => _PagarMembresiaState();
}

class _PagarMembresiaState extends State<PagarMembresia> {
  TextEditingController idMembresia = TextEditingController();
  TextEditingController idCliente = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagar"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Text("Mensualidad : \$1,000")),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    TextFormField(
                      // controller: this.correoController,
                      decoration: InputDecoration(hintText: "Cupon"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    // Add TextFormFields and RaisedButton here.
                  ])),
            ),
            RaisedButton(
                child: Text(
                  "Aplicar cupon",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(28.0),
                    side: BorderSide(color: Colors.lightGreen)),
                color: Colors.lightGreen,
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => MainMenu()),
                  // );
                  print("probando");
                }),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    TextFormField(
                      // controller: this.correoController,
                      decoration:
                          InputDecoration(hintText: "Nombre de titular"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      // controller: this.correoController,
                      decoration:
                          InputDecoration(hintText: "Numero de tarjeta"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      // controller: this.correoController,
                      decoration:
                          InputDecoration(hintText: "Fecha de vencimiento"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      // controller: this.correoController,
                      decoration:
                          InputDecoration(hintText: "Numero de seguridad"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),

                    // Add TextFormFields and RaisedButton here.
                  ])),
            ),
            RaisedButton(
                child: Text(
                  "Comprar Membresia",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(28.0),
                    side: BorderSide(color: Colors.blue)),
                color: Colors.blue,
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => MainMenu()),
                  // );
                  print("comprando");
                  this.comprarMembresia(
                      context: context,
                      idCliente: this.idCliente.text,
                      idMembresia: this.idMembresia.text);
                })
          ],
        ),
      ),
    );
  }

  void comprarMembresia(
      {BuildContext context, String idMembresia, String idCliente}) async {
    // context.bloc<ComprarMembresiasCubit>().idMembresiaSelected = idMembresia;
    // context.bloc<ComprarMembresiasCubit>().idCliente = idCliente;
    await context.bloc<ComprarMembresiasCubit>().comprarMembresia(
        context.bloc<ComprarMembresiasCubit>().idCliente,
        context.bloc<ComprarMembresiasCubit>().idMembresiaSelected);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainMenu()),
    );
  }
}
