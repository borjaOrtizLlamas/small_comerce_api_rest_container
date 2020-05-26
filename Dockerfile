FROM amd64/openjdk:8u232-jdk
EXPOSE 8080
RUN DEBIAN_FRONTEND=nointeractive apt-get update -y --no-install-recommends && \
apt-get install -y --no-install-recommends locales && \
locale-gen en_US.UTF-8 && \ 
apt-get install -y --no-install-recommends software-properties-common git maven
RUN git clone https://github.com/borjaOrtizLlamas/springboot.git /tmp/springboot && \
cd /tmp/springboot && mvn clean install
VOLUME ["/var/log/"]
CMD ["java","-jar","/tmp/springboot/target/gs-rest-service-1.0.1.jar", "com.borja.Aplication"]
