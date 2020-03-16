# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# NOTE: DO *NOT* EDIT THIS FILE.  IT IS GENERATED.
# PLEASE UPDATE Dockerfile.txt INSTEAD OF THIS FILE
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
FROM samueltauil/base:3.141.59-zirconium
LABEL authors=SeleniumHQ

USER seluser

ENV GROK_ARCH="grok_exporter-1.0.0.RC3.linux-amd64"
ENV GROK_VERSION="v1.0.0.RC3"

#===========
# Adding grok_exporter
#===========
RUN sudo wget https://github.com/fstab/grok_exporter/releases/download/$GROK_VERSION/$GROK_ARCH.zip \
   && sudo unzip $GROK_ARCH.zip \
   && sudo mv $GROK_ARCH /opt/selenium \
   && sudo rm $GROK_ARCH.zip

#========================
# Selenium Configuration
#========================
EXPOSE 9144
EXPOSE 4444

# As integer, maps to "maxSession"
ENV GRID_MAX_SESSION 5
# In milliseconds, maps to "newSessionWaitTimeout"
ENV GRID_NEW_SESSION_WAIT_TIMEOUT -1
# As a boolean, maps to "throwOnCapabilityNotPresent"
ENV GRID_THROW_ON_CAPABILITY_NOT_PRESENT true
# As an integer
ENV GRID_JETTY_MAX_THREADS -1
# In milliseconds, maps to "cleanUpCycle"
ENV GRID_CLEAN_UP_CYCLE 5000
# In seconds, maps to "browserTimeout"
ENV GRID_BROWSER_TIMEOUT 0
# In seconds, maps to "timeout"
ENV GRID_TIMEOUT 1800
# Debug
ENV GRID_DEBUG false
# As integer, maps to "port"
ENV GRID_HUB_PORT 4444
# As string, maps to "host"
ENV GRID_HUB_HOST "0.0.0.0"

COPY generate_config \
    start-selenium-hub.sh \
    start-grok.sh \
    /opt/bin/

COPY config.yml /opt/selenium/
COPY selenium-hub.conf /etc/supervisor/conf.d/
COPY grok-exporter.conf /etc/supervisor/conf.d/
RUN /opt/bin/generate_config > /opt/selenium/config.json
