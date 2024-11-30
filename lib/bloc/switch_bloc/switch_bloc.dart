import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/bloc/switch_bloc/switch_event.dart';
import 'package:bloc_state_management/bloc/switch_bloc/switch_state.dart';


class SwitchBloc extends Bloc<SwitchEvents, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_slider);
  }

  void _enableOrDisableNotification(EnableOrDisableNotification events, Emitter<SwitchState> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(SliderEvent events, Emitter<SwitchState> emit){
    emit(state.copyWith(slider: events.slider.toDouble()));
  }
}
