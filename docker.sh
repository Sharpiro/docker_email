docker build -t email-image .
docker run --rm -p 25:25 --hostname mail.sharpiro.net --name email-container \
    -e mailname=sharpiro.net email-image
