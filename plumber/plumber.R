##############################################
# Slate API scripts here
# This is a working script for the API tools
##############################################

# plumber.R
#* Echo back the input
#* @param msg The message to echo
#* @get /slate
function(){
  d<-data.frame(uZeeMeeID='d9b3314c-dbfc-4018-90c2-e2bebdf2b4b5',uSlateID='4d313431-b0c8-49f9-87dd-ed86e81166e0')
  d2<-data.frame(uZeeMeeID='dofdsb3314c-gbfc-403538-90c2-e2be353252b4b5',uSlateID='ase3431-te0c8-4ere9-87werw-ederewwr166e0')
  d<-rbind(d,d2)
  l<-list()
  l$records<-d
  return(l)
}

#{   u’row’: [   {   u’ZeeMeeID’: u’d9b3314c-dbfc-4018-90c2-e2bebdf2b4b5',
#                   u’SlateID’: u'4d313431-b0c8-49f9-87dd-ed86e81166e0'}]}

#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg=""){
  list(msg = paste0("The messagsfdsafase is: '", msg, "'"))
}

#* Plot a histogram
#* @png
#* @get /plot
function(){
  rand <- rnorm(100)
  hist(rand)
}

#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @post /sum
function(a, b){
  as.numeric(a) + as.numeric(b)
}