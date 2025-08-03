librarian::shelf(readr,psych,dplyr,visdat,VIM,tidyverse,corrplot,RColorBrewer,ggplot2,gt, regclass,gridExtra, VGAM, AER, Hmisc, MASS, mgcv, robustbase, sur, nortest, nortest, DescTools, DAAG, jtools, mediation, gvlma, stringr, stargazer, whitestrap, knitr)

# load the dataset
data <- read.csv("crowdfunding_data.csv")

# Remove unecessary variables
data <- data[,-c(1,3,4,26:118)]

# first look ---
summary(data)
str(data)

# unique values ----
unique(data$language)
# "en"

unique(data$currency)
# "USD" "AUD" "CAD" "EUR" "GBP"

unique(data$Category)
# [1] Funerals & Memorials        Other                       Accidents & Emergencies    
# [4] Medical, Illness & Healing  Dreams, Hopes & Wishes      Sports, Teams & Clubs      
# [7] Education & Learning        Babies, Kids & Family       Animals & Pets             
#[10] Rent, Food & Monthly Bills  Volunteer & Service         Creative Arts, Music & Film
#[13] Missions, Faith & Church 

# organize the dataset ----
data <- data %>% 
  # organise the order of the variables
  dplyr::select(uid, Title, URL, Category, Created, pull_date, date_difference,
                currency, conversion, Goal, goal_USD, Raised, raised_USD, Donations,
                ln_donations, unique_donors, ln_unique_donors, Followers, ln_followers,
                Shares, ln_shares) %>%  
  # all variable names in lowercase
  rename_with(tolower) %>%
  # Convert variables to correct format
  mutate(
    created = as.Date(created, format = "%d-%b-%y"),
    pull_date = as.Date(pull_date, format = "%d-%b-%y")
  ) %>%
  # convert category to factor
  mutate(
    category = as.factor(category),
    uid = as.character(uid)
  )

str(data)

# Merge the aggregated image data with crowdfunding data.
with_img <- faces_agg %>%
  left_join(data, by = "uid")

# inspect the count to see if the merge happened correctly
nrow(with_img)
# All 139 campaigns are in.

# reorder and rename the variables
with_img <- with_img %>% 
  # organise the order of the variables
  dplyr::select(uid, title, category, created, pull_date, date_difference,
                currency, conversion, goal, goal_usd, raised, raised_usd, donations,
                ln_donations, unique_donors, ln_unique_donors, followers, ln_followers,
                shares, ln_shares, anger_img, disgust_img, fear_img, happiness_img, 
                neutral_img, sadness_img, surprise_img, facecount_img) %>%  
  # all variable names in lowercase
  rename_with(tolower)

nrow(with_img)
# 139

write.csv(with_img,"with_img.csv", row.names = FALSE)

# Prepare df for merge.
tokens <- tokens %>%
   rename(positive_txt = pos_sentimentr,
          negative_txt = neg_sentimentr)

# Merge the txt with the full dataset
full <- with_img %>%
  left_join(tokens, by = "uid") %>%
  select(uid, text, category, created, pull_date, date_difference,
         currency, conversion, goal, goal_usd, raised, raised_usd, donations,
         ln_donations, unique_donors, ln_unique_donors, followers, ln_followers,
         shares, ln_shares, anger_img, disgust_img, fear_img, happiness_img, 
         neutral_img, sadness_img, surprise_img, facecount_img, ave_sentiment,
         positive_txt, negative_txt) %>%
  rename(title = text)

str(data)

# Sum the positive and negative % of each uid images
full <- full %>%
  mutate(
    positive_sum = happiness_img,
    negative_sum = anger_img + disgust_img + fear_img + sadness_img + surprise_img,
    total_sum = positive_sum + negative_sum
  )

# Box plots
ggplot(full, aes(x = "", y = positive_sum)) + 
  geom_boxplot() + 
  theme_classic() + 
  labs(x = "", y = "Positive Emotions Sum")

ggplot(full, aes(x = "", y = negative_sum)) + 
  geom_boxplot() + 
  theme_classic() + 
  labs(x = "", y = "Negative Emotions Sum")

