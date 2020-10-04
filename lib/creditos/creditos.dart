import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treino/states/creditos/creditoscubit.dart';
import 'package:treino/states/creditos/creditosstate.dart';
import 'package:treino/states/login/login.dart';


class Creditos extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 75,
              decoration: BoxDecoration(
                   gradient: LinearGradient(
                     begin: Alignment.centerLeft,
                     end: Alignment.centerRight,
                     stops: [0.2, 0.8],
                     colors: [Colors.greenAccent, Colors.blueAccent]
                   )
                 ),
              child: Row(
                children: [
                  Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment(-1,0.2),
                          child: BackButton(
                            color: Colors.white,
                          ),
                        ) 
                  ),
                ],
              ),
            ),
            Container(
              height: 90,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                    children: [
                        Expanded(
                          flex: 1,
                          child: BlocConsumer<CreditosCubit, CreditosState>(
                            listener: (context, state) {},
                            builder: (context, state) {

                              String creditosDisponibles = (state is Success) ? state.creditosTotales : "0"; 
                              return Container(
                                alignment: Alignment(0.0, 1),
                                child: Text("$creditosDisponibles",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                    color: Colors.blue,
                                    decorationColor: Colors.blue
                                  )
                                ),
                             );
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text("Creditos Disponibles",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.blue,
                                decorationColor: Colors.blue
                              )
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: BlocConsumer<CreditosCubit, CreditosState>(
                            listener: (context, state){},
                            builder: (context, state){
                              String creditosGastados = (state is Success) ? state.creditosGastos : "0"; 
                              return   Container(
                                alignment: Alignment(0.0, 1),
                                child: Text("$creditosGastados",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                    color: Colors.blue,
                                    decorationColor: Colors.blue
                                  )
                                ),
                              );
                            },
                          ) 
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text("Creditos Gastados",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.blue,
                                decorationColor: Colors.blue
                              )
                            )
                          ),
                        ),
                    ],
                  )
                  )
                ],
              )
            ),
            Container(
            color: Colors.grey[400],
            width: double.infinity,
            child: Wrap(
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              spacing: 40,
              children: [
                Text(
                  "Clase",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                Text(
                  "Creditos Gastados",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                Text(
                  "Fecha",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ],
            ),
          ),
          
          BlocConsumer<CreditosCubit, CreditosState>(
            listener: (context, state){
              if(state is Success){
               
              }
            },
            builder: (context, state){
              
              if(state is InitState){
                context.bloc<CreditosCubit>().getClases(
                  context.bloc<LoginCubit>().res['id']
                );
              }

              if(state is Success){
                
                if(state.list.length == 0){
                  return Container(
                      alignment: Alignment(0.0, 1),
                      padding: const EdgeInsets.only(top: 20),
                      child: Text("No se encontraron resultados"),
                    );
                }

              return ListView.builder(
                padding: const EdgeInsets.all(8),
                physics: NeverScrollableScrollPhysics(), ///
                shrinkWrap: true, ///
                scrollDirection: Axis.vertical, //
                itemCount: state.list.length,
                itemBuilder: (BuildContext context, int index) {

               if(index >= state.list.length) {
                  return Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 60.0,
                                  padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.blueAccent,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ); 
                }
                
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 80,
                  color: Colors.black12,
                  child: Center(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(10, 2, 0, 2),
                            child: Text("${state.list[index].clase}", 
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                decorationColor: Colors.blue)
                            ),
                          ),
                        ),
                         Expanded(
                          flex: 3,
                          child: Center(
                            child: Text("${state.list[index].creditosGastados}"),
                          ),
                        ),
                         Expanded(
                          flex: 2,
                          child: Center(
                            child: Text("${state.list[index].fecha}"),
                          ),
                        ),
                      ],
                    )
                  ),
                );
              }
             );

              }

              return Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 60.0,
                      padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.blueAccent,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  ],
                ),
                ); 
            },
          )

          ]
        ),
      ),
    );
  }
  
}