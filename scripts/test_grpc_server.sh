#!/bin/bash

# Script để test kết nối gRPC server
# Sử dụng: ./scripts/test_grpc_server.sh

echo "🔍 Testing gRPC Server Connection..."
echo ""

# 1. Kiểm tra IP của máy Mac
echo "1️⃣ Checking Mac IP address..."
MAC_IP=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}' | head -1)
echo "   Mac IP: $MAC_IP"
echo ""

# 2. Kiểm tra server có đang chạy trên port 8080 không
echo "2️⃣ Checking if server is running on port 8080..."
if lsof -i :8080 > /dev/null 2>&1; then
    echo "   ✅ Server is running on port 8080"
    lsof -i :8080 | grep LISTEN
else
    echo "   ❌ Server is NOT running on port 8080"
    echo "   Please start your gRPC server first!"
fi
echo ""

# 3. Kiểm tra firewall
echo "3️⃣ Checking firewall status..."
FIREWALL_STATUS=$(sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate 2>/dev/null)
echo "   $FIREWALL_STATUS"
echo ""

# 4. Test kết nối đến server
echo "4️⃣ Testing connection to server..."
if nc -z -w 5 192.168.1.100 8080 2>/dev/null; then
    echo "   ✅ Can connect to 192.168.1.100:8080"
else
    echo "   ❌ Cannot connect to 192.168.1.100:8080"
    echo "   Possible issues:"
    echo "   - Server not running"
    echo "   - Firewall blocking"
    echo "   - Wrong IP address"
fi
echo ""

# 5. Hiển thị thông tin cấu hình
echo "5️⃣ Current configuration:"
echo "   GRPC_URL in .env.dev:"
grep GRPC_URL packages/app_config/assets/dotenv/.env.dev
echo ""

echo "✅ Test completed!"
echo ""
echo "📝 Next steps:"
echo "   1. Make sure server is running: lsof -i :8080"
echo "   2. Make sure IP is correct: $MAC_IP"
echo "   3. Make sure phone and Mac are on same WiFi"
echo "   4. Run: flutter clean && flutter pub get && flutter run --flavor dev"

