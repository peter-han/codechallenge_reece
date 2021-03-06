# AddressBook Manager

A simple yet powerful address book and contact manager (Reece.com.au coding challenge).<br>

## Table of contents:

* [Challenge statement](./README.md#Challenge-statement)
* [Acceptance Criteria](./README.md#Acceptance-Criteria)
* [Assumptions](./README.md#Assumptions)
* [Not Implemented Yet](./README.md#Not-Implemented-Yet)
* [Deliverables](./README.md#Deliverables)
* [Setup](./README.md#Setup)
* [Quality Analysis](./README.md#Quality-Analysis)

## Challenge statement

As a Reece Branch Manager I would like an address book application So that I can keep track of my customer contacts

## Acceptance Criteria

- Address book will hold name and phone numbers of contact entries
- Create a REST API which will have endpoints for the following
    - Users should be able to add new contact entries
    - Users should be able to remove existing contact entries
    - Users should be able to print all contacts in an address book
    - Users should be able to maintain multiple address books
    - Users should be able to print a unique set of all contacts across multiple address books

## Assumptions

- API Auth is not required
- User's name is unique to identify a user.
- User can have multiple Addresses; user define the name of each Address Book; the name is unique to identify a
  AddressBook per User.
- API doesn't provide function to edit Address Name.

## Not Implemented Yet

- Database index to be set
- Callable API & web execution threads
- Managing ThreadPool, timeout (circuit breaker is not require)
- Business error mapping, no custom exception are defined
- Blackbox test, API swagger validation (required CI pipeline to be setup)
- Performance test
    - `@Transactional` tag is in used, need to review if introduce database lock
    - Entity has been designed "double bind" and "EAGER fetch". Need to review in perf load.
    - the concurrent calls are not covered. Duplicated records can happen, that the "name" on either "User" nor "Address
      Book" may not unique. (to avoid such duplication, need to implement centralize lock (i.e database level), but
      might impact performance)
- Enable `RequestLoggingFilter`, only for demo API access log, not in prod.

## Deliverables

- API spec would be nice to have
- all acceptance criteria to be demonstrable through tests
- data can be persisted in a storage
- containerise the application using docker

## Setup

1. Make sure you have Java 8 and Docker installed in your machine.
2. Clone git repository
3. Build App

   ```./gradlew clean build```

4. Build docker

   ```./gradlew bootBuildImage```

5. Run App

   ```docker-compose -f 'src/main/docker/compose/docker-compose-dev.yaml' up -d```

6. Verify healthy

   ``http://localhost:8080/addressbook/actuator/health``

7. API doc

   ``http://localhost:8081/addressbook/swagger-ui.html``

8. Startup testing env alone (postgres)

   ```./gradlew composeUp```

![img.png](swagger-ui.png)

## Quality Analysis

|Name|Report|
|:----:|:---:|
|Test Summary|```../build/reports/tests/test/index.html```|
|Test Coverage|```../build/reports/tests/coverage/index.html```|
