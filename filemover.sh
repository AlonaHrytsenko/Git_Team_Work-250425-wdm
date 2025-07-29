#!/bin/bash

# Запрос исходной и целевой директории у пользователя
read -p "Введите исходную директорию: " source_directory
read -p "Введите целевую директорию: " target_directory

if [ ! -d "$source_directory" ]; then
  echo "Проверка исходной директории '$source_directory'"
  exit 1
fi

if [ ! -d "$target_directory" ]; then
  echo "Целевая директория '$target_directory' не найдена"
  
  mkdir -p '$target_directory'
  echo "Создана целевая директория: '$target_directory'"
else
  echo "Целивая директория'$target_directory' уже существует"
fi


# Запрос расширения файлов, которые нужно скопировать
read -p "Введите расширение файлов, которые хотите скопировать:" file_extension 
# Запросить новое расширение для файлов.
read -p "Введите новое расширение файлов: " new_file_extension;echo "Вы ввели: $new_file_extension"
# Проверка существования исходной директории и целевой директории


if [ ! -d "$source_directory" ]; then
  echo "Исходная директория $source_directory не существует или недоступна."
  exit 1
fi

if [ ! -d "$target_directory" ]; then
  echo "Целевая директория $target_directory не существует или недоступна."
  mkdir -p $target_directory
fi

echo "Обе директории существуют и доступны."


# Проверка, есть ли файлы с указанным расширением в исходной директории
if ls "$source_directory"/*."$file_extension"; then
  echo "Файлы с расширением .$file_extension найдены в '$source_directory'"
else
  echo "Ошибка: нет файлов с расширением .$file_extension в '$source_directory'"
  exit 1
fi
# Копирование файлов с указанным расширением в целевую директорию
#переменные, которые должны быть созданы до данного этапа:
#source_directory="source_directory"
#target_directory="target_directory"
#file_extension=".file_extension"
#new_file_extension=".new_file_extension"

mkdir -p "$target_directory"

for file in "$source_directory"/*"$file_extension"; do
    if [ -f "$file" ]; then
	filename=$(basename "$file")
	filename_without_ext="${filename%$file_extension}"
	new_filename="${filename_without_ext}${new_file_extension}"
	cp "$file" "$target_directory/$new_filename"
	echo "Копирование файла: $filename в $target_directory/$new_filename"
fi

# Архивация исходных файлов.

