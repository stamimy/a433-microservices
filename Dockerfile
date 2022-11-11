# Mengambil base image dari Docker Hub atau dari lokal
FROM node:14-alpine

# membuat directory baru dan menjadikannya sebagai working directory. 
# Dengan begitu, instruksi apa pun yang kita tulis di baris berikutnya, 
# akan dieksekusi di dalam directory /app ini
WORKDIR /app

# Menyalin semua berkas yang ada di local working directory saat ini
# Tanda titik pertama menunjukkan source, sementara tanda titik kedua adalah destination.
COPY . .

# Menentukan beberapa environment variables
ENV NODE_ENV=production DB_HOST=item-db

# Menginstal dependencies untuk production dan kemudian build aplikasi.
RUN npm install --production --unsafe-perm && npm run build

# Saat container diluncurkan, jalankan server dengan perintah
CMD ["npm", "start"]

# Menentukan port yang digunakan oleh aplikasi
EXPOSE 8080