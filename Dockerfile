FROM golang:1.19.1-buster as builder

ADD . /mmark
WORKDIR /mmark
RUN go build

FROM golang:1.19.1-buster
COPY --from=builder /mmark/*.md /testsuite/
COPY --from=builder /mmark/mmark /

ENTRYPOINT []
CMD ["/mmark", "@@"]
