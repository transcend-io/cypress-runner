ARG baseUrl=https://yo.com:TODO
ARG record=false

# Use the Cypress base image
FROM cypress/browsers:chrome69

ENV CI=true
ENV CYPRESS_baseUrl=${baseUrl}

# Install Cypress and verify the installation
RUN npm install cypress@3.1.3 \
 && ln -s /usr/local/bin/cypress $(pwd)/node_modules/.bin/cypress \
 && cypress verify \
 && cypress --version

CMD ["cypress", "run", "--record", $record]
