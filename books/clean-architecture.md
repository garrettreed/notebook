# Robert C Martin - Clean Architecture and Design

[youtube talk](https://www.youtube.com/watch?v=Nsjsiz2A9mg)
[Uncle Bob's Blog](http://blog.8thlight.com/uncle-bob/2012/08/13/the-clean-architecture.html)

> A good architecture maximizes the number of decisions NOT made.

## Introduction - On the Speed of Light

_On the Electrodynamics of Moving Bodies_ - short paper using simple math

Why is the framework the first thing I see when I open an application? Why doesn't it tell me what it does?

The web is an IO channel. Why would it dictate the structure of the application?

A blueprint does not tell you what it's made of or how it's made - It tells you it's intent.

Architecture is about _Intent_

## Ivar Jacobson's Use Case

```text
Create Order
Data
    <Customer-id>,          <Customer-contact-info>,
    <Shipment-destination>, <Shipment-mechanism>,
    <Payment-information>
Primary Course:
    1. Order clerk issues "Create Order" command with above data.
    2. System validates all data.
    3. System. creates order and determines order-id.
    4. System delivers order-id to clerk.
Exception Course: Validation Error
    1. System delivers error message to clerk.
```

Never specifies _how_ - only _what_. Does not bind to web.
Jacobson went on to explain how you could translate this use case to objects: Interactors.
Interactors have Application specific business rules
Object with method `execute` - Command Pattern - Executes the use case
There are two kinds of business rules of an application and keeping them separate is necessary for good architecture.

1. Business rule that is particular to the application - Interactor
2. Transcends the application - Entities

Interfaces are the third kind of object - Boundaries

Request Model: Delivery-agnostic simple data structure.

You should be able to test all of your business rules without a web server running.

## What about MVC?

-   Invented in the 70s with SmallTalk
-   Model View Presenter
    -   View Model -> a view-agnostic representation of the view

## What about the Database?

-   Database technology is evolving into RAM where all data is equally accessible at the same rate
-   Data accessible by memory
-   Get rid of update and delete - create a new record for every tranaction. This is what Version Control does
-   Should be treated like a plugin

## Concentric Circle -> Inner-to-Outer

1. Entities: Enterprise Business Rules
2. Use Cases: App-Specific business rules
3. Controllers: Interface Adapters
4. External Interfaces: Web/DB/UI/Devices - Frameworks and Drivers

-   Flow:
    -   Presenter -> Use Case Output Port <- Use Case Interactor -> Use Case Input Port <- Controller
    -   Controller -> Presenter

## Goal is to produce systems that are...

1. Independent of Frameworks: Use frameworks as tools/plugins
2. Testable: Business rules can be tested w/out UI, DB, Web Server, etc.
3. Independent of UI: Can change easily without changing the rest of the system. i.e. Replace web with console
4. Independent of Database: Swap SQL for NoSQL without modifying business rules
5. Independent of any external agency: Business rules nothing about outside world.

## The Dependency Rule

-   Outer circles are _mechanisms_, Inner circles are _policies_
-   Dependency Rule: Source code dep's should only move foreward.
-   Nothing in an inner circle can know anything about something in an outer circle.
    -   Includes functions, classes, variables
-   Data formats used in an outer circle should not be used by an inner circle.

## Entities

-   Least likely to change when something external changes.
-   Not expected to be affected by a change to page navigation or security
-   No operational change to any particular app should affect the entity

## Use Cases

-   Not expected to be affected by the DB, UI, or framework
-   Changes should not affect entities
-   Changes to the operation of the application will affect the use-cases

## Interface Adapers

-   Set of adapters that convert data from the format most convenient for the use cases and entities to the format most convenient for some external agency.
-   Contains the Presenters, Views, and Controllers.

## Frameworks and Drivers

-   DB, Web Framework
-   Don't write much code in this layer other than glue code that communicates to the next circle inwards
-   Where the details go.
