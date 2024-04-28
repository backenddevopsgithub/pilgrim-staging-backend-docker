# Start the MySQL service
service mysql start

# Wait for the MySQL service to fully start
sleep 15

# MySQL root password (set your desired password here)
ROOT_PASSWORD="pilgrim_stag_root_pass"

# Create the database
mysql -u root -p"${ROOT_PASSWORD}" -e "CREATE DATABASE db_test;"