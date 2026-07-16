@echo off
chcp 65001 >nul
echo. ==========================================
echo.   OCR识图 App 一键构建
echo. ==========================================
echo.

echo [1/5] 安装 npm 依赖...
call npm install
if errorlevel 1 goto :error

echo [2/5] 构建 Web 前端...
call npm run build
if errorlevel 1 goto :error

echo [3/5] 初始化 Android 平台...
if not exist "android" (
  call npx cap add android
) else (
  echo Android 平台已存在，跳过
)

echo [4/5] 同步 Web 资源到 Android...
call npx cap sync android

echo [5/5] 构建 Debug APK...
cd android
call gradlew.bat assembleDebug
cd ..

echo.
echo ==========================================
echo   构建完成！
echo   APK 位置: android\app\build\outputs\apk\debug\app-debug.apk
echo ==========================================
echo.
echo 如需在 Android Studio 中打开:
echo   npx cap open android
echo.
goto :end

:error
echo.
echo ❌ 构建失败！请检查上方错误信息。
echo.

:end
pause
