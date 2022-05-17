class DtoEmpresa {
  DtoEmpresa({
    this.id,
    this.nombre,
    this.latitude,
    this.longitud,
  });

  int id;
  String nombre;
  double latitude;
  double longitud;

  factory DtoEmpresa.fromJson(Map<String, dynamic> json) => DtoEmpresa(
        id: json["id"],
        nombre: json["nombre"],
        latitude: json["latitude"].toDouble(),
        longitud: json["longitud"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "latitude": latitude,
        "longitud": longitud,
      };
}
