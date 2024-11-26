import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravityer_assignment/src/pokemon_cards/pokecards_controller.dart';
import 'package:gravityer_assignment/src/pokemon_cards/pokecards_service.dart';
import 'package:gravityer_assignment/src/views/error_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../settings/settings_view.dart';
import '../models/pokecard.dart';
import 'pokemon_card_details_view.dart';

class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
  });

  static const routeName = '/';

  static const List<PokeCard> items = [];

  @override
  Widget build(BuildContext context) {
    PokeCardsController pokeCardsController =
        Get.put(PokeCardsController(PokeCardsService()));
    return GetBuilder(
        init: pokeCardsController,
        initState: (state) {
          pokeCardsController.fetchListing(
              search: state.controller?.searchKey.value ?? "");
        },
        builder: (ctrlr) {
          final tec = TextEditingController(text: ctrlr.searchKey.value);
          return Scaffold(
            appBar: AppBar(
              title: Text(ctrlr.searchKey.value.isEmpty
                  ? 'Pokemon Cards'
                  : ctrlr.searchKey.value),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    ctrlr.toggleShowSearch();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    Navigator.restorablePushNamed(
                        context, SettingsView.routeName);
                  },
                ),
              ],
              bottom: pokeCardsController.showSearch.value
                  ? PreferredSize(
                      preferredSize: const Size.fromHeight(60),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        child: TextField(
                          controller: tec,
                          textInputAction: TextInputAction.search,
                          onSubmitted: (search) {
                            (ctrlr.fetchListing(search: search));
                            ctrlr.toggleShowSearch();
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Search Card Here...',
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
            body: Builder(builder: (context) {
              if (ctrlr.listStatus.value.success &&
                  !ctrlr.listStatus.value.loading &&
                  (ctrlr.listStatus.value.data?.isEmpty == true)) {
                return const ErrorView(errorMessage: "No Cards Found");
              } else if (ctrlr.listStatus.value.success ||
                  ctrlr.listStatus.value.loading) {
                return Skeletonizer(
                  enabled: ctrlr.listStatus.value.loading,
                  child: ListView.builder(
                    restorationId: 'sampleItemListView',
                    itemCount: ctrlr.listStatus.value.data?.length ?? 8,
                    itemBuilder: (BuildContext context, int index) {
                      final item = ctrlr.listStatus.value.data?[index];

                      return ListTile(
                          minTileHeight: 80,
                          title: Text(item != null
                              ? item.name
                              : 'SampleItem ${item?.id}'),
                          leading: Container(
                            padding: const EdgeInsets.all(4),
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(12)),
                            child: item != null
                                ? FastCachedImage(
                                    url: item.set.images.symbol,
                                    height: 65,
                                    width: 65,
                                  )
                                : null,
                          ),
                          onTap: () {
                            Navigator.restorablePushNamed(
                                context, PokemonCardDetailsView.routeName,
                                arguments: item?.toJson());
                          });
                    },
                  ),
                );
              } else if (ctrlr.listStatus.value.success == false) {
                return ErrorView(errorMessage: ctrlr.listStatus.value.message);
              }
              return const SizedBox.shrink();
            }),
          );
        });
  }
}
