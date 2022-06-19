import 'package:bloc_cubit/topics/cubitcart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitCart extends StatelessWidget {
  const CubitCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider<CartCubit>(
      create: (context) => CartCubit(),
      child: _Cart(
        title: args,
      ),
    );
  }
}

class _Cart extends StatelessWidget {
  const _Cart({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: [
            ...List.generate(
                5,
                (i) => ListTile(
                      title: Text('Item_$i'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              BlocProvider.of<CartCubit>(context)
                                  .addToCart(Item(i, 'Item_$i', 1));
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              BlocProvider.of<CartCubit>(context)
                                  .removeFromCart(i);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              BlocProvider.of<CartCubit>(context).deleteItem(i);
                            },
                          )
                        ],
                      ),
                    )).toList(),
            const Divider(),
            const ListTile(
              title: Text(
                'Inside the cart 👇',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.cartlist.length,
                  itemBuilder: (BuildContext context, int index) {
                    Item item = state.cartlist[index];
                    return ListTile(
                        title: Text(item.name),
                        trailing: Text(
                          item.count.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ));
                  },
                );
              },
            )
          ],
        ));
  }
}

/// Custom [BlocObserver] which observes all bloc and cubit instances.
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint(event.toString());
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint(transition.toString());
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint(error.toString());
    super.onError(bloc, error, stackTrace);
  }
}
