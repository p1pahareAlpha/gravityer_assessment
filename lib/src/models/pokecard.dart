// ignore_for_file: no_leading_underscores_for_local_identifiers

class PokeCard {
  PokeCard({
    required this.id,
    required this.name,
    required this.supertype,
    required this.subtypes,
    required this.level,
    required this.hp,
    required this.types,
    required this.evolvesFrom,
    required this.abilities,
    required this.attacks,
    required this.weaknesses,
    required this.resistances,
    required this.retreatCost,
    required this.convertedRetreatCost,
    required this.set,
    required this.number,
    required this.artist,
    required this.rarity,
    required this.flavorText,
    required this.nationalPokedexNumbers,
    required this.legalities,
    required this.images,
    required this.tcgplayer,
    required this.cardmarket,
  });
  late final String id;
  late final String name;
  late final String supertype;
  late final List<String> subtypes;
  late final String level;
  late final String hp;
  late final List<String> types;
  late final String evolvesFrom;
  late final List<Abilities> abilities;
  late final List<Attacks> attacks;
  late final List<Weaknesses> weaknesses;
  late final List<Resistances> resistances;
  late final List<String> retreatCost;
  late final int convertedRetreatCost;
  late final Set set;
  late final String number;
  late final String artist;
  late final String rarity;
  late final String flavorText;
  late final List<int> nationalPokedexNumbers;
  late final Legalities legalities;
  late final Images images;
  late final Tcgplayer tcgplayer;
  late final Cardmarket cardmarket;

  PokeCard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    supertype = json['supertype'];
    subtypes = List.castFrom<dynamic, String>(json['subtypes']);
    level = json['level'] ?? "";
    hp = json['hp'];
    types = List.castFrom<dynamic, String>(json['types']);
    evolvesFrom = json['evolvesFrom'] ?? "";
    abilities = List.from(json['abilities'] ?? [])
        .map((e) => Abilities.fromJson(e))
        .toList();
    attacks =
        List.from(json['attacks']).map((e) => Attacks.fromJson(e)).toList();
    weaknesses = List.from(json['weaknesses'])
        .map((e) => Weaknesses.fromJson(e))
        .toList();
    resistances = List.from(json['resistances'] ?? [])
        .map((e) => Resistances.fromJson(e))
        .toList();
    retreatCost = List.castFrom<dynamic, String>(json['retreatCost'] ?? []);
    convertedRetreatCost = json['convertedRetreatCost'] ?? -1;
    set = Set.fromJson(json['set']);
    number = json['number'];
    artist = json['artist'];
    rarity = json['rarity'] ?? "";
    flavorText = json['flavorText'] ?? "";
    nationalPokedexNumbers =
        List.castFrom<dynamic, int>(json['nationalPokedexNumbers']);
    legalities = Legalities.fromJson(json['legalities']);
    images = Images.fromJson(json['images']);
    tcgplayer = Tcgplayer.fromJson(json['tcgplayer']);
    cardmarket = Cardmarket.fromJson(json['cardmarket']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['supertype'] = supertype;
    _data['subtypes'] = subtypes;
    _data['level'] = level;
    _data['hp'] = hp;
    _data['types'] = types;
    _data['evolvesFrom'] = evolvesFrom;
    _data['abilities'] = abilities.map((e) => e.toJson()).toList();
    _data['attacks'] = attacks.map((e) => e.toJson()).toList();
    _data['weaknesses'] = weaknesses.map((e) => e.toJson()).toList();
    _data['resistances'] = resistances.map((e) => e.toJson()).toList();
    _data['retreatCost'] = retreatCost;
    _data['convertedRetreatCost'] = convertedRetreatCost;
    _data['set'] = set.toJson();
    _data['number'] = number;
    _data['artist'] = artist;
    _data['rarity'] = rarity;
    _data['flavorText'] = flavorText;
    _data['nationalPokedexNumbers'] = nationalPokedexNumbers;
    _data['legalities'] = legalities.toJson();
    _data['images'] = images.toJson();
    _data['tcgplayer'] = tcgplayer.toJson();
    _data['cardmarket'] = cardmarket.toJson();
    return _data;
  }
}

class Abilities {
  Abilities({
    required this.name,
    required this.text,
    required this.type,
  });
  late final String name;
  late final String text;
  late final String type;

  Abilities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    text = json['text'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['text'] = text;
    _data['type'] = type;
    return _data;
  }
}

class Attacks {
  Attacks({
    required this.name,
    required this.cost,
    required this.convertedEnergyCost,
    required this.damage,
    required this.text,
  });
  late final String name;
  late final List<String> cost;
  late final int convertedEnergyCost;
  late final String damage;
  late final String text;

  Attacks.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cost = List.castFrom<dynamic, String>(json['cost']);
    convertedEnergyCost = json['convertedEnergyCost'];
    damage = json['damage'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['cost'] = cost;
    _data['convertedEnergyCost'] = convertedEnergyCost;
    _data['damage'] = damage;
    _data['text'] = text;
    return _data;
  }
}

