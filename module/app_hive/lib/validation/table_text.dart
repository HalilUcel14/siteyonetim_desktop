enum TableText {
  createApartman('Yeni Apartman Oluştur'),
  createDaire('Yeni Daire Oluştur'),
  // -------------------------------------
  apartmanName('Apartman İsmi'),
  apartmanAdres('Apartman Adresi'),
  apartmanFloor('Apartman Kat Sayısı'),
  apartmanFlats('Apartman Daire Sayısı'),
  apartmanYear('Apartman Yapım Yılı'),
  isHaveElevator('Apartman Asansörü Var mı?'),
  // -------------------------------------
  daireFloor('Daire Katı'),
  daireNumber('Daire Numarası'),
  daireSquare('Daire Metrekare'),
  daireNetSquare('Daire Net Metrekare'),
  daireRoom('Daire Oda Sayısı'),
  daireTenant('Daire Kiracısı'),
  daireOwner('Daire Sahibi'),
  daireIsOwner('Daire Sahibi var mı?'),
  daireIsRented('Daire Kiralık mı?'),
  ;

  final String text;
  const TableText(this.text);
}
