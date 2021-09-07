import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/random_number/bloc/rn_bloc.dart';

class SecondPage extends StatelessWidget {
  final int number;

  const SecondPage({required this.number, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RandomNumberBloc(number),
      child: _SecondView(),
    );
  }
}

class _SecondView extends StatelessWidget {
  const _SecondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final r = context.read<RandomNumberBloc>().state;
        Navigator.of(context).pop(r.number);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('segunda tela'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('numero randomico'),
              BlocBuilder<RandomNumberBloc, RandomNumberState>(
                builder: (context, state) => Text('${state.number}'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context
              .read<RandomNumberBloc>()
              .add(RandomNumberEvent(EventType.set)),
          child: Icon(Icons.sync),
        ),
      ),
    );
  }
}
