# this function takes an output directory, and downloads the mendota csv file there.

get_data = function(out_file) {
  # create output folder
  dir_out = "1_fetch/out/"
  dir.create(dir_out)
  write.table(NA , file=paste0(dir_out, "placeholder.txt"), row.names = F, col.names = F)
  
  mendota_file <- paste0(dir_out, out_file)
  item_file_download('5d925066e4b0c4f70d0d0599', names = 'me_RMSE.csv', destinations = mendota_file, overwrite_file = TRUE)
  return(mendota_file)
}
