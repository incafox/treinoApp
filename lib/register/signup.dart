import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treino/states/register.dart';
import '../states/getCiudadesRequest.dart';


class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Register> {

  List<String> _ciudades;

  @override
  void initState() {
    super.initState();
    _ciudades = ['Ciudad actual'];
    _getCiudades();
  }

  _getCiudades() async{
    GetCiudadesRequest getCiudadesRequest = GetCiudadesRequest(); 
    List<dynamic> ciudades =  await getCiudadesRequest.getCiudades();
    for(int i = 0; i<ciudades.length; i++){
      setState(() {
        this._ciudades.add(ciudades[i]['nombre']);  
      });
    }
  }



  final elements1 = [
    "CDMX",
    "XL CIUDAD",
    "2nd CIUDAD",
    "CIDUAD",
    "3rd Sn",
  ];
  TextEditingController nombre = TextEditingController();
  TextEditingController apellido = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController telefono = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController fechaNac = TextEditingController();
  TextEditingController genero = TextEditingController();
  TextEditingController ciudad = TextEditingController();

  int selectedIndex1 = 0,
      selectedIndex2 = 0,
      selectedIndex3 = 0,
      selectedIndex4 = 0;

  List<Widget> _buildItems1() {
    return elements1.map((val) => Text(val)).toList();
  }

  String dropdownValue = 'Ciudad actual';
  String dropdownValue2 = 'Genero';
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(elevation: 0,backgroundColor: Colors.white,iconTheme: IconThemeData(color: Colors.black),),
      body: Builder(
        builder: (context) =>
         Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  BackButton(),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Center(
                      child: Opacity(
                        opacity: 1,
                        child: Image(
                            // color: Colors.white,
                            // colorBlendMode: BlendMode.srcIn,
                            fit: BoxFit.fitWidth,
                            height: 90,
                            width: 180,
                            image: AssetImage('assets/images/Path 8@2x.png')),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 0),
                        child: Text(
                          "",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500),
                        ),
                      ),
                      TextFormField(
                        controller: this.nombre,
                        decoration: InputDecoration(hintText: "Nombre"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: this.apellido,
                        decoration: InputDecoration(hintText: "Apellido"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: this.correo,
                        decoration:
                            InputDecoration(hintText: "Correo Electronico"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: this.password,
                        decoration: InputDecoration(hintText: "Contraseña"),
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                        TextFormField(
                        controller: this.confirmPassword,
                        decoration: InputDecoration(hintText: "Confirmar contraseña"),
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: this.telefono,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(hintText: "Telefono"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      // DirectSelect(
                      //     itemExtent: 60.0,
                      //     selectedIndex: selectedIndex1,
                      //     backgroundColor: Colors.white,
                      //     child: MySelectionItem(
                      //       isForList: false,
                      //       title: elements1[selectedIndex1],
                      //     ),
                      //     onSelectedItemChanged: (index) {
                      //       setState(() {
                      //         selectedIndex1 = index;
                      //         this.ciudad.text = elements1[index];
                      //         print(this.ciudad.text);
                      //       });
                      //     },
                      //     items: _buildItems1()),
                      // CupertinoPicker(itemExtent: null, onSelectedItemChanged: null, children: null)
                      Center(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: Icon(Icons.keyboard_arrow_down),
                          iconSize: 30,
                          elevation: 5,
                          style: TextStyle(fontSize: 17, color: Colors.black54),
                          underline: Container(
                            height: 0.7,
                            color: Colors.black54,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                              this.ciudad.text = newValue;
                            });
                          },
                          items: this._ciudades.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),

                      Center(
                        child: RaisedButton(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(28.0),
                              side: BorderSide(color: Colors.white70)),
                          onPressed: () => _selectDate(context), // Refer step 3
                          child: Text(
                            'Fecha de nacimiento',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Colors.white70,
                        ),
                      ),
                      Center(
                        child: DropdownButton<String>(
                          key: Key("value"),
                          value: this.dropdownValue2 != null
                              ? this.dropdownValue2
                              : null,
                          icon: Icon(Icons.keyboard_arrow_down),
                          iconSize: 30,
                          elevation: 5,
                          style: TextStyle(fontSize: 17, color: Colors.black54),
                          underline: Container(
                            height: 0.7,
                            color: Colors.black54,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue2 = newValue;
                              this.genero.text = newValue;
                              print(this.genero.text);
                            });
                          },
                          items: <String>[
                            'Genero',
                            'Masculino',
                            'Femenino'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      // Add TextFormFields and RaisedButton here.
                    ])),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 34.0, right: 34),
                child: RaisedButton(
                    child: Text(
                      "Registrar",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(28.0),
                        side: BorderSide(color: Colors.blue)),
                    color: Colors.blue,
                    onPressed: () async {

                       if(
                        this.correo.text == '' || this.nombre.text == '' || this.telefono.text == '' || 
                        this.password.text == '' || this.ciudad.text == '' || this.apellido.text == '' || 
                        this.genero.text == '' || this.confirmPassword.text == ''
                      ) {
                        _notification(context, "Error de registro!. Algunos campos se encuentran vacios");
                        return;
                      }

                      if(this.password.text != this.confirmPassword.text) {
                         _notification(context, "Error de registro!. Las contraseñas no coinciden");
                        return;
                      }

                      if((DateTime.now().year - this.selectedDate.year) < 10){
                       _notification(context, 'Error de registro!. Fecha de nacimiento invalida');
                       return; 
                      }

                      String response  =  await context.bloc<RegisterCubit>().register(
                          correo: this.correo.text,
                          nombre: this.nombre.text,
                          genero: this.genero.text,
                          password: this.password.text,
                          telefono: this.telefono.text,
                          fechaNac: this.selectedDate.toString(),
                          ciudad: this.ciudad.text,
                          apelli: this.apellido.text
                      );
                       
                       if(response != '0') {
                         _notification(context, response);
                        return;
                       } 
              
                      Navigator.pop(context);
                    }),
              )
            ],
          ),
        ),
      ),
      )
    );
  }

    ///login error message
  void _notification(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1960),
      lastDate: DateTime(selectedDate.year + 5),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        print(selectedDate.year);
      });
  }
}

//You can use any Widget
class MySelectionItem extends StatelessWidget {
  final String title;
  final bool isForList;

  const MySelectionItem({Key key, this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: isForList
          ? Padding(
              child: _buildItem(context),
              padding: EdgeInsets.all(0.0),
            )
          : Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Stack(
                children: <Widget>[
                  _buildItem(context),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down),
                  )
                ],
              ),
            ),
    );
  }

  _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(title),
    );
  }
}
