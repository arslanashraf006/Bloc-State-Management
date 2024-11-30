import 'package:bloc/bloc.dart';

import '../../model/favourite/favourite_item_model.dart';
import '../../repository/favourite_repository.dart';
import 'favorite_app_event.dart';
import 'favorite_app_state.dart';

class FavoriteAppBloc extends Bloc<FavoriteAppEvent, FavoriteAppState> {
  FavouriteRepository favouriteRepository;
  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> tempFavouriteList = [];
  FavoriteAppBloc(this.favouriteRepository) : super(const FavoriteAppState()) {
    on<FetchFavouriteList>(fetchList);
    on<FavouriteItem>(_addFavouriteItem);
    on<SelectItem>(_selectItem);
    on<UnSelectItem>(_unSelectItem);
    on<DeleteItem>(_deleteItem);
  }

  void fetchList(FetchFavouriteList event, Emitter<FavoriteAppState> emit)async{
    favouriteList = await favouriteRepository.fetchItems();
    emit(state.copyWith( favouriteItemList: List.from(favouriteList), listStatus: ListStatus.success));
  }

  void _addFavouriteItem(FavouriteItem event, Emitter<FavoriteAppState> emit)async{
    final index = favouriteList.indexWhere((element) => element.id == event.item.id);
    if(event.item.isFavourite){
      if(tempFavouriteList.contains(favouriteList[index])){
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.item);
      }
    }else{
      if(tempFavouriteList.contains(favouriteList[index])){
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.item);
      }
    }
    favouriteList[index] = event.item;
    emit(state.copyWith( favouriteItemList: List.from(favouriteList), tempFavouriteItemList: List.from(tempFavouriteList)));
  }

  void _selectItem(SelectItem event, Emitter<FavoriteAppState> emit)async{
    tempFavouriteList.add(event.item);
    emit(state.copyWith( tempFavouriteItemList: List.from(tempFavouriteList)));
  }

  void _unSelectItem(UnSelectItem event, Emitter<FavoriteAppState> emit)async{
    tempFavouriteList.remove(event.item);
    emit(state.copyWith( tempFavouriteItemList: List.from(tempFavouriteList)));
  }
  void _deleteItem(DeleteItem event, Emitter<FavoriteAppState> emit)async{
    for(int i = 0; i< tempFavouriteList.length; i++){
      favouriteList.remove(tempFavouriteList[i]);
    }
    tempFavouriteList.clear();
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
      tempFavouriteItemList: List.from(tempFavouriteList)
    ));
  }
}
