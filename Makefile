postgres:
	docker run --name postgres17 -p 5436:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=ericfei306 -d postgres:17.4-alpine
createdb:
	docker exec -it postgres17 createdb --username=root --owner=root simple_bank
dropdb:
	docker exec -it postgres17 dropdb --username=root simple_ban
migrateup:
	migrate -path db/migration -database "postgresql://root:ericfei306@localhost:5436/simple_bank?sslmode=disable" -verbose up
migratedown:
	migrate -path db/migration -database "postgresql://root:ericfei306@localhost:5436/simple_bank?sslmode=disable" -verbose down
sqlc:
	sqlc generate
.PHONY: postgres createdb dropdb migrateup migratedown sqlc