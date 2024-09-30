import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/pokemon_list/bloc/pokemon_bloc.dart';
import 'package:pokemon/features/pokemon_list/widgets/pokemon_item.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => PokemonBloc()..add(PokemonFetched()),
      child: const _PokemonsView(),
    );
  }
}

class _PokemonsView extends StatefulWidget {
  const _PokemonsView({super.key});

  @override
  State<_PokemonsView> createState() => _PokemonsViewState();
}

class _PokemonsViewState extends State<_PokemonsView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PokemonBloc>().add(PokemonFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Scrollbar(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              const SliverAppBar(
                backgroundColor: Colors.white,
                scrolledUnderElevation: 0,
                pinned: true,
                expandedHeight: 160,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.all(16),
                  title: Text(
                    'Pokedex',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                ),
              ),
              BlocBuilder<PokemonBloc, PokemonState>(
                builder: (context, state) {
                  switch (state.status) {
                    case PokemonStatus.initial:
                      return const SliverFillRemaining(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    case PokemonStatus.failure:
                      return const SliverFillRemaining(
                        child: Center(child: Text('Failed to fetch Pokemons')),
                      );
                    case PokemonStatus.success:
                      if (state.pokemons.isEmpty) {
                        return const SliverFillRemaining(
                            child: Center(child: Text('Empty')));
                      }
                      return SliverMainAxisGroup(
                        slivers: [
                          SliverPadding(
                            padding: const EdgeInsets.all(16),
                            sliver: SliverGrid.builder(
                              itemCount: state.pokemons.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 4 / 3,
                              ),
                              itemBuilder: (_, index) {
                                final item = state.pokemons[index];
                                return PokemonItem(item: item);
                              },
                            ),
                          ),
                          const SliverToBoxAdapter(
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3,
                                    ),
                                  ),
                                  SizedBox(height: 16)
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                  }
                },
              ),
            ],
          ),
        ));
  }
}
