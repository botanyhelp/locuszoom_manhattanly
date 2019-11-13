The manhattanly shiny app can be started like this:

sudo nohup R -e "shiny::runApp('~/locuszoom_manhattanly',port=8789,host=getOption('li1077-179.members.linode.com'))" &

Notice that the system where this command works:
1. uses "sudo" to gain root access (not necessary to listen on port 8789)
2. has program "nohup", the "no hangup" program, helps process to continue when user logs out of machine, logs output to file nohup.out
3. has program "R" on the path
4. uses an R that has installed and can load packages shiny, manhattanly, plotly, dplyr
5. specifies a hostname in the linode.com domain
6. uses ampersand "&" to start process in the background
