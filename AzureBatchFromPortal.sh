#runs a command line to display the Batch environment variables on a compute node, and then waits 90 seconds.
cmd /c "set AZ_BATCH & timeout /t 90 > NUL"