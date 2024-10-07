

docker run --name postgresql -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=kanban -p 5432:5432 -d postgres:latest
