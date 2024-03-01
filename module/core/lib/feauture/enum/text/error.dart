enum AppError {
  notValidUserLogin('Kullanıcı Adı yada Şifre yanlış'),
  emptyUserName('Kullanıcı Adı Geçersiz'),
  emptyPassword('Kullanıcı Şifresi Geçersiz'),
  emptyEmailAddress('Kullanıcı Mail Adresi Geçersiz'),
  notValidEmailAddress('Girilen Mail Adresi Uygun Değil'),
  notConfirmPassword('Kullanıcı Şifresi Eşleşmiyor'),
  notValidMediumPassword(
    'Şifre En az 8 Karakter , 1 Harf ve 1 Sayı olmalıdır.',
  ),
  errorLoginUser('Kullanıcı Giriş Yaparken Sorun Oluştu');

  final String text;
  const AppError(this.text);
}
