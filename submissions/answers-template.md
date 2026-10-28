# Coursera answers — Kubernetes Guestbook

Use the file code below for Questions 1, 3, and 8. For Questions 2, 4–7, 9, and 10, paste the real terminal output from your own IBM Skills Network lab session. Those values depend on your registry namespace, cluster, and live rollout and cannot be inferred from source files.

## Question 1 — Dockerfile

Paste the contents of the project's `Dockerfile`.

```dockerfile
FROM golang:1.18 AS builder

WORKDIR /app

COPY main.go .
RUN go mod init guestbook
RUN go mod tidy
RUN go build -o guestbook main.go

FROM ubuntu:18.04

WORKDIR /app

COPY --from=builder /app/guestbook /app/guestbook
COPY public/index.html /app/public/index.html
COPY public/script.js /app/public/script.js
COPY public/style.css /app/public/style.css
COPY public/jquery.min.js /app/public/jquery.min.js

EXPOSE 3000
CMD ["./guestbook"]
```

## Question 2 — `crimages`

Paste the actual output of `ibmcloud cr images` showing `us.icr.io/<your-sn-labs-namespace>/guestbook` with tag `v1`.

## Question 3 — `app`

Paste the contents of `public/index.html`. Confirm the `<title>` and `<h1>` both say `Guestbook - v1`.

## Question 4 — `hpa`

Paste the actual output of `kubectl get hpa guestbook` showing NAME, REFERENCE, TARGETS, MINPODS, MAXPODS, REPLICAS, and AGE.

## Question 5 — `hpa2`

Paste the actual HPA output after running the lab's load-generator command and replicas have increased.

## Question 6 — `upguestbook`

Paste your actual `docker push` output for the updated image, including the final digest line.

## Question 7 — `deployment`

Paste the actual response from `kubectl apply -f deployment.yml` (for example, `deployment.apps/guestbook configured`).

## Question 8 — `up-app`

Paste the contents of `public/index-v2.html`. Confirm the `<title>` and `<h1>` both say `Guestbook - v2`.

## Question 9 — `rev`

Paste the actual output from `kubectl rollout history deployment/guestbook --revision=2`, with the CPU-related change visible.

## Question 10 — `rs`

Paste the actual output of `kubectl get rs` after you run the rollback command.
