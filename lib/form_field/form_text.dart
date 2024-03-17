enum FormText {
  signInButton("Giriş Yap"),
  signUpButton('Kayıt Ol'),
  emailLabel('E-Posta Adresi'),
  emailHint('Lütfen E-Posta Adresinizi Girin'),
  usernameLabel('Kullanıcı Adı'),
  usernameHint('Lütfen Kullanıcı Adınızı Girin'),
  passwordLabel('Şifre'),
  passwordHint('Lütfen Şifrenizi Girin'),
  confirmPasswordLabel('Şifreyi Onayla'),
  confirmPasswordHint('Lütfen Şifrenizi Tekrar Girin'),
  ;

  final String text;
  const FormText(this.text);
}
