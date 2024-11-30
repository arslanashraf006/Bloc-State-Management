import 'package:bloc_state_management/bloc/counter/counter_bloc.dart';
import 'package:bloc_state_management/bloc/counter/counter_event.dart';
import 'package:bloc_state_management/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  // late CounterBloc _counterBloc;
  //
  // @override
  // void initState() {
  //   _counterBloc = CounterBloc();
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   _counterBloc.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Example'),
      ),
      body: SafeArea(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
              return Center(child: Text(state.counter.toString() ,
                style: const TextStyle(color: Colors.black , fontSize: 60),));
            },),

            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  context.read<CounterBloc>().add(IncrementCounter());
                }, child: const Text('Add')),
                const SizedBox(width: 20,),
                ElevatedButton(onPressed: (){
                  context.read<CounterBloc>().add(DecrementCounter());
                }, child: const Text('Removed')),
              ],
            )
          ],
        ),
      ),
    );

    // return BlocProvider(
    //   create: (context) => _counterBloc,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Counter Example'),
    //     ),
    //     body: SafeArea(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           BlocBuilder<CounterBloc, CounterState>(
    //             builder: (context, state) {
    //               return Center(child: Text(state.counter.toString(),
    //                 style: const TextStyle(color: Colors.black, fontSize: 60),));
    //             },),
    //
    //           const SizedBox(height: 30,),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               BlocBuilder<CounterBloc, CounterState>(
    //                 buildWhen: (previous, current) => false,
    //                 builder: (context, state) {
    //                   return ElevatedButton(
    //                       onPressed: () {
    //                         context.read<CounterBloc>().add(IncrementCounter());
    //                       }, child: const Text('Add'));
    //                 },
    //               ),
    //               const SizedBox(width: 20,),
    //               BlocBuilder<CounterBloc, CounterState>(
    //                 buildWhen: (previous, current) => false,
    //                 builder: (context, state) {
    //                   return ElevatedButton(onPressed: () {
    //                     context.read<CounterBloc>().add(DecrementCounter());
    //                   }, child: const Text('Removed'));
    //                 },
    //               ),
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}