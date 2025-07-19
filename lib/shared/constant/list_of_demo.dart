class ListOfDemo {
  String? name;
  int? id;
  ListOfDemo({this.name, this.id});
}

List<ListOfDemo> filterList = [
  ListOfDemo(name: 'All'),
  ListOfDemo(name: 'Bouquet Of Flowers'),
  ListOfDemo(name: 'Flower Arrangemenet'),
];

List<ListOfDemo> sortList = [
  ListOfDemo(name: 'All', id: 0),
  ListOfDemo(name: 'Pure veg', id: 1),
  ListOfDemo(name: 'Offers', id: 2),
  ListOfDemo(name: 'favourites', id: 3),
];

class AddressList {
  String? mapAddress;
  String? typeAddress;
  bool? isDefault;

  AddressList({this.isDefault, this.mapAddress, this.typeAddress});
}

List<ListOfDemo> custDates = [
  ListOfDemo(name: 'Sunday', id: 0),
  ListOfDemo(name: 'Monday', id: 1),
  ListOfDemo(name: 'Tuesday', id: 2),
  ListOfDemo(name: 'Wednesday', id: 3),
  ListOfDemo(name: 'Thursday', id: 3),
  ListOfDemo(name: 'Friday', id: 3),
  ListOfDemo(name: 'Saturday', id: 3),
];
final List<String> foodItems = [
  'Snacks',
  'Daleem',
  'Taboola',
  'Biriyani',
  'Fatoosh',
  'Mutabal',
];
