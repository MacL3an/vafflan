# Stage 1 - the build process
FROM node:12.0 as build-deps
WORKDIR /Users/maclean/Code/vafflan/my-app
COPY package.json yarn.lock ./
RUN yarn
COPY . ./
RUN yarn build

# Stage 2 - the production environment
FROM nginx:1.12-alpine
COPY --from=build-deps /Users/maclean/Code/vafflan/my-app/build /usr/share/nginx/html

# This does not work on Heroku, instead...
#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]

# Add nginx conf to allow Heroku to inject port at runtime
COPY nginx.conf /etc/nginx/conf.d/default.conf
ENV PORT=4200
CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
