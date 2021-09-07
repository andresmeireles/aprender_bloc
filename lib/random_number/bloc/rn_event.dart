part of 'rn_bloc.dart';

enum EventType { set, specific }

class RandomNumberEvent {
  final EventType event;
  final int specific;

  RandomNumberEvent(this.event, {this.specific = 0});

  RandomNumberEvent.specific(int number)
      : event = EventType.specific,
        specific = number;
}
