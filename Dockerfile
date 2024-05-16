# Dockerfile
FROM httpd:2.4

# Copoando dados do projeto
COPY ./ /usr/local/apache2/htdocs

# Copiando arquivo de configuração
COPY ./app/httpd.conf /usr/local/apache2/conf/my-httpd.conf

# Adicionando módulos
RUN echo "LoadModule proxy_module modules/mod_proxy.so" >> /usr/local/apache2/conf/httpd.conf
RUN echo "LoadModule proxy_http_module modules/mod_proxy_http.so" >> /usr/local/apache2/conf/httpd.conf
RUN echo "Include /usr/local/apache2/conf/my-httpd.conf" >> /usr/local/apache2/conf/httpd.conf

# Expondo uma porta
EXPOSE 10080
