# 🧠 TARS AI Fusion: Çoklu Model Yapay Zeka Arayüzü Kurulum Rehberi

Bu proje; birden fazla yapay zeka modelini (DeepSeek, Gemini, Qwen, Claude vb.) **OpenRouter**, **9router** ve **Open WebUI** kullanarak tek bir çatı altında toplamayı ve "Fusion" (Gelişmiş Harmanlama) modülüyle modelleri birbirine entegre ederek maksimum performans almayı hedefler.

## 🚀 Özellikler
* **Tek API ile Çoklu Model:** OpenRouter sayesinde onlarca modeli tek API ile yönetme.
* **Fusion (Harmanlama) Teknolojisi:** 9router üzerinden "İşçi" modellerin verilerini "Hakem (Judge)" modele onaylatarak halüsinasyonu sıfıra indirme.
* **Modern Arayüz:** Open WebUI ile hızlı, mobil uyumlu ve ChatGPT benzeri bir kullanıcı deneyimi.
* **Esnek Erişim:** Yerel ağdan (Localhost) veya VDS üzerinden 7/24 erişim imkanı.

## 📋 Gereksinimler
Kuruluma başlamadan önce sisteminizde aşağıdakilerin yüklü olduğundan emin olun:
* [Python 3.11](https://www.python.org/downloads/release/python-3110/) (Open WebUI için gereklidir)
* [Node.js](https://nodejs.org/en/download) (9router kurulumu için gereklidir)
* **İşletim Sistemi:** Windows veya Zorin OS / Debian tabanlı Linux dağıtımları.
* *(Opsiyonel)* Sisteme her yerden erişmek istiyorsanız bir VDS (Sanal Sunucu) önerilir.

---

## 🛠️ Kurulum Adımları

### Adım 1: OpenRouter Yapılandırması
1.  [OpenRouter](https://openrouter.ai/) adresine gidin ve kayıt olun.
2.  Profilinizden **API** bölümüne girerek yeni bir API anahtarı (key) oluşturun.
3.  *(Opsiyonel)* Premium modelleri kullanacaksanız **Kredi Ekle** bölümünden bakiye yükleyin. Ücretsiz modeller (Free) için bu adımı atlayabilirsiniz.

### Adım 2: Open WebUI Kurulumu
Arayüz olarak kullanacağımız Open WebUI'yi sistemimize kuruyoruz.

**Windows Kullanıcıları İçin:**
CMD'yi (Komut İstemi) yönetici olarak çalıştırın ve aşağıdaki komutu girin:
`python -m pip install open-webui`

*Not: İndirme işlemi bağlantı hızınıza göre 5-10 dakika sürebilir. Eğer komut hata verirse `cd C:\Users\KULLANICI_ADINIZ\AppData\Local\Programs\Python\Python311\Scripts` dizinine giderek komutu tekrar deneyin.*

**Linux Kullanıcıları İçin:**
Terminale aşağıdaki komutu girin:
`pip3 install open-webui`

Kurulum bittikten sonra sunucuyu başlatmak için:
`open-webui serve`

Yükleme tamamlandığında tarayıcınızdan `http://localhost:8080` adresine giderek Open WebUI paneline ulaşın ve bir yönetici hesabı oluşturun.

### Adım 3: 9router Kurulumu (Fusion İçin)
Çoklu model harmanlaması yapmak için [9router](https://9router.com/) sistemini kurmamız gerekiyor.
CMD veya Terminali yönetici haklarıyla açıp şu komutları sırasıyla çalıştırın:
`npm install -g 9router`  
`9router`

1.  Açılan menüden **Web UI** seçeneğini seçin.
2.  Tarayıcınızda açılan ekranda varsayılan şifre olan `123456` ile giriş yapın (Daha sonra değiştirmeyi unutmayın).
3.  **Providers** sekmesine gidin, **OpenRouter**'ı seçin ve 1. Adımda aldığınız OpenRouter API anahtarınızı buraya yapıştırıp kaydedin.

### Adım 4: Modelleri Seçme ve Fusion (Harmanlama) Ayarları
1.  9router arayüzünde **Models** kısmına gelin.
2.  OpenRouter üzerinden kullanmak istediğiniz modelleri aratın (Örn: `deepseek/deepseek-v4-pro`). Bu kimlik adını kopyalayın.
3.  9router'da **Providers > OpenRouter > Add Model** sekmesine yapıştırıp ekleyin. Modeli test ederek çalıştığından emin olun.
4.  *[Artificial Analysis](https://artificialanalysis.ai/models)* üzerinden güncel model benchmarklarını inceleyerek 3 veya 4 adet sağlam işçi model belirleyin.

### Adım 5: TARS Fusion Combo'larını Oluşturma
9router üzerinde **Combos** sekmesine gelip **Create Combo** diyerek modellerinizi harmanlayın. Modeli oluşturduktan sonra `Fusion` modunu aktif etmeyi unutmayın.

⚠️ **Önemli Not (Maliyet Uyarısı):** Hakem (Judge) modeliniz, diğer alt modellerden gelen devasa verileri okuyup özetleyeceği için "Input (Girdi)" maliyeti yüksek olabilir. Maliyetleri düşük tutmak için Hakem modeli nispeten ucuz ama zeki bir modelden (Örn: DeepSeek V4 Pro) seçin.

**Tasararladığım Güncel TARS Modelleri (06.07.2026 İtibarıyla)**

| Ordu Adı | Ortalama Maliyet | İşçi Modeller & Aktif Modları | Nihai Hakem (Judge) |
| :--- | :--- | :--- | :--- |
| **Tars-Flash-Lite** | ~0.40 Cent | DeepSeek V4 Flash + Qwen3 Coder Flash + Mimo-V2.5-Pro | DeepSeek V4 Pro |
| **Tars-Flash** | ~0.70 Cent | Gemini 3 Flash + Nex-N2-Pro + Mimo-V2.5-Pro + Qwen3 Coder Flash | DeepSeek V4 Pro |
| **Tars** | ~1.40 Cent | Gemini 3.5 Flash + Nex-N2-Pro + Mimo-V2.5-Pro + Qwen3 Coder | DeepSeek V4 Pro |
| **Tars-Pro** | ~3.00 - 4.00 Cent | z-ai/glm-5.2 (MAX) + nex-agi/nex-n2-pro (MAX) + Gemini 3.5 Flash + Mimo-V2.5-Pro | DeepSeek V4 Pro |
| **Tars-Ultra** | ~18.00 - 24.00 Cent| Claude Sonnet 5 (Normal) + z-ai/glm-5.2 (MAX) + Gemini 3.5 Flash | DeepSeek V4 Pro |

*Not: Model kapasiteleri geliştikçe bu tabloların periyodik olarak güncellenmesi gerekmektedir. Verilen maliyet değerleri soru başına ortalama değerlerdir, değişkenlik gösterebilir.*


### Adım 6: Sistemleri Birbirine Bağlama ve Erişime Açma
1.  9router arayüzünden **Endpoint** kısmına giderek **API Key** ve **URL**'yi kopyalayın.
2.  Open WebUI paneline (`localhost:8080`) dönün.
3.  **Profil > Yönetici Paneli > Ayarlar > Bağlantılar** yolunu izleyin.
4.  OpenAI API kısmından yeni bir alan ekleyip 9router'dan aldığınız URL ve API Key'i yapıştırarak kaydedin.

**Ağı Dışa Açma (Opsiyonel):**
Aynı ağdaki diğer cihazlardan (Tablet/Telefon) erişmek için CMD/Terminal'e `ipconfig` (Zorin OS için `ip a`) yazıp yerel IPv4 adresinizi (Örn: `192.168.x.x`) öğrenin. Tarayıcıdan `192.168.x.x:8080` yazarak telefonunuzdan sisteme girebilirsiniz. Uzak erişim için DuckDNS veya Cloudflare Tunnels kullanabilirsiniz.

---

### ⚙️ Otomasyon (Tek Tıkla Başlatma)
Sistemi her seferinde manuel başlatmak yerine, bu repoda bulunan betik dosyalarını kullanarak Open WebUI ve 9router'ı aynı anda çalıştırabilirsiniz.

*   **Windows Kullanıcıları:** Repodaki `start.bat` dosyasına çift tıklamanız yeterlidir.
*   **Linux Kullanıcıları:** Terminalde `./start.sh` komutunu çalıştırın (öncesinde `chmod +x start.sh` ile yetki verdiğinizden emin olun).
