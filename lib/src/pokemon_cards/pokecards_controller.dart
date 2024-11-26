import 'package:get/get.dart';
import 'package:gravityer_assignment/src/models/pokecard.dart';
import 'package:gravityer_assignment/src/models/status_model.dart';
import 'pokecards_service.dart';

class PokeCardsController extends GetxController {
  PokeCardsController(this._pokeCardsService);

  final PokeCardsService _pokeCardsService;
  final RxString searchKey = "".obs;
  final listStatus = StatusModel<List<PokeCard>?>().obs;
  final detailsStatus = StatusModel<PokeCard?>().obs;
  final RxBool showSearch = false.obs;

  void toggleShowSearch() {
    showSearch.toggle();
    update();
  }

  void fetchListing({String search = ""}) async {
    listStatus.value
      ..loading = true
      ..success = false
      ..data = null;
    searchKey.value = search;
    update();
    try {
      listStatus.value
        ..data = (await _pokeCardsService.fetchPokemonCards(searchText: search))
            .map<PokeCard>((e) => PokeCard.fromJson(e))
            .toList()
        ..loading = false
        ..success = true;
    } catch (exc) {
      listStatus.value
        ..loading = false
        ..success = false
        ..message = exc.toString();
    }
    update();
  }

  void selectCard(String id) async {
    detailsStatus.value.loading = true;
    update();
    detailsStatus.value.data = (listStatus.value.data as List<PokeCard>)
        .where((test) => test.id == id)
        .first;
    update();
  }
}
