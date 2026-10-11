**English: [README.md](README.md)**

# Dark SP-213 hoparlörden çok daha iyi ses

Dark SP-213 aldıysanız muhtemelen siz de fark etmişsinizdir: bas her şeyi bastırıyor, ses boğuk ve sanki kutunun içinden geliyor, filmde konuşmaları anlamak için sesi sürekli açıp kısıyorsunuz. Hoparlörün üstünde bas ya da tiz düğmesi de yok, yani hoparlörden düzeltmenin bir yolu yok. Hepsiburada yorumlarında da en sık yapılan şikâyet bu.

Bu proje sorunu Windows tarafında, ücretsiz [Equalizer APO](https://sourceforge.net/projects/equalizerapo/) programıyla çözüyor. Birkaç dakikalık kurulumdan sonra:

- **Uğultu gidiyor.** Bas yerinde duruyor ama artık her şeyi bastırmıyor.
- **Vokaller ve diyaloglar net duyuluyor.**
- **Tizler açılıyor**, ses daha detaylı geliyor.
- **Yüksek seste daha az bozuluyor.** Küçük amfi, subwoofer'ın zaten çalamadığı derin basa güç harcamayı bırakıyor.

![Üç hazır ayarın ekolayzer eğrileri](docs/eq-curves.svg)

Hoparlörde hiçbir şeyi değiştirmiyorsunuz, ayar tamamen bilgisayarda. Bu yüzden sadece Windows'ta işe yarar; hoparlörü telefona ya da TV'ye bağladığınızda etkisi olmaz.

## Hızlı kurulum

1. [Equalizer APO](https://sourceforge.net/projects/equalizerapo/)'yu kurun. Kurulum sonunda açılan **Device Selector** penceresinde hoparlörün takılı olduğu çıkışı işaretleyin ve bilgisayarı yeniden başlatın.
2. [Son sürüm](https://github.com/Z4RU5/dark-sp213-eq/releases/latest) sayfasından `dark-sp213-eq-v….zip` dosyasını indirin. ZIP'e sağ tıklayıp **Tümünü ayıkla** deyin.
3. Açılan klasörde `install.ps1` dosyasına sağ tıklayıp **PowerShell ile Çalıştır**'ı seçin (Windows 11'de **Daha fazla seçenek göster** altında olabilir) ve bir ayar seçin.

Adım adım anlatım ve sorun giderme için: **[REHBER.md](REHBER.md)**

## Hazır ayarlar

| Ayar | Kimin için |
| --- | --- |
| **Dengeli** (önerilen) | Sesler net, bas var ama uğultu yok. Müzik, video ve oyun için çoğu kişiye en iyisi bu. |
| **Biraz daha bas** | Alt taraf biraz daha dolgun, ses yine net. |
| **Bol bas** | Bası törpülemek yerine artırır. Gümbür gümbür ama yüksek seste bozulabilir. |

Ayarı istediğiniz zaman değiştirebilirsiniz: `install.ps1`'i tekrar çalıştırmanız yeterli. 4 numaralı seçenek ayarı tamamen kaldırır.

## `install.ps1` ne yapıyor?

Kısa ve okunabilir bir betik; içini merak ederseniz Not Defteri ile açıp bakabilirsiniz. Yaptığı şey şu:

1. Seçtiğiniz ayarı Equalizer APO'nun ayar klasörüne `dark-sp213.txt` adıyla kopyalıyor.
2. Equalizer APO'nun `config.txt` dosyasının bir kez yedeğini alıyor (`config.before-dark-sp213.txt`), sonra onu `dark-sp213.txt`'yi kullanacak şekilde düzenliyor. Equalizer APO ilk kurulduğunda `config.txt` içinde örnek bir bas yükseltmesi geliyor; silinmezse bu ayarın üstüne binip uğultuyu geri getirirdi.

Bu kadar. İnternetten bir şey indirmiyor, bir şey kurmuyor, arka planda çalışan bir şey bırakmıyor. Yönetici iznini sadece Equalizer APO'nun klasörüne yazamazsa istiyor. Betik çalıştırmak istemezseniz [elle kurulum](REHBER.md#kurulum-dosyası-çalışmazsa-elle-kurulum) üç adımda bitiyor.

## Dengeli ayar ne yapıyor?

Üretici SP-213'ün frekans aralığını 150 Hz – 20 kHz olarak veriyor; yani 5 W'lık subwoofer gerçek derin bası zaten çalamıyor. Buna rağmen fabrika ayarında bas bölgesi epey şişirilmiş, sonuç olarak bas yerine uğultu duyuyorsunuz.

| Ne değişiyor | Neden |
| --- | --- |
| 65 Hz altı kesiliyor | Subwoofer burayı çalamıyor, sadece bozulmaya yol açıyor |
| 100 Hz'de −2 dB, 150 Hz'de −5 dB | Asıl sorun olan uğultuyu alıyor |
| 320 Hz'de −2,5 dB | Boğukluğu, "kutudan gelen ses" hissini alıyor |
| 2,5 kHz'de +2 dB | Vokaller ve konuşmalar |
| 7,5 kHz üstü +4 dB | Detay ve ferahlık |
| Genel ses −5 dB | Yükseltmeler patlama yapmasın diye pay bırakıyor. Aradaki farkı hoparlörün ses düğmesinden açın. |

## Birkaç ipucu daha

- **Hiçbir şey çalmıyorken ince bir cızırtı mı var?** Hoparlörün USB güç kablosunu bilgisayar yerine bir telefon şarj adaptörüne ya da modemin USB girişine takın. Yorumlarda bunu deneyenler cızırtının kesildiğini söylüyor.
- **Subwoofer'ı duvar dibine ya da köşeye koymayın.** Duvar bası daha da uğuldatır. Bazı kullanıcılar üç parçayı yan yana koyunca sesin daha net geldiğini söylüyor.
- **Windows ses seviyesini yüksekte (%80-100) bırakın**, sesi hoparlörün düğmesinden ayarlayın.

## Başka hoparlörler

Benzer ucuz 2+1 setlerde de (Dark SP-211, SP-214 vb.) muhtemelen işe yarar ama denenmedi. Denerseniz nasıl olduğunu [Issues](../../issues) kısmından yazın, başkalarının da işine yarar.

## Lisans

[MIT](LICENSE). İstediğiniz gibi kullanın, değiştirin, paylaşın.
