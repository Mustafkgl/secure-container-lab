# --- Aşama 1: Builder (İnşaat Sahası) ---
# Tam teşekküllü bir Node.js imajı kullanıyoruz ama sadece derleme için.
FROM node:22-bookworm-slim AS builder

WORKDIR /app

# Sadece bağımlılık dosyalarını kopyala (Cache optimizasyonu için)
COPY package.json ./

# Bağımlılıkları yükle
RUN npm install

# Kaynak kodun geri kalanını kopyala
COPY server.js .

# --- Aşama 2: Runtime (Distroless - Temiz Ortam) ---
# İçinde işletim sistemi olmayan, sadece Node.js çalıştıran Google imajı
FROM gcr.io/distroless/nodejs22-debian12
