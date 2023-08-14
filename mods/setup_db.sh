# Set up database
sudo service postgresql start
sudo -u postgres createuser firmadyne
sudo -u postgres createdb -O firmadyne firmware
sudo -u postgres psql -d firmware < ./database/schema
echo "ALTER USER firmadyne PASSWORD 'firmadyne'" | sudo -u postgres psql

