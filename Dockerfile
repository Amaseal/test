# stage build
FROM node:16.9.1-alpine as builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build && npm prune --production

# stage run
FROM node:16.9.1-alpine
WORKDIR /app
COPY --from=builder /app/build ./build
COPY --from=builder /app/node_modules ./node_modules
COPY package.json .
ENV PORT 3000
EXPOSE ${PORT}
CMD ["node", "build"]
