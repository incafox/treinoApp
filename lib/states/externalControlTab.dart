import 'package:flutter_bloc/flutter_bloc.dart';

class ExternalControllerMainTabsCubit extends Cubit<int> {
  ExternalControllerMainTabsCubit() : super(1);

  void setVal(int val) => emit(val);
}

class ExternalControllerMisClasesCubit extends Cubit<int> {
  ExternalControllerMisClasesCubit() : super(1);

  void setVal(int val) => emit(val);
}
