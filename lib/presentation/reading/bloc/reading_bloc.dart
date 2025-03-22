import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'reading_event.dart';
part 'reading_state.dart';

class ReadingBloc extends Bloc<ReadingEvent, ReadingState> {
  ReadingBloc() : super(const ReadingState()) {
    on<OnPressedSeterusnyaEvent>(_onPressedSeterusnaEvent);
  }

  void _onPressedSeterusnaEvent(
    OnPressedSeterusnyaEvent event,
    Emitter<ReadingState> emit,
  ) {}
}
