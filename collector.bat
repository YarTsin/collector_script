@echo off
:: Название: collector.bat
:: Назначение:  перепаковка кода проекта для анализа в чат ботах, скрипт подойдет для небольших проектов или частей проектов
:: Описание работы: Скрипт копирует содержимое всех файлов в текущей директории и всех поддиректориях и сохраняет его в файл work.txt.
:: Применение: Помещаем скрипт например в src/main/java/org/ запускаем и потом там же забираем готовый файл
:: Версия: январь 2025  для Windows 10

echo Script start

:: Очищаем или создаем файл work.txt перед запуском
> work.txt echo.

:: Переменная для подсчета количества файлов
set fileCount=0

:: Проходим по всем файлам в текущей директории и поддиректориях
for /r %%f in (*) do (
    if not "%%f"=="%~f0" if not "%%f"=="%cd%\work.txt" (
        :: Выводим путь текущего файла на консоль
        echo Processing file: %%f
        echo. >> work.txt
        echo === Start of file: %%f === >> work.txt
        type "%%f" >> work.txt
        echo. >> work.txt
        echo === End of file: %%f === >> work.txt
        set /a fileCount+=1
    )
)
:: Сообщение о количестве добавленных файлов
echo Added files to work.txt: %fileCount%
:: Сообщение о завершении процесса
echo Process completed. Result saved in file work.txt
pause