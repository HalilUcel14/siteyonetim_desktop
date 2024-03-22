enum FormError {
  // Password
  emptyPassword('Şifre boş olamaz'),
  shortPassword('Şifre en az 8 karakter olmalıdır'),
  notValidPassword(
    'Şifre deseni (en az 8 karakter, en az bir rakam ve bir harf) olmalıdır',
  ),
  notFindActiveUser('Aktif Kullanıcı Bulunamadı'),
  notValidConfirmPassword('Şifreler eşleşmiyor'),
  // Email
  emptyEmail('E-Posta boş olamaz'),
  notValidEmail('E-Posta Adresi geçerli değil'),

  // Username
  emptyUserName('Kullanıcı Adı boş olamaz'),
  shortUsername('Kullanıcı Adı en az 3 karakter olmalıdır'),
  // Sign
  errorUserSign('Kullanıcı Adı veya Şifre Hatalı olabilir'),
  errorUserRegister('Kullanıcı Adı veya Email daha önce kullanılmış olabilir'),
  // Date
  notValidDate('Girilen Değer Tarih olmalıdır. Örn: (2021-01-01)'),
  dateField('Bu alan tarih olmalıdır'),
  minimumDate('Bu alan en az 1950 yılından küçük olamaz'),
  // Text Field
  emptyField('Bu alan boş olamaz'),
  shortField('Bu alan en az 3 karakter olmalıdır'),
  integerField('Bu alan tamsayı olmalıdır'),

  positiveInteger('Bu alan pozitif tamsayı olmalıdır'),
  harmonyFailed('Girilen değer Apartman ile uyumlu değil'),
  ;

  final String text;
  const FormError(this.text);
}
