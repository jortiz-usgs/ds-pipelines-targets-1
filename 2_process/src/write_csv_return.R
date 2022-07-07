# this function saves csv files and returns filenames

write_csv_return = function(item, out_file) {
  # create output folder
  dir_out = "2_process/out/" 
  dir.create(dir_out)
  write.table(NA , file=paste0(dir_out, "placeholder.txt"), row.names = F, col.names = F)
  
  write_csv(item, file = paste0(dir_out, out_file))
  return(paste0(dir_out, out_file))
}