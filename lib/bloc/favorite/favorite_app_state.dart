import 'package:equatable/equatable.dart';
import '../../model/favourite/favourite_item_model.dart';

enum ListStatus{loading, success, failure}

class FavoriteAppState extends Equatable {
  final ListStatus listStatus;
  final List<FavouriteItemModel> favouriteItemList;
  final List<FavouriteItemModel> tempFavouriteItemList;
  const FavoriteAppState({
    this.favouriteItemList = const [],
    this.tempFavouriteItemList = const [],
    this.listStatus = ListStatus.loading,
});

  FavoriteAppState copyWith({List<FavouriteItemModel>? favouriteItemList,List<FavouriteItemModel>? tempFavouriteItemList, ListStatus? listStatus}){
    return FavoriteAppState(
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      tempFavouriteItemList: tempFavouriteItemList ?? this.tempFavouriteItemList,
      listStatus: listStatus ?? this.listStatus,
    );
}

  @override
  List<Object?> get props => [favouriteItemList,tempFavouriteItemList, listStatus];
}
