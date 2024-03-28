# echo "Adding Host started..."
# sudo ./host-helper.sh addhost laravel.local
# echo "Adding Host completed..."

# echo "Cloning Laravel ..."
# git clone git@github.com:laravel/laravel.git php/laravel

# echo "Building Docker..."
# docker compose build

# echo "Composer Installing dependencies..."

# cp php/laravel/.env.example php/laravel/.env

# docker exec -it php bash -c 'composer install ; php artisan key:generate ; php artisan route:clear ; php artisan view:clear ; php artisan cache:clear ; php artisan config:clear ; php artisan config:cache ; '

# echo "Starting Docker..."
# docker compose up -d

# echo -e "\033[33;32m Environment Setup Completed ... :)"
