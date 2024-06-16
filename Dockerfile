FROM node:20

ENV MODEL_URL='https://storage.googleapis.com/submission-model-ml-dicoding/model.json'

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]