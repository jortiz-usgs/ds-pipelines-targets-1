# this function takes an output directory, and downloads the mendota csv file there.

get_data = function(out_file) {
  write.table(df, file="my.csv", sep=",", row.names=FALSE, append=TRUE)
  
  
  mendota_file <- file.path(out_file)
  item_file_download('5d925066e4b0c4f70d0d0599', names = 'me_RMSE.csv', destinations = mendota_file, overwrite_file = TRUE)
  return(mendota_file)
}
