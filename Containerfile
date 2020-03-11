FROM centos:centos7
LABEL maintainer "Lorenzo Prosseda <lerokamut@gmail.com>"

ARG java_sdk=8.0.242-amzn
ARG gradle_version=6.2.2

# Install tools
RUN yum install -y unzip zip tmux which && yum clean all

# Install SDKman, JDK and Gradle
RUN curl -s "https://get.sdkman.io" | bash && \
    source "$HOME/.sdkman/bin/sdkman-init.sh" && \
    sdk install java ${java_sdk} && sdk install gradle ${gradle_version}

WORKDIR /workdir
VOLUME ["/workdir"]

CMD ["bash"]
