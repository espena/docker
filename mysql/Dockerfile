FROM mysql

RUN apt-get update && apt-get install -y \
  build-essential \
  subversion \
  git \
  wget \
  unzip \
  cmake \
  autoconf \
  libncurses5-dev \
  bison \
  libmysqlclient-dev \
  mysql-client

RUN mkdir build && \
    cd build && \
    git clone https://github.com/infusion/udf_infusion.git && \
    cd udf_infusion && \
    ./configure && \
    make && \
    make install

RUN cd build && \
    wget http://download.osgeo.org/proj/proj-4.9.3.tar.gz && \
    tar -xvzf proj-4.9.3.tar.gz && \
    cd proj-4.9.3 && \
    ./configure && \
    make && \
    make install && \
    cd /usr/local/share/proj && \
    wget http://download.osgeo.org/proj/proj-datumgrid-1.6.zip && \
    unzip proj-datumgrid-1.6.zip && \
    rm proj-datumgrid-1.6.zip

RUN mkdir -p build/geos && \
    cd build/geos && \
    svn checkout http://svn.osgeo.org/geos/trunk trunk && \
    mkdir build && \
    cd build && \
    cmake ../trunk && \
    make && \
    make install

RUN cd build && \
    git clone https://github.com/krandalf75/MySQL-Spatial-UDF.git && \
    cd MySQL-Spatial-UDF && \
    cmake . && \
    make && \
    make install


COPY MySpatialUDF.sql.patch /build/MySQL-Spatial-UDF/
RUN cd /build/MySQL-Spatial-UDF && \
    patch MySpatialUDF.sql < MySpatialUDF.sql.patch

COPY create_spatial_ref_sys.sql.patch /build/MySQL-Spatial-UDF/sql/
RUN cd /build/MySQL-Spatial-UDF/sql && \
    patch create_spatial_ref_sys.sql < create_spatial_ref_sys.sql.patch

COPY tests.sql.patch /build/MySQL-Spatial-UDF/sql/
RUN cd /build/MySQL-Spatial-UDF/sql && \
    patch tests.sql < tests.sql.patch

RUN apt-get install -y libmysqlclient-dev libpcre3-dev && \
    apt-get install -y libtool automake autoconf autogen && \
    git clone https://github.com/mysqludf/lib_mysqludf_preg.git && \
    cd lib_mysqludf_preg && \
    aclocal && \
    automake --add-missing && \
    autoreconf --force --install && \
    ./configure && \
    make && \
    make install && \
    echo "max_allowed_packet = 1G" >> /etc/mysql/conf.d/docker.cnf && \
    echo "general_log_file = /var/log/query.log" >> /etc/mysql/conf.d/docker.cnf && \
    echo "general_log      = 1" >> /etc/mysql/conf.d/docker.cnf

RUN service mysql start && \
    cd lib_mysqludf_preg && \
    mysql -uroot -pcicero <./installdb.sql
