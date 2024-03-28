# Use the official Redis image as the base image
FROM redis:latest

# Copy custom Redis configuration file into the image
# COPY redis.conf /usr/local/etc/redis/redis.conf
COPY redis.conf /etc/redis/redis.conf

# Set the custom configuration file as the default config
# CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
CMD ["redis-server", "/etc/redis/redis.conf"]
