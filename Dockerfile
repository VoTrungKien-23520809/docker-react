# --- Giai đoạn 1: Build Phase (Người xây dựng) ---
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# --- Giai đoạn 2: Run Phase (Người vận hành) ---
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html