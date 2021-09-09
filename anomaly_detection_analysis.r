install . packages (" readr ")
install . packages (" dplyr ")
install . packages (" ggplot2 ")
library ( readr )
library ( dplyr )
library ( ggplot2 )

# import data
 creditData <- read _ csv (" creditcard . csv")

 # preview the data
 head ( creditData )
 # The data has 30 variables / features .
 # The Class variable indicates if a transaction
 #is fraud ( positive case = 1) or genuine ( negative case = 0).


 # check for null values in data
 anyNA ( creditData )

 # Data Summary
 str ( creditData )


 # Calculate the percentage of fraud transactions
skew <- sum (as. numeric ( creditData $ Class ))/ nrow ( creditData )
sprintf (’Percentage of fraudulent transactions in the data set %f’,
skew * 100)

# plot number of fraud cases against non fraud cases
ggplot ( data = creditData , aes (x = Class )) +
geom _ bar () +
geom _ text ( stat =’count ’, aes ( label =.. count ..) , vjust = -.1)

 #It is evident that the data is highly skewed
 # with less than 0.2% of the transactions being fraud
 # and the rest being legitimate .

 # Analyze Fraud and Real Transaction summary
 list <- split ( creditData , creditData $ Class )
 # Analyze Normal Transactions
 
NormalTransactions <- list $ ‘0‘
 summary ( NormalTransactions $ Amount )
 # Analyze Fraud Transactions
FraudTransactions <- list $ ‘1‘
summary ( FraudTransactions $ Amount )
