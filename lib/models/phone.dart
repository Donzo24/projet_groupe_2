class Phone {
  String id;
  String name;
  Map<dynamic, dynamic>? data;

  Phone({required this.id, required this.name, this.data});

  factory Phone.fromJson(json) {
    return Phone(
      id: json['id'],
      name: json['name'],
      data: json['data']
    );
  }
}