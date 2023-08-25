setup:
        @make pull
        @make up
        @make prune
        @make composer-update
pull:
        docker-compose pull
prune:
        docker image prune -f
stop:
        docker-compose stop
key:
        docker exec conatiner-name bash -c "php artisan key:generate"
up:
        docker-compose up -d
composer-update:
        docker exec conatiner-name bash -c "composer update && php artisan optimize:clear && php artisan migrate && php artisan config:cache && php artisan storage:link && chown -R www-data:www-data /var/www/html/storage"
data:
        docker exec conatiner-name bash -c "php artisan migrate"
seed:
        docker exec conatiner-name bash -c "php artisan db:seed"
