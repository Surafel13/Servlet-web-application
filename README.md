# 🎓 Student Registration & Management System

A professional, high-end Java Web Application for managing student registrations. This project features a robust Java Servlet backend, MySQL integration via JDBC, and a premium modern UI built with glassmorphism and smooth animations.

---

## ✨ Features
- **Modern UI/UX**: Dark mode with frosted glass effects, vibrant gradients, and staggered animations.
- **Secure Registration**: Uses JDBC `PreparedStatement` to prevent SQL Injection.
- **Real-time Validation**: Server-side checks for empty fields and unique email constraints.
- **Dynamic Dashboard**: Animated table displaying all registered students directly from the database.
- **Responsive Design**: Optimized for desktops and tablets using CSS Flexbox/Grid.

---

## 🛠️ Tech Stack
- **Backend**: Java 11+, Java Servlets, JDBC, Maven.
- **Frontend**: HTML5, CSS3 (Glassmorphism), JavaScript (ES6).
- **Database**: MySQL 8.0+.
- **Server**: Apache Tomcat 9.

---

## 🚀 Getting Started

### 1. Prerequisites
- **Java SDK**: Version 11 or higher.
- **Maven**: For dependency management and building.
- **MySQL Server**: Running on `localhost:3306`.
- **Tomcat**: Apache Tomcat 9.x or 10.x.

### 2. Database Configuration
1. Open your MySQL client (Workbench or CMD).
2. Execute the `setup_db.sql` script located in the project root:
   ```sql
   SOURCE c:/web file/Student Registration/setup_db.sql;
   ```
3. **Important**: If your MySQL `root` user has a password, update it in:
   `src/main/java/com/student/util/DBConnection.java`

### 3. Build the Application
Open your terminal in the project root and run:
```bash
mvn clean package
```
This will generate a `student-registration.war` file in the `target/` directory.

### 4. Deployment
1. Copy the `target/student-registration.war` file.
2. Paste it into your Tomcat installation's `webapps` folder.
3. Start the Tomcat server.

---

## 🌐 Accessing the App
Once deployed, open your browser and navigate to:
- **Registration Portal**: `http://localhost:8080/student-registration/`
- **Student Dashboard**: `http://localhost:8080/student-registration/show_all`

---

