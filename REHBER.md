**English: [TUTORIAL.md](TUTORIAL.md)**

# Rehber: Dark SP-213 ekolayzer ayarının kurulumu

Yaklaşık 10 dakika sürer, bir kez yeniden başlatma gerekir. Ses ayarlarından hiç anlamasanız da olur.

## 1. Hoparlörü doğru bağlayın

- **Ses kablosu (3,5 mm jak):** Masaüstü bilgisayarda kasanın **arkasındaki yeşil girişe** takın. Ön paneldeki girişler genelde daha çok parazit yapar. Laptopta kulaklık girişini kullanın.
- **USB kablosu:** Sadece hoparlöre elektrik verir. Hiçbir şey çalmıyorken ince bir cızırtı duyuyorsanız bilgisayar yerine telefon şarj adaptörüne ya da modemin USB girişine takın.

## 2. Hoparlörün bağlı olduğu çıkışın adını bulun

**Ayarlar > Sistem > Ses** yolunu açın. **Çıkış** bölümünde seçili cihazın adını not edin; örneğin **Hoparlör (Realtek(R) Audio)**. Bir sonraki adımda bu cihazı seçeceksiniz.

## 3. Equalizer APO'yu kurun

1. Programın resmi sayfasından indirin: https://sourceforge.net/projects/equalizerapo/ (yeşil **Download** düğmesi).
2. Kurulumu çalıştırın, hiçbir şeyi değiştirmeden ilerleyin.
3. Kurulumun sonunda **Device Selector** penceresi açılır. **Playback devices** sekmesinde 2. adımda not ettiğiniz cihazın kutusunu işaretleyin. Başka hiçbir şeye dokunmadan **OK**'e basın.
4. **Bilgisayarı yeniden başlatın.** Equalizer APO ancak yeniden başlattıktan sonra devreye girer.

Equalizer APO'nun Türkçe arayüzü yok, pencereleri İngilizce. Bu rehberde gereken her düğmenin adı geçiyor, merak etmeyin.

## 4. Bu ayarı indirin

1. [Son sürüm](https://github.com/Z4RU5/dark-sp213-eq/releases/latest) sayfasını açın ve **Assets** kısmındaki `dark-sp213-eq-v….zip` dosyasını indirin.
2. İnen ZIP dosyasına sağ tıklayıp **Tümünü ayıkla** deyin. ZIP'in içinden doğrudan bir şey çalıştırmayın, önce mutlaka ayıklayın.

## 5. Kurulum dosyasını çalıştırın

1. Ayıkladığınız klasörde `install.ps1` dosyasına sağ tıklayıp **PowerShell ile Çalıştır**'ı seçin. Windows 11'de önce **Daha fazla seçenek göster**'e tıklamanız gerekebilir.
2. Güvenlik uyarısı çıkarsa **Bir kez çalıştır** (`R`) seçeneğini seçin. Windows yönetici izni isterse **Evet** deyin.
3. Ayarı seçin: Başlangıç için en iyisi **1** (Dengeli).
4. Ekranda "Tamam" yazısını gördüğünüzde ayar devrede demektir. Yeniden başlatmaya gerek yok.

Ses öncekinden biraz kısık gelecek. Bu bilerek yapıldı, yükseltmeler bozulma yapmasın diye. Hoparlörün düğmesinden biraz açın, o kadar.

## 6. Farkı duyun

Başlat menüsünde Equalizer APO klasöründen **Configuration Editor**'ı açın. `Include: dark-sp213.txt` yazan bir satır göreceksiniz. Satırın solundaki yuvarlak güç düğmesi ayarı açıp kapatıyor; müzik çalarken basıp önce/sonra farkını dinleyebilirsiniz. İşiniz bitince **açık** bırakmayı unutmayın.

## İnce ayar

- **Farklı bir ses istiyorsanız:** `install.ps1`'i tekrar çalıştırıp başka bir ayar seçin.
- **Kendi değerlerinizi girmek isterseniz:** Not Defteri'ni **yönetici olarak** açın, ardından `C:\Program Files\EqualizerAPO\config\dark-sp213.txt` dosyasını açın. `Gain` yazan değerler dB cinsinden; eksi ne kadar büyükse o frekans o kadar kısılır. Örneğin 150 Hz satırındaki `-5 dB`'yi `-3 dB` yaparsanız bas biraz geri gelir. Kaydettiğiniz anda değişiklik devreye girer.

## Kurulum dosyası çalışmazsa: elle kurulum

1. `presets` klasöründen istediğiniz ayar dosyasını `C:\Program Files\EqualizerAPO\config\` klasörüne kopyalayın ve adını `dark-sp213.txt` yapın.
2. Aynı klasördeki `config.txt` dosyasını Not Defteri ile (yönetici olarak) açın, içindeki her şeyi silin ve sadece şu satırı yazın:
   ```
   Include: dark-sp213.txt
   ```
3. Kaydedin. Ayar hemen devreye girer.

## Sorun giderme

**Seste hiçbir değişiklik olmadı**
- Büyük ihtimalle yanlış cihazı işaretlediniz. Başlat menüsünde Equalizer APO klasöründen **Device Selector**'ı açın, hoparlörün bağlı olduğu çıkışı işaretleyin, OK deyin ve bilgisayarı yeniden başlatın.
- Hâlâ değişmediyse: Device Selector'da **Troubleshooting options** kısmını açın, **Install as SFX/EFX (experimental)** kutusunu işaretleyin, OK deyip yeniden başlatın. Bazı Realtek sürücülerinde bu gerekiyor.
- **Ayarlar > Sistem > Ses** kısmında hoparlörünüze tıklayın ve **Ses geliştirmeleri** seçeneğinin **Kapalı** değil, **Cihaz varsayılan efektleri** olduğundan emin olun. Bu seçenek kapalıyken Equalizer APO çalışmaz.

**Önce çalışıyordu, Windows ya da sürücü güncellemesinden sonra gitti**
Güncellemeler bazen Equalizer APO'nun bağlantısını koparıyor. Device Selector'ı açıp cihazı tekrar işaretleyin ve yeniden başlatın.

**Ses kısıldı**
Normal, 5. adımda anlatıldığı gibi. Hoparlörün düğmesinden açın.

**Yüksek seste bozuluyor**
Hoparlörün düğmesini biraz kısın ya da Dengeli ayara geçin. Sonuçta 11 W'lık bir hoparlör, bir sınırı var.

**Hiçbir şey çalmıyorken cızırtı var**
Bunun ekolayzerle ilgisi yok. Hoparlörün USB kablosunu bilgisayar yerine telefon şarj adaptörüne ya da modeme takın.

**"Bu sistemde betik çalıştırma devre dışı" hatası**
`install.ps1` dosyasına sağ tıklayıp **Özellikler**'i açın, en alttaki **Engellemeyi kaldır** kutusunu işaretleyin, Tamam deyip tekrar deneyin. Yine olmazsa yukarıdaki elle kurulumu yapın.

**Tek taraftan ses geliyor ya da kabloyu oynatınca cızırdıyor**
Bu kablo veya jakla ilgili, ekolayzerle değil. Jakı çıkarıp sıkıca tekrar takın ya da başka bir girişi deneyin.

## Kaldırma

`install.ps1`'i çalıştırıp **4**'ü seçin. Her şeyi tamamen kaldırmak isterseniz **Ayarlar > Uygulamalar** kısmından Equalizer APO'yu kaldırın.
