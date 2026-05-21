# 🦆 Linguados: Master Technical English with Gamified Learning!

[![Java 21](https://img.shields.io/badge/Java-21-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://www.oracle.com/java/technologies/javase/21-ea-downloads.html)
[![Jakarta EE 10](https://img.shields.io/badge/Jakarta_EE-10-purple?style=for-the-badge&logo=jakarta-ee&logoColor=white)](https://jakarta.ee/specifications/platform/10/)
[![Apache Maven](https://img.shields.io/badge/Apache_Maven-C71A36?style=for-the-badge&logo=apache-maven&logoColor=white)](https://maven.apache.org/)
[![MySQL 8.0](https://img.shields.io/badge/MySQL-8.0-00000F?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![GitHub Actions](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-2088FF?style=for-the-badge&logo=githubactions&logoColor=white)](https://github.com/features/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

Linguados is an innovative and engaging web platform designed to help developers and IT professionals master technical English. Inspired by popular language learning applications, it offers a gamified experience with interactive challenges, progress tracking, and a vibrant community chat. Sharpen your language skills while reinforcing programming concepts in a fun and effective way! 🚀

---

## ✨ Key Features

*   **User Authentication & Authorization:** Secure user registration, login, and session management with distinct roles for `STUDENT` and `ADMIN`.
*   **Gamified Learning Experience:**
    *   **XP & Levels:** Earn experience points (XP) for completing challenges and level up your proficiency.
    *   **Streaks:** Maintain daily learning streaks to build consistent habits.
    *   **Achievements/Conquests:** Unlock special badges and bonus XP for reaching milestones.
    *   **Global Ranking:** Compete with other learners on a dynamic leaderboard.
*   **Interactive Dashboard:** A personalized hub displaying daily lessons, weekly activity charts, and overall progress across modules.
*   **Modular Learning Paths:** Structured learning content organized into distinct modules (e.g., "Sintaxe", "DevOps", "SQL") to guide your language journey.
*   **Diverse Challenge Types:** Engage with a variety of interactive exercises:
    *   **Translation:** Translate technical phrases between Portuguese and English.
    *   **Fill-in-the-Blanks (Lacuna):** Complete sentences by providing the missing technical terms.
    *   **Multiple Choice:** Select the correct answer from a set of options.
*   **Real-time Global Chat:** Connect and interact with other learners in a live chat room, powered by WebSockets.
*   **Responsive & Intuitive UI:** A clean, modern, and mobile-friendly interface inspired by leading language learning platforms, ensuring a smooth experience across devices.
*   **Admin Content Management:** A dedicated interface for administrators to create and manage learning modules and challenges.

---

## 🏗️ Architecture Overview

Linguados is built with a robust, layered architecture, adhering to the Model-View-Controller (MVC) pattern for clear separation of concerns.

### High-Level Diagram

```
+------------------+
|      Client      |
| (Web Browser/JS) |
+--------+---------+
         | HTTP / WebSocket
+--------v---------+
|     Tomcat 10    | (Servlet Container)
+--------+---------+
         | (Jakarta EE Servlets, JSP/JSTL)
+--------v---------+
|   Application    |
|   (Java Servlets)|
|   (DAO, Service) |
+--------+---------+
         | JDBC
+--------v---------+
|    MySQL 8.0     |
| (Relational DB)  |
+------------------+
```

### Components

*   **Frontend (View):** Developed using **JavaServer Pages (JSP)** with **JSTL** for dynamic content generation, styled with custom **CSS** modules (e.g., `dashboard.css`, `login.css`, `chat.css`, `desafio.css`) and interactive elements powered by **Vanilla JavaScript**. The UI is designed to be modern and engaging, reminiscent of Duolingo.
*   **Backend (Model & Controller):** Implemented in **Java 21** using **Jakarta EE Servlets** to handle HTTP requests, manage application logic, and interact with the database. The `com.linguados` package is structured using a "package by feature" approach (e.g., `usuario`, `desafio`, `modulo`, `chat`, `progresso`), enhancing modularity and maintainability.
    *   **DAO Layer:** Data Access Objects (`UsuarioDAO`, `DesafioDAO`, `ProgressoDAO`, `ChatDAO`, `ConquistaDAO`, `ModuloDAO`) provide an abstraction layer for database operations, ensuring data integrity and separation of concerns.
    *   **Service Layer:** Business logic, such as XP calculation, streak updates (`UsuarioService`), and achievement unlocking, resides in dedicated service classes.
    *   **WebSocket Endpoint:** `ChatEndpoint` facilitates real-time communication for the global chat feature, enabling instant message delivery and system-wide announcements for achievements.
*   **Database:** **MySQL 8.0** serves as the persistent storage for user data, learning modules, challenges, progress, ranking, and chat history. Database schema initialization and seeding are managed via `docker-entrypoint-initdb.d` scripts.
*   **Containerization:** **Docker** and **Docker Compose** are utilized to define, run, and link the application services (Tomcat server and MySQL database), providing a consistent and isolated development and deployment environment.

### Design Patterns & Principles

*   **MVC (Model-View-Controller):** Enforces a clear separation between the application's data (Model), user interface (View), and control logic (Controller).
*   **DAO (Data Access Object):** Abstracts and encapsulates all access to the data source, promoting cleaner code and easier database migration.
*   **Dependency Injection (Manual):** DAOs are instantiated and managed directly within servlets or services.
*   **Polymorphism:** `Desafio` (Challenge) serves as an abstract base class, with concrete implementations like `DesafioTraducao`, `DesafioLacuna`, and `DesafioMultiplaEscolha` handling their specific validation logic.
*   **Queue-based Lesson Flow:** The `FilaDesafios` class manages the sequence of challenges within a module, providing a structured learning experience.

---

## 🛠️ Technologies Used

| Category         | Technology                 | Description                                                   |
| :--------------- | :------------------------- | :------------------------------------------------------------ |
| **Backend**      | Java 21                    | Core programming language.                                    |
|                  | Jakarta EE 10 (Servlets)   | Web application components and API specification.             |
|                  | Jakarta Server Pages (JSP) | Templating engine for dynamic web content.                    |
|                  | Jakarta Standard Tag Library (JSTL) | Tag library for common JSP tasks.                       |
|                  | MySQL Connector/J          | JDBC driver for MySQL database connectivity.                  |
| **Build Tool**   | Apache Maven               | Project build automation and dependency management.           |
| **Frontend**     | HTML5                      | Structure of web pages.                                       |
|                  | CSS3                       | Styling of web pages, custom Duolingo-inspired design.        |
|                  | JavaScript (Vanilla)       | Client-side interactivity and dynamic UI elements.            |
| **Database**     | MySQL 8.0                  | Relational database management system.                        |
| **Deployment**   | Docker                     | Containerization platform for isolated environments.          |
|                  | Docker Compose             | Tool for defining and running multi-container Docker applications. |
| **Real-time**    | WebSockets (Jakarta API)   | Bidirectional communication for real-time chat.               |
| **CI/CD**        | GitHub Actions             | Automated build and testing workflow.                         |

---

## 📂 Project Structure

The repository follows a standard Maven project layout, augmented with Dockerization assets and organized Java packages.

```
.
├── .github/                      # GitHub Actions workflows for CI/CD
│   └── workflows/
│       ├── ci.yml                # CI pipeline for building and testing
│       └── update-readme.yml     # Workflow for automated README updates
├── Dockerfile                    # Defines the Docker image for the application
├── LICENSE                       # Project license (MIT)
├── README.md                     # This README file
├── docker-compose.yml            # Defines multi-container Docker application
├── initdb/                       # SQL scripts for database initialization and seeding
│   ├── 01_setup.sql              # Database schema creation
│   └── 02_seed.sql               # Initial data population
├── pom.xml                       # Maven Project Object Model file
└── src/
    └── main/
        ├── java/
        │   └── com/linguados/    # Main Java source code, structured by feature
        │       ├── chat/         # Real-time chat logic and WebSocket endpoint
        │       ├── config/       # Database configuration
        │       ├── dashboard/    # Dashboard data retrieval and logic
        │       ├── desafio/      # Core challenge logic (types, DAO, lesson flow)
        │       ├── modulo/       # Learning module management
        │       ├── progresso/    # User progress tracking
        │       └── usuario/      # User authentication, profile, ranking, achievements
        └── webapp/               # Web application resources
            ├── WEB-INF/          # Web application deployment descriptor (web.xml)
            │   └── views/        # JSP view files (not directly accessible)
            │       ├── admin/    # Admin-specific JSPs
            │       ├── chat/     # Chat interface JSP
            │       ├── desafio/  # Challenge display JSPs (lacuna, multipla_escolha, traducao)
            │       ├── modulo/   # Module listing JSP
            │       ├── perfil/   # User profile JSP
            │       ├── ranking/  # Ranking board JSP
            │       └── usuario/  # Login/Registration JSPs
            ├── assets/           # Static assets (CSS, JS, images)
            │   ├── css/          # Stylesheets for various pages and components
            │   └── js/           # JavaScript for client-side interactivity
            └── index.jsp         # Landing page (or redirects to login/dashboard)
```

---

## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Before you begin, ensure you have the following installed on your system:

*   **Docker:** [Installation Guide](https://docs.docker.com/get-docker/)
*   **Docker Compose:** [Installation Guide](https://docs.docker.com/compose/install/)

### Installation

1.  **Clone the Repository:**
    ```bash
    git clone https://github.com/andreasgunther/linguados-web.git
    cd linguados-web
    ```

2.  **Build and Run with Docker Compose:**
    This command will build the `linguados-app` Docker image (if not already built), create the `linguados-db` container, initialize the database using the SQL scripts in `initdb/`, and start both services.
    ```bash
    docker-compose up -d --build
    ```
    *   The `--build` flag ensures that your application image is rebuilt, picking up any changes.
    *   The `-d` flag runs the containers in detached mode.

3.  **Verify Services (Optional):**
    You can check the status of your running containers:
    ```bash
    docker-compose ps
    ```

### Usage

Once the Docker containers are up and running, you can access the application:

1.  **Open your web browser** and navigate to:
    ```
    http://localhost:8080/
    ```

2.  **Register a New Account:**
    *   Click on "Criar Conta" or navigate to `http://localhost:8080/cadastro`.
    *   Fill in your details to create a new student account.

3.  **Login:**
    *   After registration, you'll be redirected to the login page (`http://localhost:8080/login`).
    *   Use your newly created credentials to log in.

4.  **Explore the Dashboard:**
    *   Upon successful login, you'll land on your personalized dashboard, showing your progress, streaks, and activity.

5.  **Start Learning!**
    *   Navigate to the "Módulos" section from the sidebar or via the dashboard links.
    *   Select a module to start a lesson marathon and begin earning XP!

### Example: Starting a Lesson Marathon

Let's say you're on the Dashboard and want to start a lesson from a module.

1.  Click on a module card. This will take you to `/lessons?modulo=<moduleId>`.
2.  The application will present you with the first challenge.
3.  For a "Translation" challenge, you might see something like:

    ```html
    <!-- Example of a Translation Challenge JSP (traducao.jsp) -->
    <div class="resolver-container">
        <div class="header-desafio">
            <a href="${pageContext.request.contextPath}/lessons?action=sair" class="btn-close">X</a>
            <div class="progress-container">
                <div class="progress-bar" style="width: ${progresso}%"></div>
            </div>
        </div>

        <div class="phrase-to-translate">
            <div class="duck-icon">🦆</div>
            <div class="bubble">${desafio.enunciado}</div>
        </div>

        <form action="${pageContext.request.contextPath}/lessons" method="post">
            <input type="hidden" name="desafioId" value="${desafio.id}">
            <textarea id="inputTraducao" name="resposta" placeholder="Escreva a sua tradução aqui..."></textarea>
            <button type="submit" class="btn-verificar">Verificar</button>
        </form>
    </div>
    ```

4.  Enter your translation in the textarea and click "Verificar" (Check).
5.  Based on your answer, you'll either progress to the next challenge (if correct) or lose a "life" and get another chance.

---

## 🐛 Troubleshooting

Encountering issues? Here are some common problems and their solutions:

*   **`Connection refused` to `linguados-db:3306`:**
    *   **Reason:** The database container might not be running or initialized correctly.
    *   **Solution:**
        1.  Stop all Docker containers: `docker-compose down`
        2.  Remove old volumes (this will clear your database data, use with caution if you have important data): `docker-compose down --volumes`
        3.  Rebuild and restart: `docker-compose up -d --build`
        4.  Wait a few moments for MySQL to fully start and initialize the database.

*   **Application not accessible on `localhost:8080`:**
    *   **Reason:** Another application might be using port `8080`, or the `linguados-app` container failed to start.
    *   **Solution:**
        1.  Check if `linguados-app` is running: `docker-compose ps`
        2.  View logs for errors: `docker-compose logs linguados-app`
        3.  If another process is using port `8080`, stop it or change the port mapping in `docker-compose.yml` (e.g., `8081:8080`).

*   **`ClassNotFoundException: com.mysql.cj.jdbc.Driver`:**
    *   **Reason:** The MySQL JDBC driver is not properly included in the WAR file or is not accessible to Tomcat.
    *   **Solution:** Ensure `pom.xml` has the `mysql-connector-j` dependency and `mvn clean package` successfully builds the WAR. The `Dockerfile` handles copying the WAR. This error is less likely with the provided Docker setup but could occur in manual deployments.

*   **Characters (like 'ç' or accents) are displayed incorrectly:**
    *   **Reason:** Character encoding issues between the database, application, and browser.
    *   **Solution:**
        1.  Ensure your `DatabaseConfig.java` has `useUnicode=true&characterEncoding=UTF-8`.
        2.  Ensure your JSPs have `<%@ page contentType="text/html;charset=UTF-8" language="java" %>`.
        3.  Ensure your `doPost` methods in servlets include `request.setCharacterEncoding("UTF-8");`.
        4.  The Docker setup's `initdb` scripts should ideally create tables with `DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;`.

---

## 🗺️ Roadmap

Linguados is continuously evolving! Here are some features and improvements planned for future iterations:

*   **More Challenge Types:**
    *   **Listening Comprehension:** Audio-based challenges.
    *   **Speaking Practice:** Voice recognition for pronunciation feedback.
    *   **Sentence Reordering:** Arrange words to form correct sentences.
    *   **Code Interpretation:** Translate or explain short code snippets.
*   **Personalized Learning Paths:** AI-driven recommendations for modules and challenges based on user performance and goals.
*   **User-Generated Content:** Allow trusted users to propose new challenges and modules, with a moderation system.
*   **Detailed Progress Analytics:** Advanced charts and reports for users to track their strengths, weaknesses, and learning trends.
*   **Daily Quests & Events:** Introduce limited-time challenges and daily goals to boost engagement.
*   **Mobile Application:** Develop native iOS and Android applications for on-the-go learning.
*   **Internationalization (i18n):** Support for multiple interface languages (beyond just Portuguese/English learning content).
*   **Enhanced Security:** Implement password hashing (e.g., BCrypt) instead of plain text for user authentication.

---

## 🤝 Contribution Guidelines

We welcome contributions from the community! If you're passionate about language learning and software development, here's how you can help:

1.  **Fork the Project:** Create your own fork of the repository on GitHub.
2.  **Create a Feature Branch:**
    ```bash
    git checkout -b feature/your-feature-name
    ```
    (e.g., `feature/add-listening-challenge` or `fix/dashboard-bug`)
3.  **Implement Your Changes:** Write clear, concise code following existing coding standards.
4.  **Commit Your Changes:** Use [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) for clear commit messages.
    ```bash
    git commit -m 'feat: Implement new listening challenge type'
    ```
    or
    ```bash
    git commit -m 'fix: Resolve dashboard display bug on mobile'
    ```
5.  **Push to Your Branch:**
    ```bash
    git push origin feature/your-feature-name
    ```
6.  **Open a Pull Request (PR):**
    *   Go to the original repository on GitHub.
    *   You'll see an option to open a Pull Request from your branch.
    *   Provide a clear description of your changes, why they are needed, and any relevant screenshots.
    *   Ensure your code passes all existing tests (if any) and adheres to the project's quality standards.

### Coding Style & Quality

*   **Java:** Adhere to standard Java conventions.
*   **JSP/HTML/CSS/JS:** Maintain a clean, readable, and consistent codebase.
*   **MVC Pattern:** Respect the separation of concerns.
*   **Meaningful Variable Names:** Use descriptive names for variables and methods.
*   **Documentation:** Add Javadoc for complex methods/classes and inline comments where necessary.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
Made with ❤️ by passionate developers for language enthusiasts!
---