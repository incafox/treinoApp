import 'package:flutter/material.dart';
import 'package:treino/states/solicitarfactura.dart';

class SolicitaFactura extends StatefulWidget {
  @override
  _SolicitaFacturaState createState() => _SolicitaFacturaState();
}

class _SolicitaFacturaState extends State<SolicitaFactura> {
  
  TextEditingController email = TextEditingController();
  TextEditingController razonSocial = TextEditingController();
  TextEditingController rfc = TextEditingController();
  TextEditingController ciudad = TextEditingController();
  TextEditingController colonia = TextEditingController();
  TextEditingController direccion = TextEditingController();
  TextEditingController cp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) =>
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                 decoration: BoxDecoration(
                   gradient: LinearGradient(
                     begin: Alignment.centerLeft,
                     end: Alignment.centerRight,
                     stops: [0.2, 0.8],
                     colors: [Colors.greenAccent, Colors.blueAccent]
                   )
                 ),
                 child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment(-1,0.2),
                          child: BackButton(
                            color: Colors.white,
                          ),
                        ) 
                      ),
                      Expanded(
                        flex: 4, 
                        child: Container(
                        alignment: Alignment(-0.5,0.2),
                          child: Text(
                              "Solicitar Factura",
                              style: TextStyle( 
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.white,
                                decorationColor: Colors.blue,
                              ),
                            ),
                        ) 
                      ),
                  ],
                 )
                ),
              ),
               Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0.0, 0, 30.0, 0),
                          alignment: Alignment(0,0),
                          child:  Text(
                            """Para solicitar tu factura del pago efectuado en el mes actual, por favor envíanos la siguiente información:
                          """),
                        ),  
                      ),
                    ],
                  ),
                ),
              ),
               Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 10),
                  alignment: Alignment(-1,0),
                  child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment(-1,0),
                        child: TextFormField(
                          //controller: this.correoController,
                          controller: this.email,
                          decoration: InputDecoration(hintText: "Email Registrado"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ), 
                      ), 
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment(-1,0),
                        child: TextFormField(
                          //controller: this.correoController,
                          controller: this.razonSocial,
                          decoration: InputDecoration(hintText: "Razon Social"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ), 
                      ),  
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment(-1,0),
                        child: TextFormField(
                          //controller: this.correoController,
                          controller: this.rfc,
                          decoration: InputDecoration(hintText: "RFC"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ), 
                      ),   
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment(-1,0),
                        child: TextFormField(
                          //controller: this.correoController,
                          controller: this.ciudad,
                          decoration: InputDecoration(hintText: "Ciudad"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ), 
                      ),   
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment(-1,0),
                        child: TextFormField(
                          //controller: this.correoController,
                          controller: this.colonia,
                          decoration: InputDecoration(hintText: "Colonia"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ), 
                      ),   
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment(-1,0),
                        child:TextFormField(
                          //controller: this.correoController,
                          controller: this.direccion,
                          decoration: InputDecoration(hintText: "Direccion"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ), 
                      ),
                    ),
                    Expanded(
                      flex: 1, 
                      child:   Container(
                        alignment: Alignment(-1,0),
                        child:  TextFormField(
                          //controller: this.correoController,
                          controller: this.cp,
                          decoration: InputDecoration(hintText: "CP"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ), 
                      ),   
                    ),
                  ],
                ),
                ), 
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: RaisedButton(
                    elevation: 5,
                    child: Text(
                      "Enviar",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(28.0),
                        side: BorderSide(color: Color(0xff0781e5))),
                    color: Color(0xff0781e5),
                    onPressed: () {
                      if(
                        this.email.text == '' || this.razonSocial.text == '' || this.email.text == '' || 
                        this.ciudad.text == '' || this.colonia.text == '' || this.direccion.text == '' ||
                        this.cp.text == ''
                      ){
                        _notification(context, "Error!. Uno o mas campos de texto se encuentran vacios");
                        return; 
                      }

                      //context.bloc<SolicitarFacturaCubit>().facturaRequest();

                    }),
                ), 
              ),
            ],
          ),
        ),
      ),
    );
  }

   void _notification(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
