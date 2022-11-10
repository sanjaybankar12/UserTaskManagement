# UserTaskManagement

### Technologies used:

      1) Spring MVC
      2) Spring Security
      3) MySQL Database

You can use any database with this application. You can update only application.properties file

Update following properties as per your database
>spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

>spring.datasource.url=jdbc:mysql://localhost:3306/mydb

>spring.datasource.username=root

>spring.datasource.password=root

At the first time you need to create database of name mydb and update following property value create 
so that it will create require table then keep as update always.
>spring.jpa.hibernate.ddl-auto=update
