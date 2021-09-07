import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

part 'rn_event2.dart';
part 'rn_state2.dart';

class RandomNumberBloc2 extends Bloc<RandomNumberEvent2, RandomNumberState2> {
  RandomNumberBloc2(int number) : super(RandomNumberState2(number));

  @override
  Stream<RandomNumberState2> mapEventToState(RandomNumberEvent2 event) async* {
    final eventType = event.event;

    switch (eventType) {
      case EventType2.set:
        yield RandomNumberState2(Random().nextInt(16000));
        break;
    }
  }
}
