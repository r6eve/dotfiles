:if search('<+CURSOR+>')
:  normal! "_da>
:endif
#!/usr/bin/Rscript --vanilla

suppressPackageStartupMessages(library(tidyverse))
options(readr.num_columns = 0)

<+CURSOR+>
