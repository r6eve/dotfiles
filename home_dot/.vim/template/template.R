:if search('<+CURSOR+>')
:  normal! "_da>
:endif
#!/usr/bin/Rscript --vanilla

con <- file(description='stdin', open='r')
while (length(n <- readLines(con, n=1, warn=FALSE)) > 0) {
  cat(paste(n, '\n', sep=''))
  <+CURSOR+>
}
close(con)
