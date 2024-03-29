class Contact {
  int? id;
  String namaDepan;
  String namaBelakang;
  String noTelepon;

  Contact({
    this.id,
    required this.namaDepan,
    required this.namaBelakang,
    required this.noTelepon,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'namaDepan': namaDepan,
      'namaBelakang': namaBelakang,
      'noTelepon': noTelepon,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'],
      namaDepan: map['namaDepan'],
      namaBelakang: map['namaBelakang'],
      noTelepon: map['noTelepon'],
    );
  }
}
