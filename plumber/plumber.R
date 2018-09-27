########################################################
# API scripts here
# update this script for your own API on matrixds.com
########################################################

# plumber.R


#* Plot a histogram
#* @png
#* @get /test
function()
  return('It is alive!')
}

#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @post /sum
function(a, b){
  as.numeric(a) + as.numeric(b)
}