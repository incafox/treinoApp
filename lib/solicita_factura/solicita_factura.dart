import 'package:flutter/material.dart';

class SolicitaFactura extends StatefulWidget {
  @override
  _SolicitaFacturaState createState() => _SolicitaFacturaState();
}

class _SolicitaFacturaState extends State<SolicitaFactura> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text("Solicitar Factura"),
              TextFormField(
                // controller: this.correoController,
                decoration: InputDecoration(hintText: "Correo electronico"),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                //controller: this.correoController,
                decoration: InputDecoration(hintText: "Correo electronico"),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Text("""Para solicitar tu factura del pago
                efectuado en el mes actual, por favor
                envíanos la siguiente información:
                """),
              RaisedButton(
                  child: Text(
                    "Solicitar",
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(28.0),
                      side: BorderSide(color: Color(0xbf0781e5))),
                  color: Color(0xbf0781e5),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Register()),
                    // );
                    print("probando");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
