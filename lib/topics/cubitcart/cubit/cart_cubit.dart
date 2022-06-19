import 'package:flutter_bloc/flutter_bloc.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());
  List<Item> lists = <Item>[];
  void addToCart(Item newItem) {
    bool found = false;
    for (Item item in lists) {
      if (item.id == newItem.id) {
        var index = lists.indexOf(item);
        lists[index] = item.copyWith(count: item.count + 1);
        found = true;
        break;
      }
    }
    if (found) {
      emit(state.copyWith(list: lists));
    } else {
      lists.add(newItem);
      emit(state.copyWith(list: lists));
    }
  }

  void removeFromCart(int id) {
    for (Item item in lists) {
      if (item.id == id) {
        final index = lists.indexOf(item);
        if (lists[index].count > 1) {
          lists[index] = item.copyWith(count: item.count - 1);
        } else {
          lists.remove(item);
        }
        emit(state.copyWith(list: lists));
        break;
      }
    }
  }

  void deleteItem(int id) {
    for (Item item in lists) {
      if (item.id == id) {
        lists.remove(item);
        emit(state.copyWith(list: lists));
        break;
      }
    }
  }
}

class Item {
  const Item(this.id, this.name, this.count);
  final int id;
  final String name;
  final int count;
  Item copyWith({int? id, String? name, int? count}) {
    return Item(id ?? this.id, name ?? this.name, count ?? this.count);
  }
}
