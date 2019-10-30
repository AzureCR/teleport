echo "starting to launch sqlservr"

/opt/mssql/bin/sqlservr &

echo "starting to scan db"

./wait-for-it.sh localhost:1433 --timeout=30 -- /opt/mssql-tools/bin/sqlcmd -Slocalhost -Usa -P1234qwerASDF -i ./scan-db.sql