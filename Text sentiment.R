librarian::shelf(tm,sentimentr,stats,text2vec,textmineR,ldatuning,tidytext,pacman,textstem,SnowballC,udpipe,quanteda,regclass,MASS,questionr,ipred,caret,survival,fitdistrplus,car,rpart,gbm,stargazer,wordcloud2)

# Build corpus ----
corpus <- Corpus(VectorSource(with_img$title))
inspect(corpus[1:5])

# Select relevant columns
text <- with_img %>%
  dplyr::select(title, uid)

# Clean and tokenize the text
text_cleaning_tokens <- text %>% 
  tidytext::unnest_tokens(word, title)

# Remove digits and punctuation
text_cleaning_tokens <- text_cleaning_tokens %>%
  dplyr::mutate(word = gsub('[[:digit:]]+', '', word),
                word = gsub('[[:punct:]]+', '', word))

# Filter out empty tokens
tokens <- text_cleaning_tokens %>%
  dplyr::filter(word != "")

# Remove stopwords using tm package
stop_words <- stopwords("en")
tokens <- text_cleaning_tokens %>%
  dplyr::filter(!word %in% stop_words)

# Group by 'uid' and spread the data
tokens <- tokens %>%
  dplyr::group_by(uid) %>%
  dplyr::mutate(ind = dplyr::row_number()) %>%
  tidyr::spread(key = ind, value = word)

# Replace NA with ""
tokens [is.na(tokens)] <- ""

# Unite the words back into titles
tokens <- tidyr::unite(tokens, text,-uid,sep =" " )

# create a document term matrix
dtm <- CreateDtm(doc_vec = tokens$text, # character vector of documents
                 doc_names = tokens$uid, # document names
                 ngram_window = c(1, 1), # minimum and maximum n-gram length
                 stopword_vec = c(stopwords::stopwords("en"), # stopwords from tm
                                  stopwords::stopwords(source = "smart")), # this is the default value
                 lower = TRUE, # lowercase - this is the default value
                 remove_punctuation = TRUE, # punctuation - this is the default
                 remove_numbers = TRUE, # numbers - this is the default
                 verbose = FALSE, # Turn off status bar for this demo
                 ) 

# keep row number with >0 for later
rowsum = rowSums(dtm)
uid = full$uid
keep_row_id = as.data.frame(cbind(rowsum, uid))
keep_row_id = keep_row_id[rowsum>0,]

dtm <- dtm[,colSums(dtm) > 0]
dtm <- dtm[rowSums(dtm) > 0,]

#explore the basic frequency 
tf <- TermDocFreq(dtm = dtm)
original_tf <- tf %>% dplyr::select(term, term_freq,doc_freq)
rownames(original_tf) <- 1:nrow(original_tf)

# Eliminate words appearing less than 2 times or in more than half of the documents
vocabulary <- tf$term[ tf$term_freq > 2 & tf$doc_freq < nrow(dtm) / 2 ]
dtm = dtm

original_tf <- original_tf %>%
  dplyr::arrange(desc(term_freq))
head(original_tf, 10)

## Visualization of frequencies.
### Create a data frame with the top ten words and their frequencies
top_words <- data.frame(
  term = c("support", "refugee", "child", "assistance", "job", "service", "life", "give", "family", "care"),
  term_freq = c(334, 231, 189, 98, 98, 83, 76, 74, 71, 70)
)

top_words <- top_words[order(top_words$term_freq, decreasing = TRUE), ]

### Assign different colors to each word
colors <- brewer.pal(10,"Set3")

ggplot(top_words, aes(x = term_freq, y = reorder(term, term_freq), fill = term)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = term_freq), hjust = -0.2, size = 3, color = "black") +  # Add geom_text to show frequencies
  scale_fill_manual(values = colors) +
  labs(
       x = "Frequency",  # Changed x-axis label
       y = "Words") +    # Changed y-axis label
  theme_minimal() +
  theme(axis.text.y = element_text(size = 10, face = "bold"),  # Adjusted axis.text.y
        axis.text.x = element_text(size = 10),
        axis.title.y = element_text(size = 12, face = "bold")) + # Adjusted axis.title.y
  guides(fill = FALSE)

# Create a wordcloud
tdm <- TermDocumentMatrix(tokens)
tdm
tdm <- as.matrix(tdm)

w <- rowSums(tdm)
w <- data.frame(names(w), w)
colnames(w) <- c('word', 'freq')
wordcloud2(w[which(w$freq > 5),],
           size = 0.7,
           shape = 'circle',
           rotateRatio = 0.5,
           minSize = 1)


# Extract avg emotion
sentiment(tokens$text)
tokens <- cbind(tokens, sentiment_by(tokens$text))

# classify into positive or not
tokens$pos_sentimentr <- ifelse(tokens$ave_sentiment > 0, 1, 0)
tokens$neg_sentimentr <- ifelse(tokens$ave_sentiment < 0, 1, 0)

# look into the specific emotions
emotion <- emotion_by(tokens$text)

## Organise the data for plotting
emo_bar<- colSums(sentiment.df[,c(15:24)])
emo_sum<- data.frame(count=emo_bar,emotions=names(emo_bar))

## Plot the results
ggplot(emo_sum, aes(x = reorder(emotions, -count), y = count, fill = emotions)) +
  geom_bar(stat = 'identity') +
  labs(
    title = "Distribution of Emotions throughout Campaigns",
    subtitle = "Using NRC Lexicon.",
    #caption = "Source: Gapminder dataset",
    x = "Emotion",
    y = "Campaigns"
  ) +
  theme(
    plot.title = element_text(color = "black", size = 18, face = "bold"),
    plot.subtitle = element_text(size = 14),
    plot.caption = element_text(face = "italic")
  ) +
  scale_fill_brewer(palette = 'Paired') +
  theme_light()
