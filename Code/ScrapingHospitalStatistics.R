library(rvest)
library(RCurl)

URL <- "https://www.ahd.com/state_statistics.html"

#Scrape Hospital Statistics by State 

HospitalsState <- URL %>%
  read_html()%>%
  html_nodes(xpath = '//*[@id="main"]/div[1]/div/table')%>%
  html_table() %>%
  data.frame(stringsAsFactors = FALSE)

HospitalsState$State <- gsub("^[A-Z]{2}", "", HospitalsState$State)
HospitalsState$State <- gsub("-", "", HospitalsState$State)
HospitalsState$State <- trimws(HospitalsState$State)

write.csv(HospitalsState, "HospitalsState.csv")