# Density plots
library(gridExtra)

p1 <- ggplot(full, aes(x = positive_sum)) + geom_density(alpha = 0.5, fill = "blue") + scale_x_log10() + theme_minimal()

p2 <- ggplot(full, aes(x = negative_sum)) + geom_density(alpha = 0.5, fill = "red") + scale_x_log10() + theme_minimal()

grid.arrange(p1, p2, ncol = 2)

# Create positive_img & negative_img variables
full <- full %>%
  mutate(
    positive_img = ifelse(positive_sum > negative_sum, 1, 0),
    negative_img = ifelse(negative_sum > positive_sum, 1, 0)
  )

# Compare
table(full$positive_img, full$negative_img)
barplot(table(full$positive_img, full$negative_img),
         main = "Bar Plot of Contingency Table",
         xlab = "full$negative_img",
         ylab = "Frequency",
         col = c("blue", "purple"))

# Calculate average sentiment score for each image
full$ave_sentiment_img <- (full$happiness_img + full$neutral_img - full$anger_img - full$disgust_img - full$fear_img - full$sadness_img - full$surprise_img)

# Inspect the results
summary(full$ave_sentiment_img)
# summary(full$ave_sentiment_img)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#-1.0000  0.4117  0.9172  0.6299  0.9960  1.0000 
# summary(full$ave_sentiment)
#    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
#-0.88388 -0.27507  0.00000 -0.04804  0.02910  0.70711

# positive and negative

full <- full %>%
  mutate(pos_ave_img = ifelse(ave_sentiment_img > 0, ave_sentiment_img, 0),
         neg_ave_img = ifelse(ave_sentiment_img < 0, ave_sentiment_img, 0))

# alternative: avg scores as continuous in a scale
full <- full %>%
  mutate(
    facecount = if_else(facecount_img > 0, facecount_img, 1), # make sure there are no images with 0 faces
    ave_sentiment_img = (happiness_img - 
                         anger_img - disgust_img - 
                         fear_img - sadness_img - 
                         surprise_img) /100
  )
summary(full)

# positive and negative
full <- full %>%
  mutate(pos_ave_img = ifelse(avg_sentiment_img > 0, avg_sentiment_img, 0),
         neg_ave_img = ifelse(avg_sentiment_img < 0, avg_sentiment_img, 0))




# separate pos and neg ave_sentimentr
full <- full %>%
  mutate(pos_ave_sentiment = ifelse(ave_sentiment > 0, ave_sentiment, 0),
         neg_ave_sentiment = ifelse(ave_sentiment < 0, ave_sentiment, 0)) %>%
  rename(pos_ave_txt = pos_ave_sentiment,
         neg_ave_txt = neg_ave_sentiment)

# Create a data frame with the descriptives
descriptives <- full[, c("pos_ave_txt", "pos_ave_img","neg_ave_txt", "neg_ave_img", 
                               "ave_sentiment", "ave_sentiment_img")]

descriptives_df <- data.frame(
  variables = names(descriptives),
  Min = sapply(descriptives, function(x) if(is.numeric(x)) min(x) else ""),
  Max = sapply(descriptives, function(x) if(is.numeric(x)) max(x) else ""),
  Mean = sapply(descriptives, function(x) if(is.numeric(x)) mean(x) else ""),
  Median = sapply(descriptives, function(x) if(is.numeric(x)) median(x) else ""),
  SD = sapply(descriptives, function(x) if(is.numeric(x)) sd(x) else "")
)

descriptives_df$Min <- sapply(descriptives, function(x) if(is.numeric(x)) round(min(x), 3) else "")
descriptives_df$Max <- sapply(descriptives, function(x) if(is.numeric(x)) round(max(x), 3) else "")
descriptives_df$Mean <- sapply(descriptives, function(x) if(is.numeric(x)) round(mean(x), 3) else "")
descriptives_df$Median <- sapply(descriptives, function(x) if(is.numeric(x)) round(median(x), 3) else "")
descriptives_df$SD <- sapply(descriptives, function(x) if(is.numeric(x)) round(sd(x), 3) else "")

