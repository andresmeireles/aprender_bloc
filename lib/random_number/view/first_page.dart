import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/random_number/bloc/rn_bloc.dart';
import 'package:login_bloc/random_number/view/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RandomNumberBloc(0),
      child: _FirstView(),
    );
  }
}

class _FirstView extends StatelessWidget {
  const _FirstView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('primeira tela'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('numero randomico'),
            BlocBuilder<RandomNumberBloc, RandomNumberState>(
              builder: (context, state) => Text('${state.number}'),
            ),
            BlocBuilder<RandomNumberBloc, RandomNumberState>(
              builder: (context, state) => TextButton(
                onPressed: () async {
                  final pop = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SecondPage(number: state.number),
                    ),
                  );
                  context
                      .read<RandomNumberBloc>()
                      .add(RandomNumberEvent.specific(pop));
                },
                child: Text('passar ${state.number} para proxima pagina'),
              ),
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
    );
  }
}
