class Empresa {
  final int id;
  final String name;
  final double latitude;
  final double longitud;

  const Empresa({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitud,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'latitude': latitude,
      'longitud': longitud,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Empresa{id: $id, name: $name, latitude: $latitude, longitud: $longitud}';
  }
}
