enum AppForm {
  signInButton("Sign In"),
  signUpButton('Sign Up'),
  usernameLabel('Username'),
  usernameHint('Please Enter UserName'),
  passwordLabel('Password'),
  passwordHint('Please Enter Password'),
  confirmPasswordLabel('Confirm Password'),
  confirmPasswordHint('Please Enter Confirm Password'),
  yoneticigirisi('Yönetici Girişi'),
  yoneticikayitalani('Yönetici Kayıt Alanı'),
  showPassword('Şifre göster'),
  joinUs('Join Us');

  final String text;
  const AppForm(this.text);
}
