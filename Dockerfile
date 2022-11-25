FROM registry.access.redhat.com/ubi8/ubi:8.5

LABEL maintainer="Nikolaus Lemberski <nikolaus@redhat.com>"

LABEL io.k8s.description="Platform for building and running Rust applications" \
    io.k8s.display-name="Rust" \
    io.openshift.expose-services="8080:http" \
    io.openshift.tags="builder,rust"

RUN yum update -y && yum install -y cargo && yum clean all -y

COPY ./s2i/bin/ /usr/libexec/s2i

RUN chown -R 1001:0 /usr/libexec/s2i \
    && mkdir /app && chown -R 1001:0 /app \
    && mkdir /.cargo && chown -R 1001:0 /.cargo

USER 1001

EXPOSE 8080

CMD ["/usr/libexec/s2i/usage"]