# Replace "-" with "" for categorical variables
descriptives_df[descriptives_df == "-"] <- ""

# Create the gt table
descriptives_df %>% 
  gt() %>% 
  fmt_number(columns = c("Min", "Max", "Mean", "Median", "SD"), 
             decimals = 3)

# Missing data ----
## Visualize missing data percentage
vis_miss(data[, colSums(is.na(data)) > 0])

## Missing data pattern plot
aggr(data, col=c('navyblue','red'),
     numbers=TRUE,
     sortVars=TRUE,
     labels=names(data),
     cex.axis=.7,
     gap=3,
     ylab=c("Histogram of Missing data","Pattern"))
# Exactly the same % of missings in the emotions variables. Those NAs where cause because those specific images had no recognizable faces in them. Since we are only interested in face expressions we remove them.

## Remove rows with NAs.
data <- data %>% 
  drop_na()

colSums(is.na(data))
summary(data)
nrow(data)
# observations went from 149 to 111.

# Identify outliers. ----
# Use only numerical variables.
out_df <- full %>% 
  select_if(~ inherits(.x, c("numeric", "integer")))

# specify the numeric variables
variables <- c("raised_usd", "avg_sentiment_img", "ave_sentiment", "goal_usd", "date_difference", "unique_donors", "followers")

# Loop through each variable and create a box plot ----
par(mfrow=c(1,2))
for (var in variables) {
    boxplot(full[[var]], main=paste("Boxplot of", var), ylab="Value", col="blue")
}
# goal_usd, raised_usd, unique donors, followers, shares. However, in all those variables the outliers are logical.

# Identify the outliers in each variable ----
outliers <- apply(out_df, 2, function(x) boxplot.stats(x)$out)

for (i in 1:length(outliers)) {
  if (length(outliers[[i]]) > 0) {
    cat("Outliers in", names(outliers)[i], ":\n")
    print(outliers[[i]])
  }
}

# Outliers in goal_usd :
# [1]  37000  67000  40200  25000  25000  21000  50000  55000  30000  50000  50000  30000
#[13]  50000  50000  45000  50000 400000  78000  23400  40560

# Outliers in raised_usd :
# [1] 32826.40 15525.00 21345.00 21333.00 12100.00 10516.00 37150.00 45527.00 18290.00
#[10] 10835.00 17082.00 11731.20 15982.98

# Outliers in donations :
# [1] 196 452 290 140 120 502 571 195 208 135 334

# Outliers in unique_donors :
# [1] 157 447 290 140 120 495 564 189 201 135 325

# Outliers in followers :
# [1] 161 449 301 144 135 486 599 208 201 141 330

# Outliers in shares :
# [1]  814  736 1020 1025  880 1792  815 1146 2714 2045 1622 1937  797

# Histograms
for (var in variables) {
  x <- out_df[[var]]
  if (is.integer(x)) {
    x <- as.numeric(x)
  }
  hist(x, main=paste("Histogram of", var), xlab=var, ylab="Frequency", col="blue")
}

# Identify the total number of outliers in each variable ----
# (variables that have more than 10 outliers)
outlier_counts <- apply(out_df, 2, function(x) length(boxplot.stats(x)$out))
outlier_df <- data.frame(Variable = names(outlier_counts), Outlier_Count = outlier_counts)
outlier_df %>%
  filter(Outlier_Count > 10) %>%
  arrange(desc(Outlier_Count)) %>% 
  gt() %>%
  tab_header(title = "Outlier Counts")

# We identify quite a few outliers across variables.

# Remove extreeme outlier where goal_usd is 400000
full <- full %>% filter(goal_usd != 400000)

## Verify if the outlier has been removed
boxplot(full$goal_usd, main = "Boxplot of goal_usd after removing the extreme outlier")
max(full$goal_usd)
# it is removed

# Interesting insights ----
# Obs per category
category_colors <- c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3", "#FF7F00", "#FFFF33", 
                      "#A65628", "#F781BF", "#999999", "#E6AB02", "#D9F0D3", "#666666",
                      "#8DD3C7", "#BEBADA", "#FB8072", "#80B1D3", "#BC80BD", "#3CB44B")

