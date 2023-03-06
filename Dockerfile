#https://docs.docker.com/engine/reference/builder/
FROM scratch
COPY hello /
CMD ["/hello"]