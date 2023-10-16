# Hoppscotch backend image
FROM hoppscotch/hoppscotch-backend:2023.8.1

# Install npm and bash
RUN apk add --no-cache npm bash

# Install the new Prisma CLI with npm
RUN npm install -g prisma

# Expose the port for hoppscotch backend
EXPOSE 3170