# Create a ggplot with more space between bars
ggplot(as.data.frame(table(full$category)), aes(x = reorder(Var1, -Freq), y = Freq, fill = Var1)) + 
  geom_col(width = 0.4, position = position_dodge(width = 0.8)) +  # Make bars narrower and spread out more
  labs(x = "Category", y = "Number of Observations") + 
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 12, margin = margin(t = 10))) +  # Rotate x-axis labels by 45 degrees and add margin
  scale_fill_manual(values = category_colors) + 
  theme(legend.position = "none") +  # Remove the legend
  scale_x_discrete(labels = function(x) str_wrap(x, width = 10))  # Wrap text labels


## Donations per Category
raised_cat <- full %>%
  group_by(category) %>%
  summarize(Total_Raised_USD = sum(raised_usd, na.rm = TRUE)) %>%
  arrange(desc(Total_Raised_USD)) %>%
  
raised_cat

ggplot(raised_cat, aes(x = reorder(category, -Total_Raised_USD), y = Total_Raised_USD, fill = category)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = category_colors) +  # Set colors manually
  labs(x = "Category", y = "Total Raised (USD)") +
  theme(axis.text.x = element_text(angle = 55, hjust = 1, size = 12),  # Rotate x-axis labels by 45 degrees
        panel.background = element_blank(),  # Remove background
        legend.position = "none")  # Remove legend


## AVG Donations per Category
categories_to_keep <- c("Medical, Illness & Healing",
                        "Funerals & Memorials",
                        "Other",
                        "Babies, Kids & Family",
                        "Accidents & Emergencies",
                        "Education & Learning")

avg_cat <- full %>%
  group_by(category) %>%
  summarize(Total_Raised_USD = sum(raised_usd, na.rm = TRUE),
            Total_Campaigns = n(),
            Avg_donations = Total_Raised_USD / Total_Campaigns) %>%
  arrange(desc(Total_Raised_USD))

ggplot(avg_cat, aes(x = reorder(category, -Avg_donations), y = Avg_donations, fill = category)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = category_colors) +  # Set colors manually
  labs(x = "Category", y = "Average Donations (USD)", title = "Average Donations (USD) per Category") +
  theme(axis.text.x = element_text(angle = 40, hjust = 1, size = 10),  # Rotate x-axis labels by 45 degrees
        panel.background = element_blank(),  # Remove background
        legend.position = "none")  # Remove legend

# How many campaigns achieved their goal?
full %>% 
  summarise(
    campaigns_reached_goal = sum(raised_usd >= goal_usd),
    prop_campaigns_reached_goal = mean(raised_usd >= goal_usd) * 100
  )

# Filter, create dummy variables, and summarize in one step
campaigns_reached_goal_summary <- full %>%
  filter(raised_usd >= goal_usd) %>%
  mutate(
    pos_img_appeal = ifelse(pos_ave_img > neg_ave_img, 1, 0),    # Dummy for positive image appeal
    neg_img_appeal = ifelse(neg_ave_img > pos_ave_img, 1, 0),    # Dummy for negative image appeal
    pos_txt_appeal = ifelse(pos_ave_txt > neg_ave_txt, 1, 0),    # Dummy for positive text appeal
    neg_txt_appeal = ifelse(neg_ave_txt > pos_ave_txt, 1, 0)     # Dummy for negative text appeal
  ) %>%
  summarise(
    campaigns_with_both = sum(pos_img_appeal == 1 & pos_txt_appeal == 1| neg_img_appeal == 1 & neg_txt_appeal == 1),
    positive_img_appeal = sum(pos_img_appeal),
    negative_img_appeal = sum(neg_img_appeal),
    positive_txt_appeal = sum(pos_txt_appeal),
    negative_txt_appeal = sum(neg_txt_appeal),
    prop_positive_img_appeal = mean(pos_img_appeal) * 100,   # Percentage with positive image appeal
    prop_negative_img_appeal = mean(neg_img_appeal) * 100,   # Percentage with negative image appeal
    prop_positive_txt_appeal = mean(pos_txt_appeal) * 100,   # Percentage with positive text appeal
    prop_negative_txt_appeal = mean(neg_txt_appeal) * 100    # Percentage with negative text appeal
  )



