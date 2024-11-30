import 'package:bloc_state_management/bloc/favorite/favorite_app_bloc.dart';
import 'package:bloc_state_management/bloc/favorite/favorite_app_event.dart';
import 'package:bloc_state_management/bloc/favorite/favorite_app_state.dart';
import 'package:bloc_state_management/view/favorite/widget/delete_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/favourite/favourite_item_model.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  
  @override
  void initState() {
    context.read<FavoriteAppBloc>().add(FetchFavouriteList());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favourite App'),
        actions: const [
          DeleteButtonWidget()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: BlocBuilder<FavoriteAppBloc, FavoriteAppState>(
          builder: (BuildContext context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case ListStatus.failure:
                return const Center(child: Text('error'));
              case ListStatus.success:
                return ListView.builder(
                    itemCount: state.favouriteItemList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Checkbox(value: state.tempFavouriteItemList.contains(state.favouriteItemList[index]) ? true : false,
                            onChanged: (bool? value) {
                              FavouriteItemModel item = state.favouriteItemList[index];
                              if (value!) {
                                context.read<FavoriteAppBloc>().add(SelectItem(item: item));
                              } else {
                                context.read<FavoriteAppBloc>().add(UnSelectItem(item: item));
                              }
                            },),
                          title: Text(state.favouriteItemList[index].value , style: TextStyle(
                              decoration: state.tempFavouriteItemList.contains(state.favouriteItemList[index])? TextDecoration.lineThrough : TextDecoration.none  ,
                              color: state.tempFavouriteItemList.contains(state.favouriteItemList[index])? Colors.red : Colors.black
                          ),),
                          trailing: IconButton(
                            onPressed: () {
                              FavouriteItemModel item = state.favouriteItemList[index];

                              context.read<FavoriteAppBloc>().add(FavouriteItem(
                                  item: FavouriteItemModel(
                                      id: item.id,
                                      isFavourite: item.isFavourite ? false : true,
                                      value: item.value
                                  )));
                            },
                            icon: Icon(state.favouriteItemList[index].isFavourite ? Icons.favorite : Icons.favorite_outline),
                          ),
                        ),
                      );
                    }
                );
            }
          },

        ),
      ),
    );
  }
}