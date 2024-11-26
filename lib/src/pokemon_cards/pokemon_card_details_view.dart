import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gravityer_assignment/src/models/pokecard.dart';

class PokemonCardDetailsView extends StatelessWidget {
  const PokemonCardDetailsView({
    super.key,
    required this.pokeCard,
  });

  static const routeName = '/pokemon_card_details';
  final PokeCard pokeCard;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FastCachedImage(
              url: pokeCard.images.large,
              width: double.infinity,
              height: 350,
              loadingBuilder: (p0, p1) {
                return const SizedBox(
                  height: 250,
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Name : ${pokeCard.name}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'SuperType: ${pokeCard.supertype}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Trivia: ${pokeCard.flavorText}',
              textAlign: TextAlign.center,
            ),
            ...List.generate(pokeCard.attacks.length, (index) {
              return Text(pokeCard.attacks[index].name);
            }),
            const Text('More Information Here'),
          ],
        ),
      ),
    );
  }
}
