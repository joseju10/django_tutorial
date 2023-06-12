FROM debian
MAINTAINER Jose Juan Hervás Carrasco "josejuanhervascarrasco@gmail.com"
RUN apt-get update && apt-get install -y python3-pip python3-dev default-libmysqlclient-dev build-essential && apt-get clean && rm -rf /var/lib/apt/lists/*
COPY django_tutorial /usr/share/app
ADD script.sh /usr/share/app
RUN chmod +x /usr/share/app/script.sh
WORKDIR /usr/share/app
RUN pip3 install --no-cache-dir -r requirements.txt
RUN pip3 install mysqlclient
EXPOSE 3000
ENTRYPOINT ["/usr/share/app/script.sh"]
