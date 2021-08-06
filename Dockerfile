FROM python as builder
WORKDIR /app

COPY ./ ./

RUN pip install -r requirements.txt
RUN make build

FROM nginx
WORKDIR /usr/share/nginx/html
COPY --from=builder /app/site ./