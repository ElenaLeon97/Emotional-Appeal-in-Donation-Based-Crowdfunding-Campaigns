# Emotional Appeal in Donation-Based Crowdfunding Campaigns

## Table of Contents
- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Tools Used](#tools-used)
- [Data Cleaning / Preparation](#data-cleaning--preparation)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Data Analysis](#data-analysis)
- [Results / Findings](#results--findings)
- [Recommendations](#recommendations)
- [Limitations](#limitations)
- [References](#references)

---

## Project Overview

This research project explores how **emotional appeal in the first stage of decision-making** influences the success of donation-based crowdfunding campaigns. The study analyzes how emotional content in **cover images and campaign titles** affects the amount of donations received.

By examining 148 campaigns on GoFundMe, the project investigates:
- Whether **positive or negative sentiment** in either modality (image or title) leads to better results.
- Whether **congruence** (matching emotion across image and text) strengthens or weakens campaign performance.

---

## Data Sources

- **Primary dataset**: 148 donation-based campaigns from [GoFundMe](https://www.gofundme.com/)
- Data includes:
  - Campaign title and cover image
  - Fundraising goal and amount raised
  - Campaign category
  - Number of donors
  - Sentiment variables for both text and image

---

## Tools Used

- **R**: Data processing and analysis
- **Face++ API**: Facial emotion detection from cover images
- **R packages**:
  - `sentimentr` – sentiment scoring with valence shifters
  - `tm`, `tidytext`, `tidyr`, `dplyr`, `lexicon` – text cleaning and manipulation

---

## Data Cleaning / Preparation

The following steps were performed:
- Removed campaigns with missing data
- Cleaned and tokenized text data
- Removed stop words and applied lemmatization
- Processed images via API and averaged detected facial emotion scores
- Scaled sentiment scores to a [-1, +1] range for consistency

---

## Exploratory Data Analysis

Questions explored during EDA:
- What is the average sentiment of titles and images?
- Do different campaign categories vary in emotional tone?
- Which categories raised the most money?

> Notable Observation: Titles leaned negative on average, while images leaned positive — suggesting a possible mismatch in emotional tone.

---

## Data Analysis

### Sentiment Analysis:
- **Image**:  
  Emotions such as happiness, sadness, and fear were extracted using **Face++** and aggregated per image.

- **Text**:  
  Titles were scored using the `sentimentr` package, which accounted for negators, intensifiers, and other shifters.

### Variables Constructed:
- `ave_sentiment` — average sentiment of the title
- `ave_sentiment_img` — average sentiment of the image
- `pos_ave_txt`, `neg_ave_txt` — split sentiment scores for textual content
- `pos_ave_img`, `neg_ave_img` — split sentiment scores for image content

### Moderation Modeling:
- Regression models tested whether **emotional congruence between image and text** moderated the effect of sentiment on donations.
  
---

## Results / Findings
1. Negative emotional appeal (in either image or text) increases donation amounts.
2. Positive sentiment in titles is correlated with lower donation levels.
3. Strong negative congruence (both sad image and sad title) leads to donor fatigue and fewer donations.
4. Moderation effect: emotional congruence can reduce effectiveness when overly negative.
5. Best results came from asymmetrical emotional signals, such as:
  - Sad image + neutral title
  - Neutral image + emotionally compelling title
    
---

## Recommendations
- Use negative emotional cues sparingly — they trigger empathy but can overwhelm if overused.
- Avoid matching negative titles with equally negative images — this emotional overload may repel donors.
- Aim for emotional contrast (e.g., sad image with calm title) to balance urgency with approachability.
- Refrain from using overly positive titles, especially when the campaign’s context is serious or tragic.

---

## Limitations
- Limited dataset size (148 campaigns) and time frame (2013–2020)
- Face++ may misclassify subtle or culturally specific facial expressions
- Sentiment analysis does not fully account for sarcasm or nuanced emotional tone
- Emotional responses were inferred algorithmically, not measured through user feedback

---

## References
Abdullah, S., Murnane, E. L., Costa, J. M. R., & Choudhury, T. (2015). Collective smile: Measuring societal happiness from geolocated images. Proceedings of the 18th ACM Conference on Computer Supported Cooperative Work & Social Computing, 361–374.
Albouy, J. (2017). Emotions and prosocial behaviours: A study of the effectiveness of shocking charity campaigns. Http://Dx.Doi.Org/10.1177/2051570716689241, 32(2), 4–25. https://doi.org/10.1177/2051570716689241
Andreoni, J. (1989). Giving with Impure Altruism: Applications to Charity and Ricardian Equivalence. Journal of Political Economy, 97(6), 1447–1458. https://doi.org/10.1086/261662
Andreoni, J., Rao, J. M., & Trachtman, H. (2017). Avoiding the Ask: A Field Experiment on Altruism, Empathy, and Charitable Giving. Https://Doi.Org/10.1086/691703, 125(3), 625–653. https://doi.org/10.1086/691703
Anusakumar, S. V, Ali, R., & Hooy, C.-W. (2017). The Effect of Investor Sentiment on Stock Returns: Insight from Emerging Asian Markets. Asian Academy of Management Journal of Accounting and Finance, 13, 159–178. https://api.semanticscholar.org/CorpusID:55465406
Arriaga, O., Valdenegro-Toro, M., & Plöger, P. (2017). Real-time convolutional neural networks for emotion and gender classification. ArXiv Preprint ArXiv:1710.07557.
Asch, S. E. (1946). Forming impressions of personality. Journal of Abnormal and Social Psychology, 41(3), 258–290. https://doi.org/10.1037/H0055756
Baberini, M., Coleman, C. Lou, Slovic, P., & Västfjäll, D. (2015). Examining the Effects of Photographic Attributes on Sympathy, Emotions, and Donation Behavior. Visual Communication Quarterly, 22(2), 118–128. https://doi.org/10.1080/15551393.2015.1061433
Bagozzi, R. P. (2006). Consumer Action. 2, 3–42. https://doi.org/10.1108/S1548-6435(2005)0000002005
Bagozzi, R. P., Gopinath, M., & Nyer, P. U. (1999). The role of emotions in marketing. Journal of the Academy of Marketing Science 1999 27:2, 27(2), 184–206. https://doi.org/10.1177/0092070399272005
Bagozzi, R. P., & Moore, D. J. (1994). Public Service Advertisements: Emotions and Empathy Guide Prosocial Behavior. Journal of Marketing, 58(1), 56. https://doi.org/10.2307/1252251
Balahur, A., & Jacquet, G. (2015). Sentiment analysis meets social media - Challenges and solutions of the field in view of the current information sharing context. Information Processing and Management, 51(4), 428–432. https://doi.org/10.1016/J.IPM.2015.05.005
Balbi, S., Misuraca, M., & Scepi, G. (2018). Combining different evaluation systems on social media for measuring user satisfaction. Information Processing and Management, 54(4), 674–685. https://doi.org/10.1016/J.IPM.2018.04.009
Barrett, L. F., Adolphs, R., Marsella, S., Martinez, A. M., & Pollak, S. D. (2019). Emotional Expressions Reconsidered: Challenges to Inferring Emotion From Human Facial Movements. Psychological Science in the Public Interest, 20(1), 1–68. https://doi.org/10.1177/1529100619832930
Bartkiene, E., Steibliene, V., Adomaitiene, V., Juodeikiene, G., Cernauskas, D., Lele, V., Klupsaite, D., Zadeike, D., Jarutiene, L., & Guiné, R. P. F. (2019). Factors affecting consumer food preferences: food taste and depression‐based evoked emotional expressions with the use of face Reading technology. BioMed Research International, 2019(1), 2097415.
Batson, C. D., & et al. (1981). Is empathic emotion a source of altruistic motivation? Journal of Personality and Social Psychology, 40(2), 290–302. https://doi.org/10.1037/0022-3514.40.2.290
Batson, C. D., Polycarpou, M. P., Harmon-Jones, E., Imhoff, H. J., Mitchener, E. C., Bednar, L. L., Klein, T. R., & Highberger, L. (1997). Empathy and Attitudes: Can Feeling for a Member of a Stigmatized Group Improve Feelings Toward the Group? Journal of Personality and Social Psychology, 72(1), 105–118. https://doi.org/10.1037/0022-3514.72.1.105
Batson, C. D., & Shaw, L. L. (1991). Evidence for Altruism: Toward a Pluralism of Prosocial Motives. Psychological Inquiry, 2(2), 107–122. https://doi.org/10.1207/S15327965PLI0202_1
Beier, M., & Wagner, K. (2015). Crowdfunding Success: A Perspective from Social Media and E-Commerce. ICIS.
Bekkers, R., & Wiepking, P. (2010). A Literature Review of Empirical Studies of Philanthropy. Http://Dx.Doi.Org/10.1177/0899764010380927, 40(5), 924–973. https://doi.org/10.1177/0899764010380927
Bennett, R. (1996). Effects of Horrific Fear Appeals on Public Attitudes Towards AIDS. International Journal of Advertising, 15(3), 183–202. https://doi.org/10.1111/J.0265-0487.1996.00021.PP.X
Bera, A. K., Suprayitno, T., & Premaratne, G. (2002). On some heteroskedasticity-robust estimators of variance–covariance matrix of the least-squares estimators. Journal of Statistical Planning and Inference, 108(1–2), 121–136.
Berger, J., Humphreys, A., Ludwig, S., Moe, W. W., Netzer, O., & Schweidel, D. A. (2020). Uniting the tribes: Using text for marketing insight. Journal of Marketing, 84(1), 1–25.
Bower, G. H. (1981). Mood and memory. American Psychologist, 36(2), 129–148. https://doi.org/10.1037/0003-066X.36.2.129
Boxell, L. (2018). Slanted images: Measuring nonverbal media bias.
Breusch, T. S., & Pagan, A. R. (1979). A Simple Test for Heteroscedasticity and Random Coefficient Variation. Econometrica, 47(5), 1287–1294. https://doi.org/10.2307/1911963
Brosius, H. B., Donsbach, W., & Birk, M. (1996). How do text‐picture relations affect the informational effectiveness of television newscasts? Journal of Broadcasting & Electronic Media, 40(2), 180–195. https://doi.org/10.1080/08838159609364343
Brown, S. P., Cron, W. L., & Slocum, J. W. (1997). Effects of goal-directed emotions on salesperson volitions, behavior, and performance: A longitudinal study. Journal of Marketing, 61(1), 39–50. https://doi.org/10.2307/1252188
Burt, C., & Strongman, K. (2005). USE OF IMAGES IN CHARITY ADVERTISING: IMPROVING DONATIONS AND COMPLIANCE RATES. International Journal of Organisational Behaviour, 8(8), 571–580.
Calic, G., & Mosakowski, E. (2016). Kicking off social entrepreneurship: How a sustainability orientation influences crowdfunding success. Journal of Management Studies, 53(5), 738–767.
Cao, X., & Jia, L. (2017). The Effects of the Facial Expression of Beneficiaries in Charity Appeals and Psychological Involvement on Donation Intentions. Nonprofit Management and Leadership, 27(4), 457–473. https://doi.org/10.1002/nml.21261
Carlsmith, J. M., & Gross, A. E. (1969). Some effects of guilt on compliance. Journal of Personality and Social Psychology, 11(3), 232–239. https://doi.org/10.1037/H0027039
Carvalho, S. W., Hildebrand, D., & Sen, S. (2019). Dressed to impress: The effect of victim attire on helping behavior. Journal of the Association for Consumer Research, 4(4), 377–386. https://doi.org/10.1086/705034
Cavanaugh, L. A., Bettman, J. R., & Luce, M. F. (2015). Feeling Love and Doing More for Distant Others: Specific Positive Emotions Differentially Affect Prosocial Consumption. Https://Doi.Org/10.1509/Jmr.10.0219, 52(5), 657–673. https://doi.org/10.1509/JMR.10.0219
Chang, C. T., & Lee, Y. K. (2009). Framing Charity Advertising: Influences of Message Framing, Image Valence, and Temporal Framing on a Charitable Appeal1. Journal of Applied Social Psychology, 39(12), 2910–2935. https://doi.org/10.1111/J.1559-1816.2009.00555.X
Chang, C. T., & Lee, Y. K. (2010). Effects of message framing, vividness congruency and statistical framing on responses to charity advertising. International Journal of Advertising, 29(2), 195–220. https://doi.org/10.2501/S0265048710201129
Chen, S., Wang, H., Fang, Y., & Wang, W. (2023). Informational and emotional appeals of cover image in crowdfunding platforms and the moderating role of campaign outputs. Decision Support Systems, 171, 113975. https://doi.org/10.1016/J.DSS.2023.113975
Citron, F. M. M., Gray, M. A., Critchley, H. D., Weekes, B. S., & Ferstl, E. C. (2014). Emotional valence and arousal affect reading in an interactive way: Neuroimaging evidence for an approach-withdrawal framework. Neuropsychologia, 56(100), 79. https://doi.org/10.1016/J.NEUROPSYCHOLOGIA.2014.01.002
Cohn F., J., Ambadar, Z., & Ekman, P. (2007). Observer-based measurement of facial expression with the facial action coding system. In J. Coan & J. Allen (Eds.), Handbook of Emotion Elicitation and Assessment (pp. 222–238). Oxford:Oxford University Press.
Consoli, D. (2010). A New Concept of Marketing: The Emotional Marketing. BRAND. Broad Research in Accounting, Negotiation, and Distribution, 1(1), 52–59. https://www.edusoft.ro/brain/index.php/brand/article/view/76
Cox, J., Nguyen, T., Thorpe, A., Ishizaka, A., Chakhar, S., & Meech, L. (2018). Being seen to care: The relationship between self-presentation and contributions to online pro-social crowdfunding campaigns. Computers in Human Behavior, 83, 45–55. https://doi.org/10.1016/J.CHB.2018.01.014
Crowdfunding Statistics: Facts on the Latest Fundraising Craze. (n.d.). Retrieved March 25, 2024, from https://blog.fundly.com/crowdfunding-statistics/#general
Cui, W., & Jiang, Z. (2021). Move Text Out of Picture: Impacts of Spatial Relationship Between Text and Picture on Consumer Attention to Online Ads. ICIS 2021 Proceedings. https://aisel.aisnet.org/icis2021/digital_commerce/digital_commerce/15
Dickert, S., Sagara, N., & Slovic, P. (2011). Affective motivations to help others: A two-stage model of donation decisions. Journal of Behavioral Decision Making, 24(4), 361–376. https://doi.org/10.1002/BDM.697
Durbin, J., & Watson, G. S. (1950). Testing for Serial Correlation in Least Squares Regression: I. Biometrika, 37(3/4), 409–428. https://doi.org/10.2307/2332391
Eckler, P., & Bolls, P. (2011). Spreading the Virus. Journal of Interactive Advertising, 11(2), 1–11. https://doi.org/10.1080/15252019.2011.10722180
Eerola, T., Friberg, A., & Bresin, R. (2013). Emotional expression in music: Contribution, linearity, and additivity of primary musical cues. Frontiers in Psychology, 4(JUL). https://doi.org/10.3389/FPSYG.2013.00487/ABSTRACT
Ekman, P., & Rosenberg, E. L. (2005). What the Face Reveals: Basic and Applied Studies of Spontaneous Expression Using the Facial Action Coding System (FACS). What the Face Reveals: Basic and Applied Studies of Spontaneous Expression Using the Facial Action Coding System (FACS), 1–672. https://doi.org/10.1093/ACPROF:OSO/9780195179644.001.0001
Elad, B. (2023, September 7). GoFundMe Statistics 2023 and Facts. https://www.enterpriseappstoday.com/stats/gofundme-statistics.html
Elsen, M., Pieters, R., & Wedel, M. (2016). Thin Slice Impressions: How Advertising Evaluation Depends on Exposure Duration. Https://Doi.Org/10.1509/Jmr.13.0398, 53(4), 563–579. https://doi.org/10.1509/JMR.13.0398
Erlandsson, A., Nilsson, A., & Västfjäll, D. (2018). Attitudes and Donation Behavior When Reading Positive and Negative Charity Appeals. Journal of Nonprofit & Public Sector Marketing, 30(4), 444–474. https://doi.org/10.1080/10495142.2018.1452828
Etter, V., Grossglauser, M., & Thiran, P. (2013). Launch hard or go home! Predicting the success of kickstarter campaigns. COSN 2013 - Proceedings of the 2013 Conference on Online Social Networks, 177–182. https://doi.org/10.1145/2512938.2512957
Fang, T., & Lahdelma, R. (2016). Evaluation of a multiple linear regression model and SARIMA model in forecasting heat demand for district heating system. Applied Energy, 179, 544–552. https://api.semanticscholar.org/CorpusID:113836857
Faseur, T., & Geuens, M. (2010). Communicating the Right Emotion to Generate Help for Connected Versus Unconnected Others. Http://Dx.Doi.Org/10.1177/0093650210368280, 37(4), 498–521. https://doi.org/10.1177/0093650210368280
Festinger, L. (1997). A Theory of Cognitive Dissonance [1957]. Standford CA Standford University, 291. http://www.sup.org/books/title/?id=3850
Fiala, L., & Noussair, C. N. (2017). CHARITABLE GIVING, EMOTIONS, AND THE DEFAULT EFFECT. Economic Inquiry, 55(4), 1792–1812. https://doi.org/10.1111/ECIN.12459
Fisher, R. J., & Ma, Y. (2014). The Price of Being Beautiful: Negative Effects of Attractiveness on Empathy for Children in Need. Journal of Consumer Research, 41(2), 436–450. https://doi.org/10.1086/676967
Fisher, R. J., Vandenbosch, M., & Antia, K. D. (2008). An Empathy-Helping Perspective on Consumers’ Responses to Fund-Raising Appeals. Journal of Consumer Research, 35(3), 519–531. https://doi.org/10.1086/586909
Freedman, J. L., Wallington, S. A., & Bless, E. (1967). Compliance without pressure: The effect of guilt. Journal of Personality and Social Psychology, 7(2 PART 1), 117–124. https://doi.org/10.1037/H0025009
Geise, S., & Baden, C. (2015). Putting the Image Back Into the Frame: Modeling the Linkage Between Visual Communication and Frame-Processing Theory. Communication Theory, 25(1), 46–69. https://doi.org/10.1111/COMT.12048
Genevsky, A., & Knutson, B. (2015). Neural affective mechanisms predict market-level microlending. Psychological Science, 26(9), 1411–1422. https://doi.org/10.1177/0956797615588467/ASSET/IMAGES/LARGE/10.1177_0956797615588467-FIG3.JPEG
Gibson, R., & Zillmann, D. (2000). Reading between the Photographs: The Influence of Incidental Pictorial Information on Issue Perception. Http://Dx.Doi.Org/10.1177/107769900007700209, 77(2), 355–366. https://doi.org/10.1177/107769900007700209
Gleasure, R., & Feller, J. (2016). Does Heart or Head Rule Donor Behaviors in Charitable Crowdfunding Markets? International Journal of Electronic Commerce, 20(4), 499–524. https://doi.org/10.1080/10864415.2016.1171975
Gneezy, U., Imas, A., & Madarász, K. (2014). Conscience Accounting: Emotion Dynamics and Social Behavior. Https://Doi.Org/10.1287/Mnsc.2014.1942, 60(11), 2645–2658. https://doi.org/10.1287/MNSC.2014.1942
GoFundMe: the most popular online fundraising platform. (2024). https://www.gofundme.com/nl-nl
Goodfellow, I. J., Erhan, D., Luc Carrier, P., Courville, A., Mirza, M., Hamner, B., Cukierski, W., Tang, Y., Thaler, D., Lee, D.-H., Zhou, Y., Ramaiah, C., Feng, F., Li, R., Wang, X., Athanasakis, D., Shawe-Taylor, J., Milakov, M., Park, J., … Bengio, Y. (2015). Challenges in representation learning: A report on three machine learning contests. Neural Networks, 64, 59–63. https://doi.org/https://doi.org/10.1016/j.neunet.2014.09.005
Greenberg, M. D., Pardo, B., Hariharan, K., & Gerber, E. (2013). Crowdfunding Support Tools: Predicting Success & Failure. Conference on Human Factors in Computing Systems - Proceedings, 2013-April, 1815–1820. https://doi.org/10.1145/2468356.2468682
Guo, Q., Zhou, S., Wu, Y., Peng, Z., & Ma, X. (2022). Understanding and Modeling Viewers’ First Impressions with Images in Online Medical Crowdfunding Campaigns. Conference on Human Factors in Computing Systems - Proceedings. https://doi.org/10.1145/3491102.3501830
Haim, M., & Jungblut, M. (2021). Politicians’ self-depiction and their news portrayal: Evidence from 28 countries using visual computational analysis. Political Communication, 38(1–2), 55–74.
Hartmann, J., Heitmann, M., Siebert, C., & Schamp, C. (2023). More than a feeling: Accuracy and application of sentiment analysis. International Journal of Research in Marketing, 40(1), 75–87.
Hirschberg, J., & Manning, C. D. (2015). Advances in natural language processing. Science, 349(6245), 261–266. https://doi.org/10.1126/science.aaa8685
Höfling, T. T. A., Gerdes, A. B. M., Föhl, U., & Alpers, G. W. (2020). Read my face: automatic facial coding versus psychophysiological indicators of emotional valence and arousal. Frontiers in Psychology, 11, 1388.
Hörisch, J. (2015). Crowdfunding for environmental ventures: an empirical analysis of the influence of environmental orientation on the success of crowdfunding initiatives. Journal of Cleaner Production, 107, 636–645. https://doi.org/10.1016/J.JCLEPRO.2015.05.046
Horney, K. (2013). Our inner conflicts: A constructive theory of neurosis. Our Inner Conflicts: A Constructive Theory of Neurosis, 1–250. https://doi.org/10.4324/9781315010557
Hou, J. R., Zhang, J. J., & Zhang, K. (2019). Can Title Images Predict the Emotions and the Performance of Crowdfunding Projects? Proceedings of the Annual Hawaii International Conference on System Sciences, 2019-January, 4439–4448. https://doi.org/10.24251/HICSS.2019.538
Hutto, C., & Gilbert, E. (2014). Vader: A parsimonious rule-based model for sentiment analysis of social media text. Proceedings of the International AAAI Conference on Web and Social Media, 8(1), 216–225.
Isen, A. M. (2001). An Influence of Positive Affect on Decision Making in Complex Situations: Theoretical Issues With Practical Implications. Journal of Consumer Psychology, 11(2), 75–85. https://doi.org/10.1207/S15327663JCP1102_01
Islam, T., Sheakh, Md. A., Sadik, Md. R., Tahosin, Mst. S., Foysal, Md. M. R., Ferdush, J., Begum, M., Islam, T., Sheakh, Md. A., Sadik, Md. R., Tahosin, Mst. S., Foysal, Md. M. R., Ferdush, J., & Begum, M. (2024). Lexicon and Deep Learning-Based Approaches in Sentiment Analysis on Short Texts. Journal of Computer and Communications, 12(1), 11–34. https://doi.org/10.4236/JCC.2024.121002
Izard, C. E. (2009). Emotion theory and research: Highlights, unanswered questions, and emerging issues. Annual Review of Psychology, 60(Volume 60, 2009), 1–25. https://doi.org/10.1146/ANNUREV.PSYCH.60.110707.163539/CITE/REFWORKS
Jang, H., & Chu, W. (2022). The effect of message features on donations in donation-based crowdfunding. Journal of Consumer Behaviour, 21(6), 1464–1477. https://doi.org/10.1002/CB.2099
Jang, Y. W., & Han, K. (2022). The Effect of Song Lyrics Sentiment Analysis on Improving Vocal Expression: Using the ‘Wheel of Emotions.’ The Korean Association for the Study of Popular Music. https://api.semanticscholar.org/CorpusID:254321059
Janis, I. L., & Feshbach, S. (1953). Effects of fear-arousing communications. Journal of Abnormal and Social Psychology, 48(1), 78–92. https://doi.org/10.1037/H0060732
Jarque, C. M., & Bera, A. K. (1980). Efficient tests for normality, homoscedasticity and serial independence of regression residuals. Economics Letters, 6(3), 255–259. https://doi.org/https://doi.org/10.1016/0165-1765(80)90024-5
Jin, B., Qu, Y., Zhang, L., & Gao, Z. (2020). Diagnosing Parkinson disease through facial expression recognition: video analysis. Journal of Medical Internet Research, 22(7), e18697.
Jockers, M. M. (2023). Package “syuzhet” Type Package Title Extracts Sentiment and Sentiment-Derived Plot Arcs from Text. https://github.com/mjockers/syuzhet
Joffe, H. (2008). The Power of Visual Material: Persuasion, Emotion and Identification. Diogenes, 55(1), 84–93. https://doi.org/10.1177/0392192107087919
Jordan W., P. (2001). Pleasure with products : The new human factors. 303–328. https://doi.org/10.1201/B12625-17
Kamins, M. A., Marks, L. J., & Skinner, D. (1991). Television Commercial Evaluation in the Context of Program Induced Mood: Congruency versus Consistency Effects. Journal of Advertising, 20(2), 1–14. https://doi.org/10.1080/00913367.1991.10673209
Karch, J. (2020). Improving on Adjusted R-Squared. Collabra: Psychology, 6(1), 45. https://doi.org/10.1525/collabra.343
Keltner, D., & Cordaro, D. T. (2017). Understanding Multimodal Emotional Expressions: Recent Advances in Basic Emotion Theory. 1. https://doi.org/10.1093/ACPROF:OSO/9780190613501.003.0004
Kemper, T. D., & Lazarus, R. S. (1992). Emotion and Adaptation. Contemporary Sociology, 21(4), 522. https://doi.org/10.2307/2075902
Kickstarter. (2024). https://www.kickstarter.com/
Kim, H., & Fesenmaier, D. R. (2008). Persuasive Design of Destination Web Sites: An Analysis of First Impression. Http://Dx.Doi.Org/10.1177/0047287507312405, 47(1), 3–13. https://doi.org/10.1177/0047287507312405
Kim, H., Park, K., & Norbert, S. (2010). Will this trip really be exciting? the role of incidental emotions in product evaluation. Journal of Consumer Research, 36(6), 983–991. https://doi.org/10.1086/644763/2/M_36-6-983-FG1.JPEG
Klein, C. (2023). Exploratory Analysis and the Expected Value of Experimentation. Philosophy of Science, 1–9. https://doi.org/10.1017/PSA.2023.116
Küntzler, T. (2021, April 23). Extracting Emotions from Faces with Face++ (and Microsoft Azure) | Methods Bites. https://www.mzes.uni-mannheim.de/socialsciencedatalab/article/extracting-emotions/#section4
Küntzler, T., Höfling, T. T. A., & Alpers, G. W. (2021). Automatic Facial Expression Recognition in Standardized and Non-standardized Emotional Expressions. Frontiers in Psychology, 12, 627561. https://doi.org/10.3389/FPSYG.2021.627561/BIBTEX
Kuppuswamy, V., & Bayus, B. L. (2015). Crowdfunding Creative Ideas: The Dynamics of Project Backers in Kickstarter. SSRN Electronic Journal. https://doi.org/10.2139/SSRN.2234765
Kwon, J., Lin, H., Deng, L., Dellicompagni, T., & Kang, M. Y. (2022). Computerized emotional content analysis: empirical findings based on charity social media advertisements. International Journal of Advertising, 41(7), 1314–1337. https://doi.org/10.1080/02650487.2021.2012070
Lee, Y., Coyle, J. R., & Chen, A. N. K. (2021). Improving intention to back projects with effective designs of progress presentation in crowdfunding campaign sites. Decision Support Systems, 147, 113573. https://doi.org/10.1016/J.DSS.2021.113573
Lee, Y. F., Siew, A., Lee, H., & Zainol, Z. (2022). A COMPARISON STUDY ON TEXT MINING AND SENTIMENT ANALYSIS FEATURES AND FUNCTIONS USING SAS ENTERPRISE MINER, PYTHON AND R. Zulfaqar Journal of Defence Science, Engineering & Technology, 5(2), 112–119. https://doi.org/10.58247/jdset-2022-0502-12
Leeflang, P. S. H., Wieringa, J. E., Bijmolt, T. H. A., & Pauwels, K. H. (2015). Modeling markets. Analyzing Marketing Phenomena and Improving Marketing Decision Making, New York.
Leone, L., Perugini, M., & Bagozzi, R. P. (2005). Emotions and decision making: Regulatory focus moderates the influence of anticipated emotions on action evaluations. Cognition and Emotion, 19(8), 1175–1198. https://doi.org/10.1080/02699930500203203
Lewinski, P. (2015). Automated facial coding software outperforms people in recognizing neutral faces as neutral from standardized datasets. Frontiers in Psychology, 6, 148853.
Li, D., & Atkinson, L. (2020). Effect of emotional victim images in prosocial advertising: The moderating role of helping mode. International Journal of Nonprofit and Voluntary Sector Marketing, 25(4), e1676. https://doi.org/10.1002/NVSM.1676
Liang, J., Chen, Z., & Lei, J. (2016). Inspire me to donate: The use of strength emotion in donation appeals. Journal of Consumer Psychology, 26(2), 283–288. https://doi.org/10.1016/J.JCPS.2015.09.001
Lii, Y. shuh, & Sy, E. (2009). Internet differential pricing: Effects on consumer price perception, emotions, and behavioral responses. Computers in Human Behavior, 25(3), 770–777. https://doi.org/10.1016/J.CHB.2009.02.005
Lilliefors, H. W. (1967). On the Kolmogorov-Smirnov Test for Normality with Mean and Variance Unknown. Journal of the American Statistical Association, 62(318), 399–402. https://doi.org/10.1080/01621459.1967.10482916
Lim, K. H., Benbasat, I., & Ward, L. M. (2000). The Role of Multimedia in Changing First Impression Bias. Https://Doi.Org/10.1287/Isre.11.2.115.11776, 11(2), 115–136. https://doi.org/10.1287/ISRE.11.2.115.11776
Lindgaard, G., Fernandes, G., Dudek, C., & Browñ, J. (2006). Attention web designers: You have 50 milliseconds to make a good first impression! Behaviour & Information Technology, 25(2), 115–126. https://doi.org/10.1080/01449290500330448
Lochbuehler, K., Mercincavage, M., Tang, K. Z., Tomlin, C. D., Cappella, J. N., & Strasser, A. A. (2018). Effect of message congruency on attention and recall in pictorial health warning labels. Tobacco Control, 27(3), 266–271. https://doi.org/10.1136/TOBACCOCONTROL-2016-053615
Long, J. S., & Ervin, L. H. (2000). Using heteroscedasticity consistent standard errors in the linear regression model. The American Statistician, 54(3), 217–224.
Lu, H. (2015). The Effects of Emotional Appeals and Gain Versus Loss Framing in Communicating Sea Star Wasting Disease. Http://Dx.Doi.Org/10.1177/1075547015619173, 38(2), 143–169. https://doi.org/10.1177/1075547015619173
Lwin, M., & Phau, I. (2014). An exploratory study of existential guilt appeals in charitable advertisements. Journal of Marketing Management, 30(13–14), 1467–1485. https://doi.org/10.1080/0267257X.2014.939215
MacKinnon, J. G., & White, H. (1985). Some heteroskedasticity-consistent covariance matrix estimators with improved finite sample properties. Journal of Econometrics, 29(3), 305–325.
Mahajani, S. J., Srivastava, S., & Smeaton, A. F. (2023). A Comparison of Lexicon-Based and ML-Based Sentiment Analysis: Are There Outlier Words? https://arxiv.org/abs/2311.06221v1
McIntyre, K., Lough, K., & Manzanares, K. (2018). Solutions in the Shadows: The Effects of Photo and Text Congruency in Solutions Journalism News Stories. Https://Doi.Org/10.1177/1077699018767643, 95(4), 971–989. https://doi.org/10.1177/1077699018767643
Merchant, A., Ford, J. B., & Sargeant, A. (2010). Charitable organizations’ storytelling influence on donors’ emotions and intentions. Journal of Business Research, 63(7), 754–762. https://doi.org/10.1016/J.JBUSRES.2009.05.013
Misuraca, M., Forciniti, A., Scepi, G., & Spano, M. (2020). Sentiment Analysis for Education with R: packages, methods and practical applications. https://arxiv.org/abs/2005.12840v1
Mitra, T., & Gilbert, E. (2014). The language that gets people to give: Phrases that predict success on kickstarter. Proceedings of the ACM Conference on Computer Supported Cooperative Work, CSCW, 49–61. https://doi.org/10.1145/2531602.2531656
Mollick, E. (2014). The dynamics of crowdfunding: An exploratory study. Journal of Business Venturing, 29(1), 1–16. https://doi.org/10.1016/J.JBUSVENT.2013.06.005
Niedenthal, P. M., & Setterlund, M. B. (1994). Emotion Congruence in Perception. Http://Dx.Doi.Org/10.1177/0146167294204007, 20(4), 401–411. https://doi.org/10.1177/0146167294204007
Obermiller, C. (1995). The Baby is Sick/The Baby is Well: A Test of Environmental Communication Appeals. Journal of Advertising, 24(2), 55–70. https://doi.org/10.1080/00913367.1995.10673476
Ottaviani, F. M., & Marco, A. De. (2021). Multiple Linear Regression Model for Improved Project Cost Forecasting. CENTERIS/ProjMAN/HCist. https://api.semanticscholar.org/CorpusID:247232200
Paivio, A. (1991). Dual coding theory: Retrospect and current status. Canadian Journal of Psychology / Revue Canadienne de Psychologie, 45(3), 255–287. https://doi.org/10.1037/H0084295
Pang, B., & Lee, L. (2008). Opinion Mining and Sentiment Analysis. Foundations and Trends® in Information Retrieval, 2(1–2), 1–135. https://doi.org/10.1561/1500000011
Parhankangas, A., & Renko, M. (2017). Linguistic style and crowdfunding success among social and commercial entrepreneurs. Journal of Business Venturing, 32(2), 215–236. https://doi.org/10.1016/j.jbusvent.2016.11.001
Peng, Y. (2018). Same candidates, different faces: Uncovering media bias in visual portrayals of presidential candidates with computer vision. Journal of Communication, 68(5), 920–941.
Petz, G., Karpowicz, M., Fürschuß, H., Auinger, A., Stříteský, V., & Holzinger, A. (2014). Computational approaches for mining user’s opinions on the Web 2.0. Information Processing & Management, 50(6), 899–908. https://doi.org/10.1016/J.IPM.2014.07.005
Pham, C., & Septianto, F. (2020). A smile – the key to everybody’s heart?: The interactive effects of image and message in increasing charitable behavior. European Journal of Marketing, 54(2), 261–281. https://doi.org/10.1108/EJM-01-2019-0019/FULL/PDF
Polanyi, L., & Zaenen, A. (2006). Contextual valence shifters. Computing Attitude and Affect in Text: Theory and Applications, 1–10.
Quinn, M.-A., Sivesind, G., & Reis, G. (2017). Real-time emotion recognition from facial expressions. Standford University.
Raab, M., Schlauderer, S., Overhage, S., & Friedrich, T. (2020). More than a feeling: Investigating the contagious effect of facial emotional expressions on investment decisions in reward-based crowdfunding. Decision Support Systems, 135, 113326. https://doi.org/10.1016/J.DSS.2020.113326
Ramsey, J. B. (1969). Tests for Specification Errors in Classical Linear Least-Squares Regression Analysis. Journal of the Royal Statistical Society. Series B (Methodological), 31(2), 350–371. http://www.jstor.org/stable/2984219
RB, C., M, S., D, H., K, A., J, F., & AL, B. (1987). Empathy-based helping: is it selflessly or selfishly motivated? Journal of Personality and Social Psychology, 52(4), 749–758. https://doi.org/10.1037//0022-3514.52.4.749
Reich, T., & Christian Wheeler, S. (2016). The good and bad of ambivalence: Desiring ambivalence under outcome uncertainty. Journal of Personality and Social Psychology, 110(4), 493–508. https://doi.org/10.1037/pspa0000047
Riaz, A., Gregor, S., Dewan, S., & Xu, Q. (2018). The interplay between emotion, cognition and information recall from websites with relevant and irrelevant images: A Neuro-IS study. Decision Support Systems, 111, 113–123. https://doi.org/10.1016/J.DSS.2018.05.004
Rinker, T. (2017). Package ‘sentimentr.’ Retrieved, 8, 31.
Roberts, D. S. L., Cowen, P. S., & Macdonald, B. E. (1996). Effects of Narrative Structure and Emotional Content on Cognitive and Evaluative Responses to Film and Text. Http://Dx.Doi.Org/10.2190/1L6D-FA7K-UQ0V-B7UM, 14(1), 33–47. https://doi.org/10.2190/1L6D-FA7K-UQ0V-B7UM
Robinette, Scott., Brand, C., & Lenz, Vicki. (2001). Emotion marketing : the Hallmark way of winning customers for life. 247.
Rothman, N. B., Pratt, M. G., Rees, L., & Vogus, T. J. (2016). Understanding the Dual Nature of Ambivalence: Why and When Ambivalence Leads to Good and Bad Outcomes. Https://Doi.Org/10.5465/Annals.2014.0066, 11(1), 33–72. https://doi.org/10.5465/ANNALS.2014.0066
Rytel, T. (2010). Emotional marketing concept: The new marketing shift in the Postmodern era. Business: Theory and Practice, 11(1), 30–38. https://doi.org/10.3846/BTP.2010.04
Schaller, M., & Cialdini, R. B. (1988). The economics of empathic helping: Support for a mood management motive. Journal of Experimental Social Psychology, 24(2), 163–181. https://doi.org/10.1016/0022-1031(88)90019-4
Scherer, K. R., & Ellgring, H. (2007). Multimodal expression of emotion: Affect programs or componential appraisal patterns? Emotion, 7(1), 158–171. https://doi.org/10.1037/1528-3542.7.1.158
Schraven, E., van Burg, E., van Gelderen, M., & Masurel, E. (2020). Predictions of Crowdfunding Campaign Success: The Influence of First Impressions on Accuracy and Positivity. Journal of Risk and Financial Management 2020, Vol. 13, Page 331, 13(12), 331. https://doi.org/10.3390/JRFM13120331
Septianto, F., & Paramita, W. (2021). Sad but smiling? How the combination of happy victim images and sad message appeals increase prosocial behavior. Marketing Letters, 32(1), 91–110. https://doi.org/10.1007/s11002-020-09553-5
Shapiro, S. S., & Wilk, M. B. (1965). An Analysis of Variance Test for Normality (Complete Samples). Biometrika, 52(3/4), 591–611. https://doi.org/10.2307/2333709
Shaver, P., Schwartz, J., Kirson, D., & O’Connor, C. (1987). Emotion Knowledge: Further Exploration of a Prototype Approach. Journal of Personality and Social Psychology, 52(6), 1061–1086. https://doi.org/10.1037/0022-3514.52.6.1061
Shutenko, O. V., & Ponomarenko, S. (2020). Diagnostics of Transformer Oils Using the Multiple Linear Regression Model. 2020 IEEE Problems of Automated Electrodrive. Theory and Practice (PAEP), 1–6. https://api.semanticscholar.org/CorpusID:226265371
Small, D. A., Loewenstein, G., & Slovic, P. (2007). Sympathy and callousness: The impact of deliberative thought on donations to identifiable and statistical victims. Organizational Behavior and Human Decision Processes, 102(2), 143–153. https://doi.org/10.1016/J.OBHDP.2006.01.005
Small, D. A., & Verrochi, N. M. (2009). The Face of Need: Facial Emotion Expression on Charity Advertisements. Https://Doi.Org/10.1509/Jmkr.46.6.777_JMR6F. https://doi.org/10.1509/JMKR.46.6.777_JMR6F
Srivastava, R., Bharti, P. K., & Verma, P. (2022). Comparative Analysis of Lexicon and Machine Learning Approach for Sentiment Analysis. IJACSA) International Journal of Advanced Computer Science and Applications, 13(3). www.ijacsa.thesai.org
Stieglitz, S., & Dang-Xuan, L. (2013). Emotions and information diffusion in social media - Sentiment of microblogs and sharing behavior. Volume 29, Issue 4, Pages 217 - 248, 29(4), 217–248. https://doi.org/10.2753/MIS0742-1222290408
Stöckli, S., Schulte-Mecklenbeck, M., Borer, S., & Samson, A. C. (2018). Facial expression analysis with AFFDEX and FACET: A validation study. Behavior Research Methods, 50, 1446–1460.
Sullivan, D. G., & Masters, R. D. (1988). “Happy Warriors”: Leaders’ Facial Displays, Viewers’ Emotions, and Political Support. American Journal of Political Science, 32(2), 345. https://doi.org/10.2307/2111127
Tang, H., Tan, S., & Cheng, X. (2009). A survey on sentiment detection of reviews. Expert Systems with Applications, 36(7), 10760–10773.
Teixeira, T., Picard, R., & El Kaliouby, R. (2014). Why, when, and how much to entertain consumers in advertisements? A web-based facial tracking field study. Marketing Science, 33(6), 809–827.
Tellis, G. J., MacInnis, D. J., Tirunillai, S., & Zhang, Y. (2019). What Drives Virality (Sharing) of Online Digital Content? The Critical Role of Information, Emotion, and Brand Prominence. Https://Doi.Org/10.1177/0022242919841034, 83(4), 1–20. https://doi.org/10.1177/0022242919841034
Tian, W., Li, Y., & Li, L. (2021). Research on the impact of online picture contents of agricultural products on consumers’ willingness to click. Journal of Contemporary Marketing Science, 4(2), 300–321. https://doi.org/10.1108/JCMARS-06-2021-0021
van Harreveld, F., Rutjens, B. T., Rotteveel, M., Nordgren, L. F., & van der Pligt, J. (2009). Ambivalence and decisional conflict as a cause of psychological discomfort: feeling tense before jumping off the fence. Journal of Experimental Social Psychology, 45(1), 167–173. https://doi.org/10.1016/J.JESP.2008.08.015
van Rompay, T. J. L., de Vries, P. W., & van Venrooij, X. G. (2010). More than words: On the importance of picture-text congruence in the online environment. Journal of Interactive Marketing, 24(1), 22–30. https://doi.org/10.1016/J.INTMAR.2009.10.003
Vitaglione, G. D., & Barnett, M. A. (2003). Assessing a New Dimension of Empathy: Empathic Anger as a Predictor of Helping and Punishing Desires. Motivation and Emotion, 27(4), 301–325. https://doi.org/10.1023/A:1026231622102
Wang, A. L., Shi, Z., Fairchild, V. P., Aronowitz, C. A., & Langleben, D. D. (2019). Emotional salience of the image component facilitates recall of the text of cigarette warning labels. European Journal of Public Health, 29(1), 153–158. https://doi.org/10.1093/EURPUB/CKY059
White, H. (1980). A heteroskedasticity-consistent covariance matrix estimator and a direct test for heteroskedasticity. Econometrica: Journal of the Econometric Society, 817–838.
Woodside, A. G., & Chebat, J. C. (2001). Updating Heider’s balance theory in consumer behavior: A Jewish couple buys a German car and additional buying-consuming transformation stories. Psychology and Marketing, 18(5), 475–495. https://doi.org/10.1002/MAR.1017
Woodside, A. G., Sood, S., & Miller, K. E. (2008). When consumers and brands talk: Storytelling theory and research in psychology and marketing. Psychology & Marketing, 25(2), 97–145. https://doi.org/10.1002/MAR.20203
Wu, F., Lin, S., Cao, X., Zhong, H., & Zhang, J. (2019). Head design and optimization of an emotionally interactive robot for the treatment of autism. Proceedings of the 2019 4th International Conference on Automation, Control and Robotics Engineering, 1–10.
Xiao, S., Tan, X., Dong, M., & Qi, J. (2014). How to Design Your Project in the Online Crowdfunding Market? Evidence from Kickstarter. International Conference on Interaction Sciences.
Yang, J., Li, Y., Calic, G., & Shevchenko, A. (2020). How multimedia shape crowdfunding outcomes: The overshadowing effect of images and videos on text in campaign information. Journal of Business Research, 117, 6–18. https://doi.org/10.1016/J.JBUSRES.2020.05.008
Yazdavar, A. H., Mahdavinejad, M. S., Bajaj, G., Romine, W., Sheth, A., Monadjemi, A. H., Thirunarayan, K., Meddar, J. M., Myers, A., & Pathak, J. (2020). Multimodal mental health analysis in social media. Plos One, 15(4), e0226248.
Zemack-Rugar, Y., & Klucarova-Travani, S. (2018). Should donation ads include happy victim images? The moderating role of regulatory focus. Marketing Letters, 29(4), 421–434. https://doi.org/10.1007/S11002-018-9471-8/FIGURES/4
Zhao, K., Zhou, L., & Zhao, X. (2022). Multi-modal emotion expression and online charity crowdfunding success. Decision Support Systems, 163, 113842. https://doi.org/10.1016/J.DSS.2022.113842
Zillmann, D. (1988). Mood Management Through Communication Choices. American Behavioral Scientist, 31(3), 327–340. https://doi.org/10.1177/000276488031003005/ASSET/000276488031003005.FP.PNG_V03
