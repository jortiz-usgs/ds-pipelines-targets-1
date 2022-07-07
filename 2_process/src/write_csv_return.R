# this function saves csv files and returns filenames

write_csv_return = function(item, out_file) {
  write_csv(item, file = out_file)
  return(out_file)
}