file="assets/dotenv/.env.prod"

sed -i~ "/^ENABLE_DEBUG=/s/=.*/='false'/" $file
