enum Category {
  //all,
  Icecream,
  Cake,
  Bubbletea,
}

class Product {
  const Product({
    required this.category,
    required this.isOpen,
    required this.name,
    required this.rating,
    required this.path,
    required this.distance,
    required this.detail,
  });

  final Category category;

  final String isOpen;
  final String name;
  final String rating;
  final String path;
  final String distance;
  final String detail;
}

// class Images1 {
//   const Images1({
//     required this.path1,
//     required this.path2,
//   });

//   final String path1;
//   final String path2;
// }
