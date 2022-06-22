import 'package:bloc_cubit/topics/cubitobserver/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ObserverCounterView extends StatelessWidget {
  const ObserverCounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String title = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider<ObserverCounterCubit>(
      create: (context) => ObserverCounterCubit(),
      child: _MyCounterApp(title: title),
    );
  }
}

class _MyCounterApp extends StatelessWidget {
  const _MyCounterApp({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: BlocBuilder<ObserverCounterCubit, int>(
        builder: (context, state) {
          return Text(
            '$state',
            style: const TextStyle(fontSize: 36),
          );
        },
      )),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              context.read<ObserverCounterCubit>().increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              BlocProvider.of<ObserverCounterCubit>(context).decrement();
            },
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
