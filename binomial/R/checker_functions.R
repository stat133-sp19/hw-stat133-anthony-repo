# private function to check the validity of input probability value
check_prob <- function(prob){
  if (!is.numeric(prob) || length(prob) != 1){
    stop("Probability value must be a number!")
  } else if (prob < 0 || prob > 1){
    stop("Probability must be a number between 0 and 1")
  } else {
    TRUE
  }
}

# private function to check the validity of input number of trials
check_trials <- function(trials){
  if (!is.numeric(trials) || trials <= 0 || trials %% 1 != 0 || length(trials) != 1) {
    stop("Invalid trials value!")
  } else {
    TRUE
  }
}

# private function to check the validity of input number of sucesses
check_success <- function(success, trials){
  check_trials(trials)
  if (!is.numeric(success) || FALSE %in% (success >= 0) || FALSE %in% (success %% 1 == 0)){
    stop("Invalid success value!")
  } else if (max(success) > trials) {
    stop("success cannot be greater than trials!")
  } else{
    TRUE
  }
}
