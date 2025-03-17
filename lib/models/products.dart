class Products {
  final String name;
  final int listTag;

  Products({required this.name, required this.listTag});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'list_tag': listTag,
    };
  }

  @override
  String toString() {
    return 'Products{name: $name, listTag: $listTag}';
  }
}
