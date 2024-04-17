enum FormText {
  signInButton("Giriş Yap"),
  signUpButton('Kayıt Ol'),
  dontHaveAccount('Hesabınız yok mu?'),
  haveAccount('Hesabınız var mı?'),
  emailLabel('E-Posta Adresi'),
  emailHint('Lütfen E-Posta Adresinizi Girin'),
  usernameLabel('Kullanıcı Adı'),
  usernameHint('Lütfen Kullanıcı Adınızı Girin'),
  passwordLabel('Şifre'),
  passwordHint('Lütfen Şifrenizi Girin'),
  confirmPasswordLabel('Şifreyi Onayla'),
  confirmPasswordHint('Lütfen Şifrenizi Tekrar Girin'),
  // --------------------------------
  listOwner('Ev Sahipleri Listesi'),
  listTenant('Kiracılar Listesi'),
  //
  createApartman('Yeni Apartman Oluştur'),
  createDaire('Yeni Daire Oluştur'),
  createTenant('Yeni Kiracı Oluştur'),
  createOwner('Yeni EvSahibi Oluştur'),
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
  // -------------------------------------
  individualName('Kişi Adı ve Soyadı'),
  companyName('Firma Adı'),
  customerEmail('E-Posta Adresi'),
  customerPhone('Telefon Numarası'),
  customerAdres('Adres'),
  individualIndentityNo('T.C. Kimlik Numarası'),
  companyIdentityNo('Vergi Numarası'),
  // -------------------------------------
  ;

  final String text;
  const FormText(this.text);
}
