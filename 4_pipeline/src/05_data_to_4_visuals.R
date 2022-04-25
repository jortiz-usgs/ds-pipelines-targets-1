
data_to_4_visuals = function(project_output_dir) {
  #load libraries
  library(dplyr)
  library(readr)
  library(stringr)
  library(sbtools)
  library(whisker)
  
  # source functions
  source('1_fetch/src/01_get_data.R')
  source('2_process/src/02_prep_data_for_plots.R')
  source('3_visualize/src/03_draw_plot.R')
  source('3_visualize/src/04_create_diag_log.R')
  
  # create directory
  dir.create(project_output_dir)
  
  # load the data from ScienceBase & save cvs
  original_df = get_data(project_output_dir)
  
  # prep data for plotting & save cvs
  eval_data = prep_data_for_plots(original_df)
  readr::write_csv(eval_data, file = file.path(project_output_dir,
                                               'model_summary_results.csv'))
  
  # plot data & save plot
  png(file = file.path(project_output_dir, 'figure_1.png'), width = 8, height = 10, res = 200, units = 'in')
  draw_plot(eval_data, project_output_dir)
  dev.off()
  
  # create diagnostic log file & save
  text = create_diag_log(eval_data)
  cat(text, file = file.path(project_output_dir,
                             "model_diagnostic_text.txt"))
}