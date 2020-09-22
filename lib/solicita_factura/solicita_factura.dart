import 'package:flutter/material.dart';

class SolicitaFactura extends StatefulWidget {
  @override
  _SolicitaFacturaState createState() => _SolicitaFacturaState();
}

class _SolicitaFacturaState extends State<SolicitaFactura> {
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
                        flex: 4,
                        child: Container(
                          alignment: Alignment(-1,0.2),
                          child: BackButton(
                            color: Colors.white,
                          ),
                        ) 
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 10, 0.0),
                          alignment: Alignment(0, 0.2),
                          child: Text(
                            "Enviar",
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      ),
                  ],
                 )
                ),
              ),
               Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              "Solicitar Factura",
                              style: TextStyle( 
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.blue,
                                decorationColor: Colors.blue,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment(1, 0),
                              child: Text(""),
                            ),
                          )
                        ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child:  TextFormField(
                        // controller: this.correoController,
                        decoration: InputDecoration(hintText: "Correo electronico"),
                        validator: (value) {  
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          //controller: this.correoController,
                          decoration: InputDecoration(hintText: "Cc/Cco:"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),      
                      ),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          //controller: this.correoController,
                          decoration: InputDecoration(hintText: "Asunto: Solicitar Factura"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),      
                      ),
                       
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                  alignment: Alignment(-1,1),
                  child:  Text(
                    """Para solicitar tu factura del pago efectuado en el mes actual, por favor envíanos la siguiente información:
                  """),
                ), 
              ),
               Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                  alignment: Alignment(-1,0),
                  child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment(-1,0),
                        child: Text("Email Registrado:"),
                      ), 
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment(-1,0),
                        child: Text("Razon social:"),
                      ),  
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment(-1,0),
                        child: Text("RFC:"),
                      ),   
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment(-1,0),
                        child: Text("Ciudad:"),
                      ),   
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment(-1,0),
                        child: Text("Colonia:"),
                      ),   
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment(-1,0),
                        child: Text("Direccion:"),
                      ),
                    ),
                    Expanded(
                      flex: 1, 
                      child: Container(
                        alignment: Alignment(-1,0),
                        child: Text("CP:"),
                      ),   
                    ),
                  ],
                ),
                ), 
              ),
            ],
          ),
        ),
      ),
      
    
    );
  }
}
