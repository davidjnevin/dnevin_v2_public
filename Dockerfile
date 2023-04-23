# FROM node:14.16.0-stretch-slim as builder

# WORKDIR /app

#Copy all files from current directory to working dir in image
# COPY yarn.lock .
# COPY *.js .
# COPY *.json .

# Install and use the correct version of of node
# RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash && nvm install

# Install and use the correct version of of node
# SHELL ["/bin/bash", "--login", "-i", "-c"]
# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
# RUN source ~/.bashrc && nvm install 14.16.0
# SHELL ["/bin/bash", "--login", "-c"]

# Install dependencies
# RUN yarn

# COPY . .

# Build a full static production build
# RUN npm run build


# nginx state for serving content
FROM nginx:alpine
# Set working directory to nginx asset directory
WORKDIR /usr/share/nginx/html
# Remove default nginx static assets
RUN rm -rf ./*
# Copy static assets from builder stage
# COPY --from=builder /app/public .
ADD public ./

# Containers run nginx with global directives and daemon off
ENTRYPOINT ["nginx", "-g", "daemon off;"]
