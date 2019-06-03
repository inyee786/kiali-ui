# Stage 0, "build-stage", based on Node.js, to build and compile the frontend
FROM node:10.8.0 as build-stage
WORKDIR /app
RUN npm install -g yarn
#COPY package*.json /app/
COPY ./ /app/
RUN yarn
RUN yarn build
RUN ls -ltr
# Stage 1, based on Nginx, to have only the compiled app, ready for production with Nginx
FROM nginx:1.15
#Copy build to nginx
COPY --from=build-stage /app/build/ /usr/share/nginx/html


