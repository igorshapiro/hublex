# HubLex

An opinionated lightweight service-bus.

## Why?

There are a lot of frameworks for SOA,
most of them are platform specific (.NET/Java/etc.),
hard to integrate.

Most frameworks are too heavy and too
enterprise-oriented.

HubLex simplifies SOA by:

- being platform-independent
- supporting different transports
  - for queueing
  - for in-process/schedule/dead storage
- being lightweight

## Roadmap

- Transports:
  - RabbitMQ
  - SQS
- "in-progress" storage (MongoDB)
- "scheduled" storage (MongoDB)
- "dead-letter" storage (MongoDB)
- Scheduled retries
- Provide a dashboard UI
- Monitor SLA
- Retries
