FROM node:16 as build

WORKDIR /Node_js_app
COPY package.json index.js env ./
RUN npm install

FROM node:alpine as main

COPY --from=build /Node_js_app /
EXPOSE 8080
CMD ["index.js"]
