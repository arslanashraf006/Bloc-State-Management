import 'package:bloc_state_management/bloc/favorite/favorite_app_bloc.dart';
import 'package:bloc_state_management/bloc/favorite/favorite_app_event.dart';
import 'package:bloc_state_management/bloc/favorite/favorite_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteButtonWidget extends StatelessWidget {
  const DeleteButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteAppBloc, FavoriteAppState>(
      builder: (context, state) {
        return Visibility(
            visible: state.tempFavouriteItemList.isNotEmpty ? true : false,
            child: IconButton(onPressed: () {
              context.read<FavoriteAppBloc>().add(DeleteItem());
            },
                icon: const Icon(Icons.delete_outline, color: Colors.red,))
        );
      },
    );
  }
}