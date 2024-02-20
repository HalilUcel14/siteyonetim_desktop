enum AppError {
  notValidUserLogin('Kullanıcı Adı yada Şifre yanlış'),
  emptyUserName('Kullanıcı Adı Geçersiz'),
  emptyPassword('Kullanıcı Şifresi Geçersiz'),
  notConfirmPassword('Kullanıcı Şifresi Eşleşmiyor'),
  ;

  final String text;
  const AppError(this.text);
}
