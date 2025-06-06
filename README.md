# Java EE Management System Skeleton

This project provides a simple JSP/Servlet based management system.

## Features

- User registration with role selection (admin or user)
- Login and session handling
- Admin-only item management (add/delete)
- Item listing for all users
- Bootstrap-based interface

## Project Structure

```
src/                  Java source files
WebContent/jsp/       JSP pages
WebContent/WEB-INF/   web.xml configuration
schema.sql            MySQL schema
```

## Database Setup

Import `schema.sql` into your MySQL server and adjust the credentials in
`src/com/example/util/DBUtil.java`.

## Build

Use a servlet container such as Tomcat. Place the contents of this repository
as a web application and compile the Java sources.
