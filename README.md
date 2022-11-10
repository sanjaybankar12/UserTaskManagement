# UserTaskManagement

### Technologies used:

      1) Spring MVC
      2) Spring Security
      3) JSTL
      4) Bootstrap
      5) JQuery
      6) MySQL Database

You can use any database with this application. You can update only <b>application.properties</b> file

Update following properties as per your database
>spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

>spring.datasource.url=jdbc:mysql://localhost:3306/mydb

>spring.datasource.username=root

>spring.datasource.password=root

At the first time you need to create database of name mydb and update following property value to <b>create</b>
so that it will create require table then keep as <b>update</b> always.
>spring.jpa.hibernate.ddl-auto=update

Use following URL in browser,
>http://localhost:8082/home

