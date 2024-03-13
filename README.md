# Node_js_app

Docker file for a sample NodeJS application and Image created with efficient and small size. 
Docker file:
# Stage 1: Build the application
FROM node:16 as build
WORKDIR /Node_js_app
COPY package.json index.js env ./
RUN npm install

# Stage 2: Create the production image
FROM node:alpine as main
COPY --from=build /Node_js_app /
EXPOSE 8080
CMD ["index.js"]
------------------------------------------------------------------------------------------------------------------
FROM node:16 as build: here we are using Node.js 16 image as base image for the build stage. 
WORKDIR /Node_js_app: Setting the working directory inside the container (github)
COPY package.json index.js env ./: copying files from the directory
RUN npm install: then we are installing dependencies defined in package.json
FROM node:alpine as main: then for next stage we are using Alpine version of the Node.js image  
COPY --from=build /Node_js_app /: it will copy the application from the build stage into the production stage.
EXPOSE 8080: Exposing on port 8080 for external access (localhost:8080)
CMD ["index.js"]: this command will run when the container starts and displays our application.

Methods use to reduce the size of the Image:
1) Docker multistage build: we use different Docker files for building and packaging the application code, this pattern helps us reduce the image size. this is to eliminate unwanted layers in the image and only the necessary app files that needs to run the application are copied over to another image with only the required libraries, which will be lighter to run the application.
2) Use a . dockerignore File: we will add all the unrelated files here so they won’t be copied during docker build which will reduce the size .
3) smaller base image: alpine base image provides a great size reduction, but it comes with its own and has a smaller package repository compared to other Linux distributions, and some debugging tools or libraries may not be available.
   
Step1: add all the application related files to your GitHub repository and copy the repository URL.
https://github.com/mohdimtiyaz002/Node_js_app.git
 

Step2: open your terminal, clone your repository to your local machine and go to the application directory.
“git clone https://github.com/mohdimtiyaz002/Node_js_app2.git”
“cd Node_js_app”
 

Step3: now we need to build the docker image and run the container using the commands.
“docker build -t my-node-app .”
“sudo docker run -p 8080:8080 my-node-app”

 

Step4: verify if your application is up and running using localhost:8080

 

Step5:  To check the size of your docker image. (Size = 143 MB)
“docker image ls”

 
