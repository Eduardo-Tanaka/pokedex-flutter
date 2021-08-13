import 'package:bloc/bloc.dart';

class DetailPageCubit extends Cubit<int> {
  DetailPageCubit(int initialState) : super(0);

  void change(int value) => emit(value);
}
