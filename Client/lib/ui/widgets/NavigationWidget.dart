import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/NavigationCubit.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: IconButton(onPressed: ()=> context.read<NavigationCubit>().showLearningScreen(), icon: Icon(Icons.book)),
        ),
        Expanded(
          child: IconButton(onPressed: ()=>context.read<NavigationCubit>().showSearchingScreen(), icon: Icon(Icons.search_rounded)),
        ),
        Expanded(
          child: IconButton(onPressed: ()=> context.read<NavigationCubit>().showEditScreen(), icon: Icon(Icons.add_circle_sharp)),
        ),
        Expanded (
          child: IconButton(onPressed: ()=> context.read<NavigationCubit>().showSettingsScreen(), icon: Icon(Icons.settings)),
        )
      ],
    );
  }
}