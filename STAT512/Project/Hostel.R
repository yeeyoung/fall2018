library(stringr) # install stringr for number extraction

hostel <- read.csv('data/Hostel.csv', header=T)
hostel <- subset(hostel, select = -c(1,2)) # remove old index column, and hostel name column
hostel <- na.omit(hostel) # remove rows that contain one or more NAs

# rapply(hostel, function(x) length(unique(x))) # number of unique values in each column
# table(hostel$City) # city count 
hostel <- subset(hostel, City %in% c('Kyoto', 'Osaka', 'Tokyo') ) # get hostels from 'Kyoto', 'Osaka', 'Tokyo'

# distance: extract distance from string and convert it from str type to int
# e.g. 5.9km from city centre -> 5.9
hostel[3] <- rapply(hostel[3], function(x) strtoi( str_extract(x, "\\-*\\d+\\.*\\d*")) )

rownames(hostel) <- 1:nrow(hostel) # reindex
# hostel

hostel.mod <- lm(price.from~., hostel)
summary(hostel.mod)





