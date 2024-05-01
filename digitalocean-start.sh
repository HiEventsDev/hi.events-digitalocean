
export VITE_FRONTEND_URL=${APP_FRONTEND_URL:-"/"}

echo "Starting with the following environment variables:"
echo "APP_FRONTEND_URL=${APP_FRONTEND_URL}"
echo "VITE_FRONTEND_URL=${VITE_FRONTEND_URL}"

exec /startup.sh