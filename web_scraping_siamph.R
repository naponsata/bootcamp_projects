library(tidyverse)
library(rvest) 

# specphone

url <-  read_html("https://specphone.com/Samsung-Galaxy-A04.html")

att <- url %>%
  html_nodes("div.topic") %>%
  html_text2()

value <- url %>%
  html_nodes("div.detail") %>%
  html_text2()

data.frame(attribute = att , value = value)

# all samsung smartphones

samsung_url <- read_html("https://specphone.com/brand/Samsung")

# link to all samsung smartphones

links <- samsung_url %>%
  html_nodes("li.mobile-brand-item a") %>%
  html_attr("href")

full_links <- paste0("http://specphone.com", links)

# create data.frame

result <- data.frame()

for (link in full_links){
    ss_topic <- link %>%
      read_html() %>%
      html_nodes("div.topic") %>%
      html_text2()
    
    ss_detail <- link %>%
      read_html() %>%
      html_nodes("div.detail") %>%
      html_text2()
    
    tmp <- data.frame(attribute = ss_topic,
                      value = ss_detail)
    
    result <- bind_rows(result, tmp)
    print("Process ...")
}

print(result)

write_csv(result, "result_ss_phone.csv")
