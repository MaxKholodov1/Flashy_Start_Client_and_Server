import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/NavigationCubit.dart';
import '../../../cubits/searching_screen_cubit/SearchingScreenCubit.dart';
import '../../../cubits/searching_screen_cubit/SearchingStates.dart';
import '../../../generated/l10n.dart';
import 'DeckWidget.dart';

class MainSearchingScreenWidget extends StatefulWidget {
  const MainSearchingScreenWidget({super.key});

  @override
  State<MainSearchingScreenWidget> createState() => _MainSearchingScreenWidgetState();
}

class _MainSearchingScreenWidgetState extends State<MainSearchingScreenWidget> {
  final _controller = TextEditingController();
  ScrollController? _scrollController;
  double _currentOffset = 0;
  Timer? _debounce; // debounce-поле

  @override
  void initState() {
    super.initState();

    final state = context.read<SearchingScreensCubit>().state;
    double offset = 0;
    if (state is MainSearchingScreenState) {
      offset = context.read<SearchingScreensCubit>().getMainEditingScreenOffset();
    }

    _currentOffset = offset;
    _scrollController = ScrollController(initialScrollOffset: offset);


    if (state is MainSearchingScreenState) {
      if (state.query.isNotEmpty) {
        _controller.text = state.query;
        // инициализируем сразу поиск (если нужно при монтировании)
        // можно с задержкой через Future.microtask, чтобы избежать setState в initState
        Future.microtask(() {
          context.read<SearchingScreensCubit>().search(state.query.trim());
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _scrollController?.jumpTo(0);
          });
        });
      }
    }

    _scrollController!.addListener(() {
      setState(() {
        _currentOffset = _scrollController!.offset;
      });
      _onScroll();
    });
  }

  @override
  void dispose() {
    _debounce?.cancel(); // обязательно отменить
    _scrollController?.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    // отменяем предыдущий таймер
    _debounce?.cancel();

    // запускаем новый через 300мс
    _debounce = Timer(const Duration(milliseconds: 300), () {
      _scrollController?.jumpTo(0);
      context.read<SearchingScreensCubit>().search(query.trim());
    });
  }

  void _onScroll() {
    if (_scrollController == null) return;
    if (_scrollController!.position.pixels >=
        _scrollController!.position.maxScrollExtent - 100) {
      context.read<SearchingScreensCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchingScreensCubit, SearchingScreenState>(
      builder: (context, state) {
        if (state is MainSearchingScreenState && _scrollController != null) {
          return Column(
            children: [
              Padding(
                padding:  EdgeInsets.all(12),
                child: TextField(
                  controller: _controller,
                  onChanged: _onSearchChanged, // добавлено
                  decoration: InputDecoration(
                    hintText: S.of(context).searchDecks,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        context.read<SearchingScreensCubit>().search(_controller.text.trim());
                      },
                    ),
                  ),
                  onSubmitted: (value) {
                    context.read<SearchingScreensCubit>().search(value.trim());
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController!,
                  itemCount: state.searchResultDecks.length + (state.hasMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < state.searchResultDecks.length) {
                      final deck = state.searchResultDecks[index];
                      return DeckWidget(
                        searchResultDeck: deck,
                        currentOffset: _currentOffset,
                        isAdded: deck.isAlreadyAdded,
                        onAddPressed: () {
                          _scrollController?.jumpTo(0);
                          context.read<SearchingScreensCubit>().addToLearningDecks(deck.globalDeck.ID);
                        },
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.all(12),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                ),
              ),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
