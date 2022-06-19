part of 'cart_cubit.dart';

class CartState {
  const CartState({this.cartlist = const []});
  final List<Item> cartlist;

  CartState copyWith({List<Item>? list}) {
    return CartState(cartlist: list ?? cartlist);
  }

  @override
  String toString() {
    String value = '';
    for (Item i in cartlist) {
      value += '{ id:${i.id}, name:${i.name}, count:${i.count} }, ';
    }
    return value;
  }
}
