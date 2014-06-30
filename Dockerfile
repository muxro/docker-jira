FROM java:latest

RUN apt-get update -qq \
    && apt-get install -qqy wget curl

RUN wget http://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-6.2.7.tar.gz
RUN tar -xzf atlassian-jira-6.2.7.tar.gz

RUN echo "jira.home = /media" > atlassian-jira-6.2.7-standalone/atlassian-jira/WEB-INF/classes/jira-application.properties

EXPOSE 8080 8005
WORKDIR atlassian-jira-6.2.7-standalone

CMD ./bin/start-jira.sh -fg
