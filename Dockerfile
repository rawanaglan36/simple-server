# Use Node.js 18 as the base image
FROM node:18-alpine as base 

# docker stage 1 
FROM base as development 
# Set the working directory in the container
WORKDIR /app
# Copy package.json and package-lock.json (if exists)
COPY package*.json ./
# Install dependencies
RUN npm install
# Copy the rest of the application code
COPY . .
# Expose the port the server runs on
EXPOSE 3000
# Command to run the application
CMD ["npm", "run" , "dev"] 


# docker stage 2 
FROM base as production 
# Set the working directory in the container
WORKDIR /app
# Copy package.json and package-lock.json (if exists)
COPY package*.json ./
# Install dependencies
RUN npm install --only=production
# Copy the rest of the application code
COPY . .
# Expose the port the server runs on
EXPOSE 3000
# Command to run the application
CMD ["npm", "start"] 