# Density plots for txt sentiment ----
p1 <- ggplot(full, aes(x = ave_sentiment)) +
  geom_density(alpha = 0.5, fill = brewer.pal(n = 12, name = "Set3")[4]) +
  theme_minimal()

p2 <- ggplot(full, aes(x = negative_sum)) + 
  geom_density(alpha = 0.5, fill = sample(brewer.pal(n = 12, name = "Set3"))) +  
  theme_minimal()

p3 <- ggplot(full, aes(x = positive_sum)) + geom_density(alpha = 0.5, fill = "pink") + theme_minimal()

grid.arrange(p1, p2, p3, ncol =3)

# density plot sentiment score img ----
p4 <- ggplot(full, aes(x = ave_sentiment_img)) + 
  geom_density(alpha = 0.5, fill = brewer.pal(n = 12, name = "Set3")[3]) +
  theme_minimal()

grid.arrange(p1, p4, nrow = 2)

# Calculate the proportions for emotions and _img emotions
prop <- prop.table(colSums(full[, c(32:33)]))

# Create a stacked bar plot
barplot(
  prop,
  beside = FALSE,
  horiz = TRUE,
  cex.names = 0.7,
  las = 1,
  xlab = "Percentage")

# Density plots for raised_usd
# Density plots
p1 <- ggplot(full, aes(x = raised_usd)) + 
  geom_density(alpha = 0.5, fill = "#377EB8") + 
  scale_x_continuous(labels = scales::comma) + 
  scale_y_continuous(labels = scales::comma) + 
  theme_minimal()

ggplot(full, aes(x = goal_usd)) + 
  geom_density(alpha = 0.5, fill = "#E41A1C") + 
  scale_x_continuous(labels = scales::comma) + 
  scale_y_continuous(labels = scales::comma) + 
  theme_minimal()

grid.arrange(p1, p2, nrow =2)

# specify the numeric variables
iv <- c("raised_usd", "pos_ave_txt", "neg_ave_txt", "pos_ave_img", "neg_ave_img", "goal_usd", "date_difference", "unique_donors", "followers")

colors <- sample(brewer.pal(n = 12, name = "Set3"), length(iv))
# Create and print density plots for each variable with consistent color
den <- lapply(seq_along(iv), function(i) {
  ggplot(full, aes_string(x = iv[i])) + 
    geom_density(alpha = 0.5, fill = colors[i]) + 
    theme_minimal()
})

# Create and print histograms for each variable with consistent color
hist <- lapply(seq_along(iv), function(i) {
  ggplot(full, aes_string(x = iv[i])) + 
    geom_histogram(alpha = 0.5, fill = colors[i], color = "black", bins = 30) + 
    theme_minimal()
})

# Arrange plots into a grid
grid.arrange(hist[[1]], den[[1]], hist[[6]], den[[6]], ncol = 2)

# Calculate counts or sums of positive and negative averages
summary_data <- data.frame(
  Type = rep(c("Image", "Text"), each = 2),  # Type of data (Image or Text)
  Sentiment = rep(c("Positive", "Negative"), 2),  # Sentiment type (Positive or Negative)
  Average = c(sum(full$pos_ave_img), sum(full$neg_ave_img), sum(full$pos_ave_txt), sum(full$neg_ave_txt))  # Values of averages
)

