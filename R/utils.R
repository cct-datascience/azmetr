check_internet <- function(){
  attempt::stop_if_not(.x = curl::has_internet(), msg = "Please check your internet connexion")
}

check_status <- function(res){
  attempt::stop_if_not(.x = httr::status_code(res),
              .p = ~ .x == 200,
              msg = "The API returned an error")
}

ping_service <- function() {
  path <- c("v1", "observations", "daily", "az01")
  res <- httr::GET(base_url, path = path, httr::accept_json())
  status <- httr::status_code(res)
  if(status == 200){
    return(TRUE)
  } else {
    return(FALSE)
  }
}

base_url <- "https://api.azmet.arizona.edu/v1/"
