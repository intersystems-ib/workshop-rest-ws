ARG IMAGE=containers.intersystems.com/intersystems/iris-community:2023.2.0.202.0
FROM $IMAGE

USER root

WORKDIR /opt/irisapp
RUN chown -R irisowner:irisowner /opt/irisapp

USER irisowner

# copy files to image
WORKDIR /opt/irisapp
#COPY --chown=irisowner:irisowner /iris/iris.script iris.script
COPY --chown=irisowner:irisowner src src

COPY --chown=$ISC_PACKAGE_MGRUSER:$ISC_PACKAGE_IRISGROUP /iris/irissession.sh /
RUN chmod +x /irissession.sh

COPY --chown=$ISC_PACKAGE_MGRUSER:$ISC_PACKAGE_IRISGROUP /iris/webapp.xml /
RUN chmod +x /webapp.xml

SHELL ["/irissession.sh"]

RUN \
  zn "%SYS" \
  set sc = $SYSTEM.OBJ.LoadDir("/opt/irisapp/src/Test", "ck", , 1) \
  if sc do ##class(WSTEST.Installer).Install() \
  zn "WSTEST" \
  set sc = $SYSTEM.OBJ.LoadDir("/opt/irisapp/src/WSTEST", "ck", , 1) \  
  # start production
  set production = "WSTEST.Production" \
  set ^Ens.Configuration("csp","LastProduction") = production \
  do ##class(Ens.Director).SetAutoStart(production) \
  set sc = 1 \
  zn "%SYS" \
  do ##class(Security.Applications).Import("/webapp.xml",.n) \
# run iris.script
# RUN iris start IRIS \
#   && iris session IRIS < /opt/irisapp/iris.script \
#   && iris stop IRIS quietly