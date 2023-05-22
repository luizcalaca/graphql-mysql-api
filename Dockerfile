# Use a imagem base do Node.js
FROM node:14

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie os arquivos de configuração
COPY package*.json ./

# Instale as dependências do projeto
RUN npm install

# Copie o código fonte da aplicação
COPY . .

# Expõe a porta do servidor Apollo
EXPOSE 4000

# Comando para iniciar a aplicação
CMD ["node", "./src/index.js"]