class Weaknesses {
  Weaknesses({
    required this.type,
    required this.value,
  });
  late final String type;
  late final String value;

  Weaknesses.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    return _data;
  }
}

class Resistances {
  Resistances({
    required this.type,
    required this.value,
  });
  late final String type;
  late final String value;

  Resistances.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    return _data;
  }
}

class Set {
  Set({
    required this.id,
    required this.name,
    required this.series,
    required this.printedTotal,
    required this.total,
    required this.legalities,
    required this.ptcgoCode,
    required this.releaseDate,
    required this.updatedAt,
    required this.images,
  });
  late final String id;
  late final String name;
  late final String series;
  late final int printedTotal;
  late final int total;
  late final Legalities legalities;
  late final String ptcgoCode;
  late final String releaseDate;
  late final String updatedAt;
  late final Images images;

  Set.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    series = json['series'];
    printedTotal = json['printedTotal'];
    total = json['total'];
    legalities = Legalities.fromJson(json['legalities']);
    ptcgoCode = json['ptcgoCode'] ?? "";
    releaseDate = json['releaseDate'];
    updatedAt = json['updatedAt'];
    images = Images.fromJson(json['images']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['series'] = series;
    _data['printedTotal'] = printedTotal;
    _data['total'] = total;
    _data['legalities'] = legalities.toJson();
    _data['ptcgoCode'] = ptcgoCode;
    _data['releaseDate'] = releaseDate;
    _data['updatedAt'] = updatedAt;
    _data['images'] = images.toJson();
    return _data;
  }
}

class Legalities {
  Legalities({
    required this.unlimited,
  });
  late final String unlimited;

  Legalities.fromJson(Map<String, dynamic> json) {
    unlimited = json['unlimited'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['unlimited'] = unlimited;
    return _data;
  }
}

class Images {
  Images({
    required this.symbol,
    required this.logo,
    required this.large,
    required this.small,
  });
  late final String symbol;
  late final String logo;
  late final String small;
  late final String large;

  Images.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'] ?? "";
    logo = json['logo'] ?? "";
    small = json['small'] ?? "";
    large = json['large'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['symbol'] = symbol;
    _data['logo'] = logo;
    _data['small'] = small;
    _data['large'] = large;
    return _data;
  }
}

class Tcgplayer {
  Tcgplayer({
    required this.url,
    required this.updatedAt,
    required this.prices,
  });
  late final String url;
  late final String updatedAt;
  late final Prices prices;

  Tcgplayer.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    updatedAt = json['updatedAt'];
    prices = Prices.fromJson(json['prices']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['updatedAt'] = updatedAt;
    _data['prices'] = prices.toJson();
    return _data;
  }
}

class Prices {
  Prices({
    required this.holofoil,
    required this.reverseHolofoil,
  });
  late final Holofoil? holofoil;
  late final ReverseHolofoil? reverseHolofoil;

  Prices.fromJson(Map<String, dynamic> json) {
    if (json['holofoil'] != null) {
      holofoil = Holofoil.fromJson(json['holofoil']);
    } else {
      holofoil = null;
    }
    if (json['reverseHolofoil'] != null) {
      reverseHolofoil = ReverseHolofoil.fromJson(json['reverseHolofoil']);
    } else {
      reverseHolofoil = null;
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['holofoil'] = holofoil?.toJson();
    _data['reverseHolofoil'] = reverseHolofoil?.toJson();
    return _data;
  }
}

class Holofoil {
  Holofoil({
    required this.low,
    required this.mid,
    required this.high,
    required this.market,
    this.directLow,
  });
  late final double low;
  late final double mid;
  late final double high;
  late final double market;
  late final Null directLow;

  Holofoil.fromJson(Map<String, dynamic> json) {
    low = json['low'];
    mid = json['mid'];
    high = json['high'];
    market = json['market'];
    directLow = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['low'] = low;
    _data['mid'] = mid;
    _data['high'] = high;
    _data['market'] = market;
    _data['directLow'] = directLow;
    return _data;
  }
}

class ReverseHolofoil {
  ReverseHolofoil({
    required this.low,
    required this.mid,
    required this.high,
    required this.market,
    this.directLow,
  });
  late final double low;
  late final double mid;
  late final double high;
  late final double market;
  late final Null directLow;

  ReverseHolofoil.fromJson(Map<String, dynamic> json) {
    low = json['low'];
    mid = json['mid'];
    high = json['high'];
    market = json['market'];
    directLow = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['low'] = low;
    _data['mid'] = mid;
    _data['high'] = high;
    _data['market'] = market;
    _data['directLow'] = directLow;
    return _data;
  }
}

class Cardmarket {
  Cardmarket({
    required this.url,
    required this.updatedAt,
    required this.prices,
  });
  late final String url;
  late final String updatedAt;
  late final Prices prices;

  Cardmarket.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    updatedAt = json['updatedAt'];
    prices = Prices.fromJson(json['prices']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['updatedAt'] = updatedAt;
    _data['prices'] = prices.toJson();
    return _data;
  }
}
