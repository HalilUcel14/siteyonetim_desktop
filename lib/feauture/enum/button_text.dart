enum ButtonText {
  signIn('Giriş Yap'),
  signUp('Kayıt Ol'),
  forgotPassword('Şifremi Unuttum'),
  send('Gönder'),
  continue_('Devam Et'),
  save('Kaydet'),
  cancel('İptal'),
  close('Kapat'),
  delete('Sil'),
  edit('Düzenle'),
  add('Ekle'),
  update('Güncelle'),
  create('Oluştur'),
  search('Ara'),
  filter('Filtrele'),
  clear('Temizle'),
  select('Seç'),
  selectAll('Hepsini Seç'),
  deselectAll('Hepsini Kaldır'),
  ;

  final String text;
  const ButtonText(this.text);
}
