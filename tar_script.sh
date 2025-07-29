archName="$target_directory/old_files_$(date +%Y-%M-%D).tar.gz"
tar -czf $archName $source_directory/*.$file_extension
rm -rf $source_directory/*.$file_extension
