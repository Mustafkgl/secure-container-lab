# 🛡️ Secure Container Lab: From 1675 Vulnerabilities to Zero

Bu proje, modern **DevSecOps** prensipleri kullanılarak, güvensiz bir konteyner yapısının nasıl **"Hardened" (Sertleştirilmiş)** ve üretim ortamına uygun hale getirildiğini gösteren bir laboratuvar çalışmasıdır.

## 🎯 Projenin Amacı

Standart Docker imajlarının (örn: `node:latest`) barındırdığı **1600+ güvenlik açığını** analiz etmek ve **Google Distroless** mimarisi ile saldırı yüzeyini (Attack Surface) minimize etmektir.

---

## 📊 Sonuçlar: Öncesi ve Sonrası

**Trivy** güvenlik tarayıcısı ile yapılan analiz sonuçları:

| Durum                     | Taban İmaj                   | Toplam Açık (CVE) | Kritik/Yüksek |
| :------------------------ | :--------------------------- | :---------------: | :-----------: |
| ❌ **Öncesi (Standart)**  | `node:latest` (Debian Full)  |     **1675**      |    **211**    |
| ✅ **Sonrası (Hardened)** | `gcr.io/distroless/nodejs22` |      **12**       |     **0**     |

> **Başarı:** Saldırı yüzeyi **%99.3** oranında azaltıldı.

---

## 🛠️ Uygulanan Mühendislik Adımları

### 1. Multi-Stage Builds (Çok Aşamalı Derleme)

Tek bir monolitik yapı yerine, "Builder" ve "Runtime" aşamaları ayrıldı. Derleme araçları (GCC, Python, NPM) son imajda bırakılmadı.

### 2. Distroless Mimarisi

İşletim sistemi olmayan (OS-less) imaj kullanıldı.

- 🚫 **Shell Yok:** `/bin/sh` veya `/bin/bash` olmadığı için RCE (Uzaktan Kod Yürütme) saldırıları engellendi.
- 🚫 **Paket Yöneticisi Yok:** `apt/apk` olmadığı için saldırgan yeni araç indiremez.

### 3. Runtime Hardening (Çalışma Zamanı Sertleştirme)

Konteyner, "en az ayrıcalık" ilkesine göre sınırlandırıldı:

- **Non-Root User:** Uygulama `root` yerine kısıtlı kullanıcı ile çalışıyor.
- **Read-Only Filesystem:** Kök dosya sistemi salt okunur yapıldı.
- **Capabilities Dropped:** Tüm Linux yetenekleri (`ALL`) düşürüldü.

---

## 🚀 Nasıl Çalıştırılır?

Bu güvenli yapıyı test etmek için:

```bash
# 1. İmajı Oluştur
docker build -t secure-app:v1 .

# 2. Salt Okunur ve Kısıtlı Yetkilerle Başlat
docker run --rm -d --read-only --cap-drop=ALL --user nonroot -p 3000:3000 secure-app:v1
```

<!-- updated 22 -->
<!-- updated 23 -->
<!-- updated 24 -->
<!-- updated 25 -->
<!-- updated 26 --># test

<!-- updated 22 -->
<!-- updated 23 -->
<!-- updated 24 -->
<!-- updated 25 -->
<!-- updated 26 -->
<!-- updated 66 -->
<!-- updated 67 -->
<!-- updated 68 -->
<!-- updated 69 -->
<!-- updated 70 -->
<!-- updated 71 -->
<!-- updated 72 -->
<!-- updated 73 -->
<!-- updated 74 -->