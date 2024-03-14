enum FormError {
  // Password
  emptyPassword('Şifre boş olamaz'),
  shortPassword('Şifre en az 8 karakter olmalıdır'),
  notValidPassword(
    'Şifre deseni (en az 8 karakter, en az bir rakam ve bir harf) olmalıdır',
  ),

  errorUserSign('Kullanıcı Adı veya Şifre Hatalı olabilir'),
  emptyUserName('Kullanıcı Adı boş olamaz'),

  emptyEmail('E-Posta boş olamaz'),
  notValidEmail('E-Posta Adresi geçerli değil'),

  notValidConfirmPassword('Şifreler eşleşmiyor'),
  notValidDate('Girilen Değer Tarih olmalıdır. Örn: (2021-01-01)'),
  ;

  final String text;
  const FormError(this.text);
}
