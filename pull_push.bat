@echo off
:: 提示用户输入提交信息
set /p commitMessage="Enter commit message: "

:: 拉取最新代码
echo Pulling the latest code...
git pull
if %errorlevel% neq 0 (
    echo Error: git pull failed.
    exit /b %errorlevel%
)

:: 暂存所有更改
echo Adding changes...
git add .
if %errorlevel% neq 0 (
    echo Error: git add failed.
    exit /b %errorlevel%
)

:: 提交更改
echo Committing changes...
git commit -m "%commitMessage%"
if %errorlevel% neq 0 (
    echo Error: git commit failed.
    exit /b %errorlevel%
)

:: 推送更改
echo Pushing changes...
git push
if %errorlevel% neq 0 (
    echo Error: git push failed.
    exit /b %errorlevel%
)

echo Operation completed successfully!
pause