## Plotting grouped bar chart
ggplot(summary_data, aes(x = Type, y = Average, fill = Sentiment)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  labs(x = "Data Type", y = "Sum of Averages", fill = "Sentiment") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 

# Calculate counts of campaigns with positive and negative averages
positive_img_count <- sum(full$pos_ave_img > 0)
negative_img_count <- sum(full$neg_ave_img < 0)
positive_txt_count <- sum(full$pos_ave_txt > 0)
negative_txt_count <- sum(full$neg_ave_txt < 0)

# Create summary data frame with counts
summary_data <- data.frame(
  Type = rep(c("Cover Image", "Title"), each = 2),  # Type of data (Image or Text)
  Sentiment = rep(c("Positive", "Negative"), 2),  # Sentiment type (Positive or Negative)
  Count = c(positive_img_count, negative_img_count, positive_txt_count, negative_txt_count)  # Counts of campaigns
)

## Plotting grouped bar chart
ggplot(summary_data, aes(x = Type, y = Count, fill = Sentiment)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  scale_fill_brewer(palette = "Set2") +
  labs(x = "Data Type", y = "Count of Campaigns", fill = "Sentiment") +
  theme_minimal()


# Correlation
corr <- full %>%
  dplyr::select(pos_ave_img, neg_ave_img, pos_ave_txt, neg_ave_txt)

corr_matrix <- cor(corr)

corrplot(corr_matrix, method = 'shade', order = 'FPC', type = 'lower', diag = FALSE, addCoef.col = 'black', tl.col = 'black',
         cl.ratio = 0.2, tl.srt = 90, col = COL2('PRGn', 8))

# Look for non-linear relationships in all of the variables.
varstocheck <- names(meanctr[,c(1:11)])

suppressWarnings({ # surpressing warnings since they are not applicable
  for (var in varstocheck) {
    if (var != "raised_usd" && var != "uid") {
      cat("Analyzing:",var,'\n')
      lmnonlintest <- lm(as.formula(paste(full['raised_usd'],'~',full[var],'+',I(full[var]^2))), data = full)
      # Test for significance of quadratic term using ANOVA
      quadraticterm_pvalue <- anova(lmnonlintest, test = "Chisq")[2,5]
      print(quadraticterm_pvalue)
    } else {
      cat("Cant analyze")
    }
  }
  
})
# We find non-linear effects in goal_usd.

# Visualization ----
## goal_usd
ggplot(full, aes(x = goal_usd, y = raised_usd)) +
  geom_point() +
  stat_smooth(method = "lm", formula = y ~ poly(x, 2), se = FALSE) +
  labs(
    x = "Goal($)",
    y = "Raised($)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(color = "black", size = 18, face = "bold"),
    plot.subtitle = element_text(size = 14),
    plot.caption = element_text(face = "italic")
  )

## ave_sentiment_img
ggplot(full, aes(x = ave_sentiment_img, y = raised_usd)) +
  geom_point() +
  stat_smooth(method = "lm", formula = y ~ poly(x, 2), se = FALSE) +
  labs(
    x = "Sentiment in image",
    y = "Raised($)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(color = "black", size = 18, face = "bold"),
    plot.subtitle = element_text(size = 14),
    plot.caption = element_text(face = "italic")
  )

## ave_sentiment
ggplot(full, aes(x = pos_ave_txt, y = raised_usd)) +
  geom_point() +
  stat_smooth(method = "lm", formula = y ~ poly(x, 2), se = FALSE) +
  labs(
    x = "Sentiment in text",
    y = "Raised($)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(color = "black", size = 18, face = "bold"),
    plot.subtitle = element_text(size = 14),
    plot.caption = element_text(face = "italic")
  )

zero_rows <- full %>%
  filter(neg_ave_txt == 0, pos_ave_txt == 0, neg_ave_img == 0, pos_ave_img == 0)
# All campaigns have some sort of emotional valence.

# Fit the model with . ----
lm <- lm(raised_usd ~ pos_ave_img + neg_ave_img + pos_ave_txt + neg_ave_txt + goal_usd + date_difference + followers, data = full)
summary(lm)

# Fit the model with moderator. ----

## Mean-center the focal independent variables
### Function for mean centering
center_scale <- function(x){scale(x,scale = FALSE)}

### Create a df with mean centered IVS
meanctr <- full %>%
  dplyr::select(raised_usd, ave_sentiment, ave_sentiment_img, pos_ave_txt, neg_ave_txt, pos_ave_img, neg_ave_img, goal_usd, date_difference, unique_donors, followers, category) %>%
  dplyr::mutate(congruency = ifelse((ave_sentiment > 0 & ave_sentiment_img > 0) | 
                                    (ave_sentiment < 0 & ave_sentiment_img < 0), 
                                    (ave_sentiment + ave_sentiment_img) / 2, 0)) %>%
  dplyr::mutate(pos_congruency = ifelse(congruency > 0, 1, 0),
                neg_congruency = ifelse(congruency < 0, 1, 0)) %>%
  dplyr::mutate(across(c(ave_sentiment, ave_sentiment_img, pos_ave_txt, neg_ave_txt, pos_ave_img, neg_ave_img), center_scale))

summary(meanctr)
summary(full)

## run the regression with the mean centered variables
### Moderate with congruency
mlm <-lm(log(raised_usd) ~ ave_sentiment_img + ave_sentiment + log(goal_usd) + log(date_difference) + log(followers) + congruency + ave_sentiment_img * congruency + ave_sentiment * congruency, data = meanctr)
summary(mlm)

mlm2 <-glm(log(raised_usd) ~ pos_ave_img + pos_ave_txt + neg_ave_img + neg_ave_txt + log(goal_usd) + log(date_difference) + log(followers) + congruency + pos_ave_txt * congruency, data = meanctr)
summary(mlm2)

mlm3 <-lm(log(raised_usd) ~ pos_ave_img + pos_ave_txt + neg_ave_img + neg_ave_txt + log(goal_usd) + log(date_difference) + log(followers) + pos_ave_txt * pos_congruency + neg_ave_txt * neg_congruency + pos_ave_img * pos_congruency + neg_ave_img * neg_congruency, data = meanctr)
summary(mlm3).

mlm4 <-lm(log(raised_usd) ~ pos_ave_img + pos_ave_txt + neg_ave_img + neg_ave_txt + log(meanctr$goal_usd) + log(meanctr$date_difference) + log(meanctr$followers) + pos_ave_txt * pos_ave_img + neg_ave_txt * neg_ave_img, data = meanctr)
summary(mlm4)

mlm5 <-lm(log(raised_usd) ~ pos_ave_img + pos_ave_txt + neg_ave_img + neg_ave_txt + log(goal_usd) + log(date_difference) + log(followers) + pos_ave_txt * pos_congruency + neg_ave_txt * neg_congruency, data = meanctr)
summary(mlm5)

gvlma(mlm)

### Moderate with categories
mlm2 <-lm(
  log(raised_usd) ~ pos_ave_img + neg_ave_img + pos_ave_txt + neg_ave_txt + log(goal_usd) +
    log(date_difference) + log(followers) + 
    pos_ave_img * medical  + neg_ave_img * medical + pos_ave_txt * medical + neg_ave_txt * medical +
    pos_ave_img * funerals  + neg_ave_img * funerals + pos_ave_txt * funerals + neg_ave_txt * funerals +
    pos_ave_img * other  + neg_ave_img * other + pos_ave_txt * other + neg_ave_txt * other, 
  data = meanctr)
summary(mlm2)

# Test for significance using ANOVA test for differences. ----
summary(aov(full$raised_usd ~ meanctr$category, data = full))

t.test(meanctr$raised_usd ~ meanctr$congruency, data = meanctr)

# the ANOVA test suggests that there are no significant differences between the types of categories.

# Muticolinearity----
## check the VIF values

VIF(mlm4) 

## Correlation
corr <- full %>%
  dplyr::select(raised_usd, pos_ave_img, neg_ave_img, pos_ave_txt, neg_ave_txt)

corr_matrix <- cor(corr)

corrplot(corr_matrix, method = 'shade', order = 'FPC', type = 'lower', 
         diag = FALSE, addCoef.col = 'black', tl.col = 'black',
         cl.ratio = 0.2, tl.srt = 90, col = colorRampPalette(brewer.pal(n = 8, name = "RdYlGn"))(8))

# Autocorrelation ----

## inspect the p-value with the dwtest function: ----
dwtest(mlm4) 
# Durbin-Watson test

# data:  mlm4
#DW = 2.0396, p-value = 0.6398
#alternative hypothesis: true autocorrelation is greater than 0

# Check graphically ----
par(mfrow=c(2,2)) # init 4 charts in 1 
plot(mlm4)
# The plots we are interested in are at the top-left and bottom-left. The top-left is the chart of residuals vs fitted values, while in the bottom-left one, it is standardised residuals on Y axis. If there is absolutely no heteroscedastity, you should see a completely random, equal distribution of points throughout the range of X axis and a flat red line.

# But in our case, as you can notice from the top-left plot, the red line is slightly curved and the residuals seem to decrease as the fitted Y values increase. So, the inference here is, heteroscedasticity exists.

# BP test ----
bptest(mlm4)
#White test ----
white_test_boot(mlm4)
#  a p-value less than a significance level of 0.05, therefore we can reject the null hypothesis that the variance of the residuals is constant and infer that heteroscedasticity is indeed present, thereby confirming our graphical inference.

# Solution: Heteroscedasticity-consistent estimation of the covariance matrix of the coefficient estimates in regression models.
coeftest(mlm, vcovHC(mlm)) # no
coeftest(mlm2, vcovHC(mlm2)) # no
coeftest(mlm3, vcovHC(mlm3)) # no
coeftest(mlm4, vcovHC(mlm4)) # yes
coeftest(mlm5, vcovHC(mlm5)) # no

# Calculate robust standard errors using HC0, HC1, HC2, and HC3
hc0 <- coeftest(mlm4, vcovHC(mlm4, type = "HC0"))
hc1 <- coeftest(mlm4, vcovHC(mlm4, type = "HC1"))
hc2 <- coeftest(mlm4, vcovHC(mlm4, type = "HC2"))
hc3 <- coeftest(mlm4, vcovHC(mlm4, type = "HC3"))

# Combine the results into a single table
stargazer(lm,mlm4,hc0, hc1, hc2, hc3,
          type = "text")

# Check for Unusual Data Points (Outliers) ----

## Plot the residuals. ----
plot(mlm4$residuals)

## Plot the studentized residuals. ----
plot(rstudent(mlm4))

## Assessing Outliers ----
outlierTest(mlm4) # Bonferonni p-value for most extreme obs. Data point 38 are outliers.
qqPlot(mlm4, main="QQ Plot") # QQ plot for studentized resid. We see the deviating data points.

## Calculate the leverage for each data point. ----
h <- leverage(mlm4) 
leveragePlots(mlm4) 

## Influential Observations ----

### Added-Variable plots
avPlots(mlm4)

### Cook's D plot
cutoff <- 4/((nrow(full)-length(mlm4$coefficients)-2)) #0.2222222
plot(mlm4, which=4, cook.levels=cutoff) # 38, 110 & 131 high D.

## Influence Plot ----
influencePlot(mlm4, id.method="identify", main="Influence Plot", sub="Circle size is proportial to Cook's Distance" )

cooksd <- cooks.distance(mlm4)

lmrob <- lmrob(log(raised_usd) ~ pos_ave_img + pos_ave_txt + neg_ave_img + neg_ave_txt + log(goal_usd) + log(date_difference) + log(followers) + pos_ave_txt * pos_ave_img + neg_ave_txt * neg_ave_img, data = meanctr)
stargazer(lm,mlm4, lmrob,hc0, hc1, hc2, hc3,
          type = "text")

# Non-Normality ----
## Check through tests. ----
shapiro.test(lm$residuals) # W = 0.96937 which is really close to 1, p-value = 0.589 > 0.05 , so accept H0

lillie.test(lm$residuals) # D = 0.049236, p-value = 0.5624

JarqueBeraTest(lm$residuals) # p-value = 0.9441

## Extract residuals from the GLS model ----
residuals <- residuals(lm)

### Create a boxplot to visualize residuals
boxplot(residuals, main = "Residuals Boxplot", ylab = "Residuals")
hist(residuals)
# Residuals have a normal distribution.

#RESET test ----
resettest(mlm4)

knitr::purl(input = "Thesis(with Face++).Rmd",documentation = 0)
