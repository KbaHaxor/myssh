# A Demonstrative Java Web Application Utilizing SSH Framework

## Introduction
This is a simple demonstrative Java web application intended to be used as a personnel information management system. Popular Java frameworks, such as Spring, Struts, and Hibernate is used. Spring is used both as a IOC container which manages Hibernate's `SessionFactory` and various instances used by Struts, including Action classes, DAO classes, and classes that serve as business models, and as a AOP framework for Hibernate's transaction management. Struts' tag and OGNL combined with JSP technology is utilized for front end rendering. In Struts, which itself is a huge MVC (Model-View-Controller) web framework, Action class acts as a controller to direct requests and feed them back with the right responses. The business logic code and DAO code is arrange into two separate packages. Hibernate is used as a persistence framework which is responsible for both interacting with backend database and actual transaction management. In order to understand how this application works, one needs to have the following prerequisites besides the basic knowledge of Java programming:

* Basic knowledge of how to configure Spring, Struts, Hibernate framework and how to make them work collectively in a single web application.
* Understanding how `OGNLValueStack` shares data with Action class via Struts tag, OGNL, parameter interceptor.
* Understanding how the preparable interceptor and model-driven interceptor works.
* Understanding how to mapping entities attributes to database relations by `*.hbm.xml` configuration file and basic knowledge of HQL (Hibernate Query Language).
* Understanding how Spring acts as a IOC container and how to manage database transaction using Spring's AOP mechanism in conjunction with Hibernate transaction manager.
* Knowing how to implement simple DOM operation by jQuery library and how to implement AJAX interaction with the assist of jQuery.

## Screenshots
TO BE DONE

## Involved technologies
* Front end:
    - JSP
    - Struts' tags and OGNL
    - JavaScript (jQuery specifically)
    - AJAX
* Middle tier
    - Spring IOC (for instance management and dependency injection)
    - Spring AOP (for transaction management for all methods that that serve as business logic)
    - Struts (Action class, and relevant interceptors)
    - Hibernate (as a persistence framework)
* Database
    - MySQL

## Navigation
The source code of this Java web application is arranged into packages:
* `io.accessun.entity`
* `io.accessun.dao`
* `io.accessun.service`
* `io.accessun.action`
* `io.accessun.converter`

> *A little bit of diversion here:*
> **Q** -> Why are you using `io.accessun` as the prefix of all your packages?
> **A** -> I'm planning my blog recently. `*.accessun.io` is the most likely domain name I might use for my blog. It is good practice to stick to the naming convention (Reverse your domain name as package name prefix.) Incidentally, stay tuned if you are interested in my blog.

`io.accessun.entity` contains all the entity class. One entity class corresponds to one table in a database. One attribute in an entity class corresponds to one field in a table. So, an instance of a entity class is directly mapped to a record in the table. The entity classes in this package are essential for "object orientated database interaction" by hibernate. All the hibernate mapping files (`*.hbm.xml`) are also here.

`io.accessun.dao` all the DAO classes are maintained here. `BaseDao` is a basic DAO class from which all other DAO classes inherit. It contains common methods all the others share.

`io.accessun.service` all the classes that involve business logic are arranged here. This is a very simple application. Thus, the service classes are just like wrappers of the DAO classes. Actually, it is not. For instance, the logic used for user name validation is put here. In application intended for real production environment, here is a place where more methods concerning business logic populate.

`io.accessun.action` contains all Action classes. The Action classes are used as controllers in Struts' MVC framework. An Action class acts as a role of a pivot or a guidance system whose responsibility is to direct requests and responses throughout the whole application. This is also the most important class what one is encouraged to focus on when studying this web application.

`io.accessun.converter` contains classes used for data type conversion.

The source folder `conf/` contains all the essential configuration files including, database connection, Hibernate, Spring, Struts, and other resource files.

The `WEB-INF/views` contains the JSP files used for front end data rendering and user interaction. These files can only be reached through request forwarding.

The `WEB-INF/lib` contains all the dependent `jar` files. Make sure you have all the dependencies when launching this application on a web server.

To run this web application for demonstration purposes, one needs to import this project into an IDE, say Eclipse, and run it directly within the IDE. Make sure that you have your Tomcat server configured properly in it. After launching it, visit `http://localhost:8080/myssh/index.jsp` if the port of your Tomcat server was `8080`. This is the default case usually.