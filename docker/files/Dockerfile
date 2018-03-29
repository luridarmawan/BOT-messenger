FROM fastplaz/ubuntu AS base

# Configuration
ARG GIT_REPO="https://github.com/luridarmawan/BOT-messenger.git"
ARG PROJECT_NAME="bot"
ARG WEB_DIR="/projects/$PROJECT_NAME/public_html/"

# Make port 80 available to the world outside this container
EXPOSE 80
EXPOSE 443

# remove old template and pull source from echo repository
RUN rm -rf /projects/$PROJECT_NAME/
RUN git clone $GIT_REPO $PROJECT_NAME
RUN chmod -R 777 /projects/$PROJECT_NAME/public_html/ztemp/

# setup apache web dir
RUN mv /var/www/html /var/www/html-old
RUN ln -s $WEB_DIR /var/www/html

# Add file autu run
ADD files/project-run.sh /app/run.sh
RUN chmod 755 /app/run.sh

