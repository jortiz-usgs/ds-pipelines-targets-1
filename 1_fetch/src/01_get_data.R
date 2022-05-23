# this function takes an output directory, and downloads the mendota csv file there.

get_data = function(out_dir) {
  mendota_file <- file.path(out_dir)#file.path(project_output_dir, "model_RMSE")
    #file.path(out_dir)
  item_file_download('5d925066e4b0c4f70d0d0599', names = 'me_RMSE.csv', destinations = mendota_file, overwrite_file = TRUE)
  return(mendota_file)
}
