#!/bin/bash
set -e
echo "🔨 开始构建 OCR识图 App..."

# 1. 安装依赖
echo "📦 安装 npm 依赖..."
npm install

# 2. 构建 Web 资源
echo "🏗️ 构建 Web 前端..."
npm run build

# 3. 初始化 Android 平台（首次运行）
if [ ! -d "android" ]; then
  echo "📱 初始化 Android 平台..."
  npx cap add android
fi

# 4. 同步 Web 资源到 Android
echo "🔄 同步资源..."
npx cap sync android

# 5. 构建 APK
echo "📲 构建 APK..."
cd android
./gradlew assembleDebug
cd ..

echo ""
echo "✅ 构建完成！"
echo "APK 位置: android/app/build/outputs/apk/debug/app-debug.apk"
echo ""
echo "如需在 Android Studio 中打开:"
echo "  npx cap open android"
