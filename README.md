# 📚 Proyek 3 Asclepius - Machine Learning Google Cloud

Submission Machine Learning Pada Google Cloud

## Requirements

Google Cloud Platform - (Firestore & App Engine)

### Set-up and Run
> now install dependencies and run the project 
> [Website]()

```shell
$ git clone https://github.com/muhikhsanm404/MLGC.git/
$ cd MLGC
$ npm install
$ nano .env

  MODEL_URL=’<URL_FROM_MODEL_BUCKET>'

$ nano Dockerfile

  FROM node:20

  WORKDIR /app
  
  COPY package*.json ./
  
  RUN npm install
  
  COPY . .
  
  EXPOSE 3000
  
  CMD ["npm", "start"]

$ edit src/services/loadModel.js

const tf = require('@tensorflow/tfjs-node');
async function loadModel() {

return tf.loadGraphModel('URL_ANDA');
}
module.exports = loadModel;

$ gcloud services enable artifactregistry.googleapis.com cloudbuild.googleapis.com run.googleapis.com
$ gcloud artifacts repositories create backend --repository-format=docker --location=asia-southeast2 --async
$ gcloud builds submit --tag asia-southeast2-docker.pkg.dev/${GOOGLE_CLOUD_PROJECT}/backend/<nama_project>:1.0.0
$ gcloud run deploy --image asia-southeast2-docker.pkg.dev/${GOOGLE_CLOUD_PROJECT}/backend/<nama_project>:1.0.0
```

- **[Documentation](https://cloud.google.com/appengine/docs/standard/hosting-a-static-website)**

> 
> ## fix app.yaml & API.js update


```shell

$ git clone https://github.com/dicodingacademy/asclepius.git
$ nano app.yaml

runtime: nodejs18

handlers:
- url: /favicon\.png
  static_files: favicon.png
  upload: favicon\.png
 
- url: /src/images
  static_dir: src/images
 
- url: /src/scripts
  static_dir: src/scripts
 
- url: /src/styles
  static_dir: src/styles
 
- url: /.*
  static_files: index.html
  upload: index.html
  secure: never
 
- url: /(.*)
  script: auto
  secure: never

$ edit src/services/api.js
// TODO: Silakan sesuaikan BASE URL dari endpoint Anda
const BASE_URL 'URL_ANDA':

$ gcloud app deploy -v production
$ gcloud app browse
```

## Authors

Contributors names and contact info

Mr.Sanz

## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
#   b a c k e n d - m a c h i n e l e a r n i n g - g c p  
 