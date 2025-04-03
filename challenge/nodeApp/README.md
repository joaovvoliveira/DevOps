1.	Dockerfile Creation
    Ive done few dockerfiles building a node.js application trying to reduce it size remembering about how a Dockerfile work.
    Building with a volumes and network.
2.	Docker Compose Configuration
	Setting up a docker-compose file with a Node application, connected with a MySQL database, ensuring that the database data is persisted and not lost every time the docker-compose is brought down.
3.	Volume Configuration
	Implemented Docker volumes for MySQL to ensure data persistence across container restarts.
5.	Environment Variables
	Defined enviroment variables, keeping my password protected with a .env file, ensuring that the configurations like database URLs are injected securely into the application.
6.	Documentation
	Documented all my steps on this README, outlining the process to help me recall the steps for future challenges and projects ahead.