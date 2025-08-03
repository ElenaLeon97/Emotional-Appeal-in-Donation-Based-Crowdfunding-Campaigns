librarian::shelf(dplyr, tidyr, data.table, jsonlite, httr, stringr)

# Function creates object with Face ++ key and secret, pass object to faceEst function.
authFacepp <- function(api_key, api_secret) {
    auth <- structure(list(api_key = api_key,
                           api_secret = api_secret),
                      class="FaceppProxy")
}

api_key <- #fill with key
api_secret <- #fill with secret
image_file <- file_list[13]

ex <- as.character(
          httr::RETRY(
            "POST",
            "https://api-us.faceplusplus.com/facepp/v3/detect",
            
            body = list(api_key = api_key,
                        api_secret = api_secret,
                        image_file = httr::upload_file(image_file),
                        return_landmark = 0,
                        return_attributes = "emotion,gender"),
            times = 2,
            encode = "multipart"))

faceEst <- function(fullpath, auth) {
  ## Initialize Object to score API output for single image
  face <- NULL
  
  ## create empty table to fill with API output
  faces <- data.table(
    emo_anger = as.numeric(NA), 
    emo_disgust = as.numeric(NA),
    emo_fear = as.numeric(NA),
    emo_happiness = as.numeric(NA),
    emo_neutral = as.numeric(NA),
    emo_sadness = as.numeric(NA),
    emo_surprise = as.numeric(NA),
    
    gender = as.character(NA),
    
    facecount = as.numeric(NA),
    
    fullpath = fullpath
  )
  
  # go over each fullpath and send to API
  run <- 0 
  for (i in 1:length(fullpath)) {
    run <- run + 1
    cat(run, "\n") # count and print the paths sent for user info
    # write the face variable that contains the output of the API
    while(is.null(face)) {
      try (
        face <- as.character(
          httr::RETRY(
            "POST",
            "https://api-us.faceplusplus.com/facepp/v3/detect",
            
            body = list(api_key = auth$api_key,
                        api_secret = auth$api_secret,
                        image_file = httr::upload_file(fullpath[i]),
                        return_landmark = 0,
                        return_attributes = "emotion,gender"),
            times = 2,
            encode = "multipart")),
        silent = FALSE
      )}
    ## if face is found, extract information and write into data.table
    facecount <- length(fromJSON(face)$faces$face_token)
    
    if (facecount != 0) {
      emotion <- fromJSON(face)$faces$attributes$emotion
      gender <- fromJSON(face)$faces$attributes$gender
      
      # write info to a data.table
      faces[faces$fullpath == fullpath[i],][,1:9] <- c(emotion[1,], gender[1,], facecount)

    if (facecount > 1) {
      faces <- union(x = faces,
                     y = data.table (
                        emo_anger = emotion[,1], 
                        emo_disgust = emotion[,2],
                        emo_fear = emotion[,3],
                        emo_happiness = emotion[,4],
                        emo_neutral = emotion[,5],
                        emo_sadness = emotion[,6],
                        emo_surprise = emotion[,7],
                        
                        gender = gender[,1],
                        
                        facecount = facecount,
                        
                        fullpath = fullpath[i]))
    } # end if (facecount > 1)
      
      face <- NULL
      Sys.sleep(2)
    } # end if (facecount != 0)
    else {
      face <- NULL
      Sys.sleep(2)
    }
 } # end for(i in 1:length(fullpath))
 return(faces)
} # end function

# Create the file path
filepath <- "C:/Users/user/Documents/Έγγραφα/RUG/Thesis/Thesis/Images"
file_list <- list.files(filepath, pattern = "*.jpg|*.jpeg|*.png", full.names = TRUE)

# Fill in authentication details
myauth <- authFacepp(api_key = "7fqokbmi8EBbos7qHEGgX-byGNlU55gZ", api_secret =  "WpQAK_vwVt5XjKo3He720lyr0uot57tc")

# Call the faces function
faces <- faceEst(fullpath = file_list, auth = myauth)

# Extract the UID from the full path
faces$uid <- str_extract(faces$fullpath, "\\d+(?=\\.jpg)")

# Not in every picture where found faces. So we remove the NAs.
faces <- faces %>% 
  drop_na()

# Check the number of unique pictures we're left with.
length (unique(faces$uid))
# 139 unique campaign cover images. In 9 pictures there where no faces found.

# Identify duplicate UIDs
duplicates <- faces %>%
  group_by(uid) %>%
  filter(n() > 1) %>%
  arrange(uid) %>%
  select(uid, everything())

# View the duplicates
duplicates

# Since there isn't big deviation between the emotions of the faces in each campaign, Aggregate on uid using regular mean.
faces_agg <- faces %>%
  dplyr::select(uid, facecount, emo_anger, emo_disgust, emo_fear, emo_happiness, emo_neutral, 
         emo_sadness, emo_surprise) %>%
  group_by(uid) %>%
  summarise(across(c(emo_anger, emo_disgust, emo_fear, emo_happiness, emo_neutral, emo_sadness,
                     emo_surprise), list(mean = ~ round(mean(.), 3))),
            facecount_img = mean(facecount)) %>%
  rename(anger_img = emo_anger_mean,
         disgust_img = emo_disgust_mean,
         fear_img = emo_fear_mean,
         happiness_img = emo_happiness_mean,
         neutral_img = emo_neutral_mean,
         sadness_img = emo_sadness_mean,
         surprise_img = emo_surprise_mean)

# Check the number of unique pictures.
length (unique(faces$uid))
# 139 unique campaign cover images. Aggregation was done correctly.

# Face Count vs. Valence Scatter Plot
ggplot(full, aes(x = facecount_img, y = ave_sentiment_img)) + 
  geom_point() + 
  labs(x = "Face Count", y = "Sentiment Score") + 
  geom_smooth(method = "lm", se = FALSE) +
  theme_minimal()

# density plot sentiment score
ggplot(full, aes(x = ave_sentiment_img)) + 
  geom_density(alpha = 0.5, fill = "#377EB8") + 
  scale_x_continuous(labels = scales::comma) + 
  scale_y_continuous(labels = scales::comma) + 
  theme_minimal()

