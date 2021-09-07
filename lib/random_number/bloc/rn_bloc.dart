import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

part 'rn_event.dart';
part 'rn_state.dart';

class RandomNumberBloc extends Bloc<RandomNumberEvent, RandomNumberState> {
  RandomNumberBloc(int number) : super(RandomNumberState(number));

  @override
  Stream<RandomNumberState> mapEventToState(RandomNumberEvent event) async* {
    final eventType = event.event;

    switch (eventType) {
      case EventType.set:
        yield RandomNumberState(Random().nextInt(16000));
        break;
      case EventType.specific:
        yield RandomNumberState(event.specific);
    }
  }
}
