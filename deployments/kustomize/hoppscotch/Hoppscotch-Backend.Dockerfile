# Hoppscotch backend image
FROM hoppscotch/hoppscotch-backend:2023.8.1

# Install npm and bash
RUN apk add --no-cache npm bash

# Install the new Prisma CLI with npm
RUN npm install -g prisma

# Overwrite the mailer.module.js in the container with your custom version
COPY src/hoppscotch-backend/dist/mailer/mailer.module.js /usr/src/app/packages/hoppscotch-backend/dist/mailer/mailer.module.js

# Expose the port for hoppscotch backend
EXPOSE 3170
