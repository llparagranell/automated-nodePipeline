# Use a stable Node image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files first (better caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of the application code
COPY . .

# Expose port (optional, e.g. for web servers)
EXPOSE 3000

# Start the app
CMD ["node", "app.js"]
