import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edit_note1_state.dart';

class EditNote1Cubit extends Cubit<EditNote1State> {
  EditNote1Cubit() : super(EditNote1Initial());
}
