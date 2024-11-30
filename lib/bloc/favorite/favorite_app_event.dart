import 'package:equatable/equatable.dart';

import '../../model/favourite/favourite_item_model.dart';

abstract class FavoriteAppEvent extends Equatable {
  const FavoriteAppEvent();

  @override
  List<Object?> get props => [];
}

class FetchFavouriteList extends FavoriteAppEvent{}

class FavouriteItem extends FavoriteAppEvent{
  final FavouriteItemModel item;

  const FavouriteItem({required this.item});
}

class SelectItem extends FavoriteAppEvent{
  final FavouriteItemModel item;

  const SelectItem({required this.item});
}

class UnSelectItem extends FavoriteAppEvent{
  final FavouriteItemModel item;

  const UnSelectItem({required this.item});
}

class DeleteItem extends FavoriteAppEvent{}
