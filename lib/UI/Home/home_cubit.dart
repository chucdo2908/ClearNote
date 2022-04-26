import 'package:appclearnote/Models/enums/load_status.dart';
import 'package:appclearnote/Models/model_note.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
}
