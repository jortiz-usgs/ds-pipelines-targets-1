# pipeline script

#load library
library(targets)

#source functions
source('1_fetch/src/01_get_data.R')
source('2_process/src/02_prep_data_for_plots.R')
source('3_visualize/src/03_draw_plot.R')
source('3_visualize/src/04_create_diag_log.R')

tar_option_set(packages = c("tidyverse", "sbtools", "whisker"))
list(
  # Get the data from ScienceBase
  tar_target(
    model_RMSEs_csv,
    get_data(out_dir = "model_RMSEs.csv"),
    format = "file"
  ), 
  # Prepare the data for plotting
  tar_target(
    eval_data,
    prep_data_for_plots(filename = model_RMSEs_csv),
  ),
  # Create a plot
  tar_target(
    figure_1_png,
    draw_plot(directory = "figure_1.png", data = eval_data), 
    format = "file"
  ),
  # Save the processed data
  tar_target(
    model_summary_results_csv,
    write_csv(eval_data, file = "model_summary_results.csv"), 
    format = "file"
  ),
  # Save the model diagnostics
  tar_target(
    model_diagnostic_text_txt,
    create_diag_log(out_filepath = "model_diagnostic_text.txt", data = eval_data), 
    format = "file"
  )
)
