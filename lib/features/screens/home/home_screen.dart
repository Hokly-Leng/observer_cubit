import 'package:flutter/material.dart';
import 'package:observer_cubit/core/observer_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ObserverCubit cubit = ObserverCubit();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Observering'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: cubit.stream,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Text(
                    'Loading.....',
                    style: TextStyle(
                      fontSize: 45,
                    ),
                  ),
                );
              } else {
                return Column(
                  children: [
                    Center(
                      child: Text(
                        'Current: ${cubit.currentData}',
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        'Next: ${cubit.nextData}',
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        '${cubit.state}',
                        style: const TextStyle(
                          fontSize: 45,
                        ),
                      ),
                    ),
                  ],
                );
              }
            }),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => cubit.decrement(),
                icon: const Icon(
                  Icons.remove,
                  size: 35,
                ),
              ),
              IconButton(
                onPressed: () => cubit.increment(),
                icon: const Icon(
                  Icons.add,
                  size: 35,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
