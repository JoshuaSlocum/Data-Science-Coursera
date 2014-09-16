# Problem 1

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications;
#    Use any URL you would like for the homepage URL (http://github.com is fine)
#    and http://localhost:1410 as the callback url
#
#    Insert your client ID and secret below - if secret is omitted, it will
#    look it up in the GITHUB_CONSUMER_SECRET environmental variable.
my_app <- oauth_app("github","2c732068a85e8b4fb743","fc2bd07f4b4c38301fae9bac104d1cda0c29b6d4")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), my_app)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)
# then iterate over loop for datasharing using $name and then print $date_created

# Problem 2 and 3

acs<- read.table("./Getting and Cleaning Data/data/survey2.csv", sep=",",header = TRUE)
#just had to look at code in quiz, and run to verify answer

# Problem 4

con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
m <- c(10,20,30,100)
print(nchar(htmlCode[m]))

# Problem 5 http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for ", destfile="./Getting and Cleaning Data/data/noaa.for", method = "curl")

noaa <- read.fwf("./Getting and Cleaning Data/data/noaa.for",c(12, 7,4, 9,4, 9,4, 9,4),skip=4,header=FALSE)
