# Emotional Appeal in Donation-Based Crowdfunding Campaigns

## Table of Contents
- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Tools Used](#tools-used)
- [Data Cleaning/Preparation](#data-cleaningpreparation)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Data Analysis](#data-analysis)
- [Results/Findings](#resultsfindings)
- [Recommendations](#recommendations)
- [Limitations](#limitations)
- [References](#references)

---

## Project Overview
This project explores how emotional appeal in the *title* and *cover image* of donation-based crowdfunding campaigns affects their success. Specifically, it investigates how first impressions and emotional congruency influence donor decisions during the *initial decision-making stage*. Using sentiment analysis on both image and text, the project evaluates the effect of emotional valence on fundraising outcomes.

[View Thesis Defence Deck](https://www.canva.com/design/DAGJLY6dUUM/Rtuhkk0gXaH0Z0c8bjhJJA/edit?utm_content=DAGJLY6dUUM&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)

---

## Data Sources
- **Campaign Data**: 148 GoFundMe donation-based crowdfunding campaigns.
- **Cover Images**: Crawled and analyzed using Face⁺⁺ API for facial emotion recognition.
- **Titles**: Extracted text processed through sentiment analysis.

---

## Tools Used
- **R** – Data wrangling, sentiment analysis, regression modeling
- **Face⁺⁺ API** – Facial Emotion Recognition
- **SentimentR Package** – Text sentiment analysis
- **Excel** – Initial filtering and manual inspection

---

## Data Cleaning/Preparation
- Web-scraped campaign metadata (title, image, amount raised, etc.)
- Preprocessed titles: tokenization, stop-word removal, lemmatization
- Extracted image emotion scores and normalized them to [-1, 1] valence scale
- Created positive and negative valence variables for both modalities

---

## Exploratory Data Analysis
- Distribution of campaigns by category
- Initial observation of emotional congruency (e.g. sad titles with smiling images)
- Median title sentiment: **-0.044** (slightly negative)
- Median image sentiment: **0.475** (slightly positive)

---

## Data Analysis
- Statistical modeling and regression were used to estimate the influence of emotional valence on fundraising success.
- Separate effects of image and text sentiment were analyzed, along with their interaction (emotional congruency).

---

## Results/Findings
- **Negative emotional appeal**, especially in *either* title or image, significantly increases donation amounts.
- **Positive appeal** in titles can actually *reduce* donation engagement.
- Emotional *congruency* (e.g. both sad title and sad image) **can backfire** if negativity is too intense.
- Optimal strategy: **subtle negative appeal in one modality**, not both.

---

## Recommendations
- Use emotionally impactful *titles* with moderate negative sentiment to increase engagement.
- Avoid overly positive or emotionally ambiguous language in titles.
- Pair emotionally neutral or slightly positive *images* with emotional text for balance.
- Do not overuse sadness or fear — emotional overload may reduce donor willingness.

---

## Limitations
- Small dataset size (n = 148)
- Potential bias in facial recognition tools, especially for non-standard expressions
- Limited to campaigns in English and on GoFundMe only
- Campaign success defined solely by monetary amount raised

---

## References
1. Abdullah, S., Murnane, E. L., Costa, J. M. R., & Choudhury, T. (2015). *Collective smile: Measuring societal happiness from geolocated images*. CSCW.
2. Albouy, J. (2017). *Emotions and prosocial behaviours: A study of the effectiveness of shocking charity campaigns*. Journal of Marketing Communications, 32(2), 4–25.
3. Andreoni, J. (1989). *Giving with Impure Altruism: Applications to Charity and Ricardian Equivalence*. Journal of Political Economy, 97(6), 1447–1458.
4. Andreoni, J., Rao, J. M., & Trachtman, H. (2017). *Avoiding the Ask: A Field Experiment on Altruism, Empathy, and Charitable Giving*. American Economic Review, 125(3), 625–653.
5. Anusakumar, S. V., Ali, R., & Hooy, C.-W. (2017). *The Effect of Investor Sentiment on Stock Returns: Insight from Emerging Asian Markets*. Asian Academy of Management Journal of Accounting and Finance, 13, 159–178.
6. Arriaga, O., Valdenegro-Toro, M., & Plöger, P. (2017). *Real-time convolutional neural networks for emotion and gender classification*. arXiv:1710.07557.
7. Asch, S. E. (1946). *Forming impressions of personality*. Journal of Abnormal and Social Psychology, 41(3), 258–290.
8. Baberini, M., Coleman, C. L., Slovic, P., & Västfjäll, D. (2015). *Photographic attributes and donation behavior*. Visual Communication Quarterly, 22(2), 118–128.
9. Bagozzi, R. P. (2006). *Consumer Action*. Advances in Consumer Research, 2, 3–42.
10. Bagozzi, R. P., Gopinath, M., & Nyer, P. U. (1999). *The role of emotions in marketing*. Journal of the Academy of Marketing Science, 27(2), 184–206.
11. Bagozzi, R. P., & Moore, D. J. (1994). *Public Service Advertisements: Emotions and Empathy Guide Prosocial Behavior*. Journal of Marketing, 58(1), 56–70.
12. Balahur, A., & Jacquet, G. (2015). *Sentiment analysis meets social media*. Information Processing and Management, 51(4), 428–432.
13. Balbi, S., Misuraca, M., & Scepi, G. (2018). *Combining different evaluation systems on social media for measuring user satisfaction*. Information Processing and Management, 54(4), 674–685.
14. Barrett, L. F., Adolphs, R., Marsella, S., Martinez, A. M., & Pollak, S. D. (2019). *Emotional Expressions Reconsidered*. Psychological Science in the Public Interest, 20(1), 1–68.
15. Bartkiene, E., et al. (2019). *Factors affecting consumer food preferences*. BioMed Research International, 2019, 2097415.
16. Batson, C. D., et al. (1981). *Is empathic emotion a source of altruistic motivation?* Journal of Personality and Social Psychology, 40(2), 290–302.
17. Batson, C. D., & Shaw, L. L. (1991). *Evidence for Altruism*. Psychological Inquiry, 2(2), 107–122.
18. Beier, M., & Wagner, K. (2015). *Crowdfunding Success: A Perspective from Social Media and E-Commerce*. ICIS.
19. Bekkers, R., & Wiepking, P. (2010). *A Literature Review of Empirical Studies of Philanthropy*. Nonprofit and Voluntary Sector Quarterly, 40(5), 924–973.
20. Bennett, R. (1996). *Effects of Horrific Fear Appeals on Public Attitudes Towards AIDS*. International Journal of Advertising, 15(3), 183–202.
21. Bera, A. K., Suprayitno, T., & Premaratne, G. (2002). *Heteroskedasticity-robust estimators*. Journal of Statistical Planning and Inference, 108(1–2), 121–136.
22. Berger, J., et al. (2020). *Uniting the tribes: Using text for marketing insight*. Journal of Marketing, 84(1), 1–25.
23. Bower, G. H. (1981). *Mood and memory*. American Psychologist, 36(2), 129–148.
24. Boxell, L. (2018). *Slanted images: Measuring nonverbal media bias*.
25. Breusch, T. S., & Pagan, A. R. (1979). *A Simple Test for Heteroscedasticity*. Econometrica, 47(5), 1287–1294.
26. Brosius, H. B., Donsbach, W., & Birk, M. (1996). *Text-picture relations in TV news*. Journal of Broadcasting & Electronic Media, 40(2), 180–195.
27. Brown, S. P., Cron, W. L., & Slocum, J. W. (1997). *Goal-directed emotions and salesperson performance*. Journal of Marketing, 61(1), 39–50.
28. Burt, C., & Strongman, K. (2005). *Use of images in charity advertising*. International Journal of Organisational Behaviour, 8(8), 571–580.
29. Calic, G., & Mosakowski, E. (2016). *Sustainability orientation and crowdfunding success*. Journal of Management Studies, 53(5), 738–767.
30. Cao, X., & Jia, L. (2017). *Facial expression in charity appeals*. Nonprofit Management and Leadership, 27(4), 457–473.
31. Carlsmith, J. M., & Gross, A. E. (1969). *Some effects of guilt on compliance*. Journal of Personality and Social Psychology, 11(3), 232–239.
32. Carvalho, S. W., Hildebrand, D., & Sen, S. (2019). *Victim attire and helping behavior*. Journal of the Association for Consumer Research, 4(4), 377–386.
33. Cavanaugh, L. A., Bettman, J. R., & Luce, M. F. (2015). *Specific positive emotions and prosocial consumption*. Journal of Marketing Research, 52(5), 657–673.
34. Chang, C. T., & Lee, Y. K. (2009). *Framing charity advertising*. Journal of Applied Social Psychology, 39(12), 2910–2935.
35. Chang, C. T., & Lee, Y. K. (2010). *Message framing and image valence in charity advertising*. International Journal of Advertising, 29(2), 195–220.
36. Chen, S., Wang, H., Fang, Y., & Wang, W. (2023). *Cover image appeals in crowdfunding*. Decision Support Systems, 171, 113975.
37. Citron, F. M. M., et al. (2014). *Emotional valence and arousal in reading*. Neuropsychologia, 56, 79–89.
38. Cohn, J. F., Ambadar, Z., & Ekman, P. (2007). *Facial Action Coding System (FACS)*. Handbook of Emotion Elicitation and Assessment.
39. Consoli, D. (2010). *Emotional marketing: The new marketing shift*. BRAND, 1(1), 52–59.
40. Cox, J., et al. (2018). *Self-presentation and online crowdfunding*. Computers in Human Behavior, 83, 45–55.
41. Cui, W., & Jiang, Z. (2021). *Text and picture spatial relationships in ads*. ICIS Proceedings.
42. Dickert, S., Sagara, N., & Slovic, P. (2011). *Affective motivations to help others*. Journal of Behavioral Decision Making, 24(4), 361–376.
43. Durbin, J., & Watson, G. S. (1950). *Testing for Serial Correlation*. Biometrika, 37(3/4), 409–428.
44. Eckler, P., & Bolls, P. (2011). *Spreading the virus: Emotional engagement in online video*. Journal of Interactive Advertising, 11(2), 1–11.
45. Eerola, T., Friberg, A., & Bresin, R. (2013). *Emotional expression in music*. Frontiers in Psychology, 4, 487.
46. Ekman, P., & Rosenberg, E. L. (2005). *What the Face Reveals*. Oxford University Press.
47. Elad, B. (2023). *GoFundMe Statistics 2023 and Facts*. EnterpriseAppsToday.
48. Elsen, M., Pieters, R., & Wedel, M. (2016). *Thin slice impressions in advertising*. Journal of Marketing Research, 53(4), 563–579.
49. Erlandsson, A., Nilsson, A., & Västfjäll, D. (2018). *Positive and negative charity appeals*. Journal of Nonprofit & Public Sector Marketing, 30(4), 444–474.
50. Etter, V., Grossglauser, M., & Thiran, P. (2013). *Predicting Kickstarter success*. COSN Proceedings, 177–182.
51. Fan, B., et al. (2014). *Face detection accuracy in Face++*. Megvii Technology.
52. Faseur, T., & Geuens, M. (2010). *Communicating the right emotion in charity appeals*. Communication Research, 37(4), 498–521.
53. Festinger, L. (1997). *A Theory of Cognitive Dissonance*. Stanford University Press.
54. Fiala, L., & Noussair, C. N. (2017). *Charitable giving and the default effect*. Economic Inquiry, 55(4), 1792–1812.
55. Fisher, R. J., & Ma, Y. (2014). *The price of being beautiful*. Journal of Consumer Research, 41(2), 436–450.
56. Fisher, R. J., Vandenbosch, M., & Antia, K. D. (2008). *Empathy and fund-raising appeals*. Journal of Consumer Research, 35(3), 519–531.
57. Freedman, J. L., Wallington, S. A., & Bless, E. (1967). *Effect of guilt on compliance*. Journal of Personality and Social Psychology, 7(2), 117–124.
58. Geise, S., & Baden, C. (2015). *Visual communication and frame-processing theory*. Communication Theory, 25(1), 46–69.
59. Genevsky, A., & Knutson, B. (2015). *Neural affective mechanisms and microlending*. Psychological Science, 26(9), 1411–1422.
60. Gibson, R., & Zillmann, D. (2000). *Incidental pictorial information and issue perception*. Journalism & Mass Communication Quarterly, 77(2), 355–366.
61. Gleasure, R., & Feller, J. (2016). *Donor behavior in charitable crowdfunding*. International Journal of Electronic Commerce, 20(4), 499–524.
62. Gneezy, U., Imas, A., & Madarász, K. (2014). *Conscience accounting and social behavior*. Management Science, 60(11), 2645–2658.
63. GoFundMe. (2024). *The most popular online fundraising platform*. https://www.gofundme.com
64. Goodfellow, I. J., et al. (2015). *Challenges in representation learning*. Neural Networks, 64, 59–63.
65. Greenberg, M. D., et al. (2013). *Crowdfunding support tools*. CHI Proceedings, 1815–1820.
66. Guo, Q., Zhou, S., Wu, Y., Peng, Z., & Ma, X. (2022). *First impressions in medical crowdfunding*. CHI Conference Proceedings.
67. Haim, M., & Jungblut, M. (2021). *Politicians’ self-depiction and media bias*. Political Communication, 38(1–2), 55–74.
68. Hartmann, J., et al. (2023). *Accuracy and application of sentiment analysis*. International Journal of Research in Marketing, 40(1), 75–87.
69. Hirschberg, J., & Manning, C. D. (2015). *Advances in natural language processing*. Science, 349(6245), 261–266.
70. Höfling, T. T. A., et al. (2020). *Facial coding vs psychophysiological indicators*. Frontiers in Psychology, 11, 1388.
71. Hörisch, J. (2015). *Crowdfunding for environmental ventures*. Journal of Cleaner Production, 107, 636–645.
72. Horney, K. (2013). *Our Inner Conflicts: A Constructive Theory of Neurosis*. Routledge.
73. Hou, J. R., Zhang, J. J., & Zhang, K. (2019). *Title images and crowdfunding performance*. HICSS Proceedings, 4439–4448.
74. Hutto, C., & Gilbert, E. (2014). *VADER: A rule-based model for sentiment analysis*. ICWSM, 8(1), 216–225.
75. Isen, A. M. (2001). *Positive affect and decision making*. Journal of Consumer Psychology, 11(2), 75–85.
76. Islam, T., et al. (2024). *Lexicon and deep learning-based sentiment analysis*. Journal of Computer and Communications, 12(1), 11–34.
77. Izard, C. E. (2009). *Emotion theory and research*. Annual Review of Psychology, 60, 1–25.
78. Jang, H., & Chu, W. (2022). *Message features and donations in crowdfunding*. Journal of Consumer Behaviour, 21(6), 1464–1477.
79. Jang, Y. W., & Han, K. (2022). *Lyrics sentiment analysis and vocal expression*. Korean Association for the Study of Popular Music.
80. Janis, I. L., & Feshbach, S. (1953). *Fear-arousing communications*. Journal of Abnormal and Social Psychology, 48(1), 78–92.
81. Jarque, C. M., & Bera, A. K. (1980). *Tests for normality and homoscedasticity*. Economics Letters, 6(3), 255–259.
82. Jin, B., et al. (2020). *Facial expression recognition for Parkinson diagnosis*. Journal of Medical Internet Research, 22(7), e18697.
83. Jockers, M. M. (2023). *syuzhet: R package for sentiment analysis*. GitHub.
84. Joffe, H. (2008). *The power of visual material*. Diogenes, 55(1), 84–93.
85. Jordan, W. P. (2001). *Pleasure with products: The new human factors*. CRC Press.
86. Kamins, M. A., Marks, L. J., & Skinner, D. (1991). *Mood and TV commercial evaluation*. Journal of Advertising, 20(2), 1–14.
87. Karch, J. (2020). *Improving on adjusted R-squared*. Collabra: Psychology, 6(1), 45.
88. Keltner, D., & Cordaro, D. T. (2017). *Multimodal emotional expressions*. Oxford University Press.
89. Kemper, T. D., & Lazarus, R. S. (1992). *Emotion and adaptation*. Contemporary Sociology, 21(4), 522.
90. Kickstarter. (2024). *Kickstarter platform overview*. https://www.kickstarter.com
91. Kim, H., & Fesenmaier, D. R. (2008). *First impressions on destination websites*. Journal of Travel Research, 47(1), 3–13.
92. Kim, H., Park, K., & Norbert, S. (2010). *Incidental emotions in product evaluation*. Journal of Consumer Research, 36(6), 983–991.
93. Klein, C. (2023). *Exploratory analysis and experimentation*. Philosophy of Science, 1–9.
94. Küntzler, T. (2021). *Extracting emotions from faces with Face++*. Methods Bites, Social Science Data Lab.
95. Küntzler, T., Höfling, T. T. A., & Alpers, G. W. (2021). *Facial expression recognition in standardized and non-standardized expressions*. Frontiers in Psychology, 12, 627561.
96. Kuppuswamy, V., & Bayus, B. L. (2015). *Crowdfunding dynamics on Kickstarter*. SSRN Electronic Journal.
97. Kwon, J., Lin, H., Deng, L., Dellicompagni, T., & Kang, M. Y. (2022). *Emotional content in charity social media ads*. International Journal of Advertising, 41(7), 1314–1337.
98. Lee, Y., Coyle, J. R., & Chen, A. N. K. (2021). *Progress presentation in crowdfunding*. Decision Support Systems, 147, 113573.
99. Lee, Y. F., Siew, A., Lee, H., & Zainol, Z. (2022). *Text mining and sentiment analysis comparison*. Zulfagar Journal of Defence Science, 5(2), 112–119.
100. Leeflang, P. S. H., et al. (2015). *Modeling markets: Marketing decision making*. Springer.
101. Leone, L., Perugini, M., & Bagozzi, R. P. (2005). *Anticipated emotions and decision making*. Cognition and Emotion, 19(8), 1175–1198.
102. Lewinski, P. (2015). *Automated facial coding accuracy*. Frontiers in Psychology, 6, 1488.
103. Li, D., & Atkinson, L. (2020). *Positive victim images in prosocial advertising*. International Journal of Nonprofit and Voluntary Sector Marketing, 25(4), e1676.
104. Liang, J., Chen, Z., & Lei, J. (2016). *Strength emotion in donation appeals*. Journal of Consumer Psychology, 26(2), 283–288.
105. Lii, Y.-S., & Sy, E. (2009). *Internet differential pricing and consumer emotions*. Computers in Human Behavior, 25(3), 770–777.
106. Lilliefors, H. W. (1967). *Kolmogorov-Smirnov test for normality*. Journal of the American Statistical Association, 62(318), 399–402.
107. Lim, K. H., Benbasat, I., & Ward, L. M. (2000). *Multimedia and first impression bias*. Information Systems Research, 11(2), 115–136.
108. Lindgaard, G., et al. (2006). *First impressions in web design*. Behaviour & Information Technology, 25(2), 115–126.
109. Lochbuehler, K., et al. (2018). *Message congruency in health warning labels*. Tobacco Control, 27(3), 266–271.
110. Long, J. S., & Ervin, L. H. (2000). *Using heteroscedasticity-consistent standard errors*. The American Statistician, 54(3), 217–224.
111. Lu, H. (2015). *Sadness vs. hope in climate change messaging*. Communication Research, 38(2), 143–169.
112. Lwin, M., & Phau, I. (2014). *Existential guilt appeals in charity ads*. Journal of Marketing Management, 30(13–14), 1467–1485.
113. Mackinnon, J. G., & White, H. (1985). *Improved heteroskedasticity-consistent estimators*. Journal of Econometrics, 29(3), 305–325.
114. Mahajani, S. J., Srivastava, S., & Smeaton, A. F. (2023). *Lexicon vs ML-based sentiment analysis*. arXiv:2311.06221.
115. Marcus, G. E., et al. (2000). *Emotions and political decision making*. Political Psychology, 21(2), 447–474.
116. McIntyre, K., Lough, K., & Manzanares, K. (2018). *Photo-text congruency in solutions journalism*. Journalism & Mass Communication Quarterly, 95(4), 971–989.
117. Merchant, A., Ford, J. B., & Sargeant, A. (2010). *Storytelling in charitable organizations*. Journal of Business Research, 63(7), 754–762.
118. Messias, J., Vikatos, P., & Benevenuto, F. (2017). *Face++ accuracy in emotion detection*. Proceedings of the Web Conference.
119. Misuraca, M., Forciniti, A., Scepi, G., & Spano, M. (2020). *Sentiment analysis for education with R*. arXiv:2005.12840.
120. Mitra, T., & Gilbert, E. (2014). *Language and success on Kickstarter*. CSCW Proceedings, 49–61.
121. Mollick, E. (2014). *The dynamics of crowdfunding*. Journal of Business Venturing, 29(1), 1–16.
122. Niedenthal, P. M., & Setterlund, M. B. (1994). *Emotion congruence in perception*. Personality and Social Psychology Bulletin, 20(4), 401–411.
123. Obermiller, C. (1995). *Baby is sick/baby is well: Environmental communication appeals*. Journal of Advertising, 24(2), 55–70.
124. Ordones, L., et al. (2019). *Directive images and text in advertising*. Journal of Marketing Communications.
125. Ottaviani, F. M., & De Marco, A. (2021). *Multiple linear regression for project cost forecasting*. CENTERIS/ProjMAN/HCist Proceedings.
126. Paivio, A. (1991). *Dual coding theory: Retrospect and current status*. Canadian Journal of Psychology, 45(3), 255–287.
127. Pang, B., & Lee, L. (2008). *Opinion mining and sentiment analysis*. Foundations and Trends in Information Retrieval, 2(1–2), 1–135.
128. Parhankangas, A., & Renko, M. (2017). *Linguistic style and crowdfunding success*. Journal of Business Venturing, 32(2), 215–236.
129. Peng, Y. (2018). *Media bias in visual portrayals of presidential candidates*. Journal of Communication, 68(5), 920–941.
130. Petz, G., et al. (2014). *Computational approaches for mining opinions on Web 2.0*. Information Processing & Management, 50(6), 899–908.
131. Pham, C., & Septianto, F. (2020). *Smile appeal in charitable behavior*. European Journal of Marketing, 54(2), 261–281.
132. Polanyi, L., & Zaenen, A. (2006). *Contextual valence shifters*. In Computing Attitude and Affect in Text: Theory and Applications.
133. Quinn, M.-A., Sivesind, G., & Reis, G. (2017). *Real-time emotion recognition from facial expressions*. Stanford University.
134. Raab, M., Schlauderer, S., Overhage, S., & Friedrich, T. (2020). *Facial emotional expressions and crowdfunding decisions*. Decision Support Systems, 135, 113326.
135. Ramsey, J. B. (1969). *Tests for specification errors in regression*. Journal of the Royal Statistical Society. Series B, 31(2), 350–371.
136. RB, C., M, S., D, H., K, A., J, F., & AL, B. (1987). *Empathy-based helping: Selfless or selfish?* Journal of Personality and Social Psychology, 52(4), 749–758.
137. Reich, T., & Wheeler, S. C. (2016). *Ambivalence and decision outcomes*. Journal of Personality and Social Psychology, 110(4), 493–508.
138. Riaz, A., Gregor, S., Dewan, S., & Xu, Q. (2018). *Emotion, cognition, and information recall*. Decision Support Systems, 111, 113–123.
139. Rinker, T. (2017). *sentimentr: R package for sentiment analysis*. GitHub.
140. Roberts, D. S. L., Cowen, P. S., & Macdonald, B. E. (1996). *Narrative structure and emotional content*. Communication Research, 14(1), 33–47.
141. Robinette, S., Brand, C., & Lenz, V. (2001). *Emotion marketing: The Hallmark way*. McGraw-Hill.
142. Rothman, N. B., Pratt, M. G., Rees, L., & Vogus, T. J. (2016). *Ambivalence and outcomes*. Academy of Management Annals, 11(1), 33–72.
143. Rytel, T. (2010). *Emotional marketing in the postmodern era*. Business: Theory and Practice, 11(1), 30–38.
144. Schaller, M., & Cialdini, R. B. (1988). *Economics of empathic helping*. Journal of Experimental Social Psychology, 24(2), 163–181.
145. Schaefer, S., Terlutter, R., & Diehl, S. (2020). *CSR communication on social media*. Journal of Business Ethics.
146. Scherer, K. R., & Ellgring, H. (2007). *Multimodal expression of emotion*. Emotion, 7(1), 158–171.
147. Schraven, E., van Burg, E., van Gelderen, M., & Masurel, E. (2020). *First impressions and crowdfunding predictions*. Journal of Risk and Financial Management, 13(12), 331.
148. Septianto, F., & Paramita, W. (2021). *Happy victim images and sad messages*. Marketing Letters, 32(1), 91–110.
149. Shapiro, S. S., & Wilk, M. B. (1965). *Shapiro-Wilk test for normality*. Biometrika, 52(3/4), 591–611.
150. Shaver, P., Schwartz, J., Kirson, D., & O'Connor, C. (1987). *Emotion knowledge and prototypes*. Journal of Personality and Social Psychology, 52(6), 1061–1086.
151. Shutenko, O. V., & Ponomarenko, S. (2020). *Diagnostics of transformer oils using multiple linear regression*. IEEE PAEP, 1–6.
152. Small, D. A., Loewenstein, G., & Slovic, P. (2007). *Deliberative thought and donations*. Organizational Behavior and Human Decision Processes, 102(2), 143–153.
153. Small, D. A., & Verrochi, N. M. (2009). *Facial emotion expression in charity ads*. Journal of Marketing Research, 46(6), 777–787.
154. Srivastava, R., Bharti, P. K., & Verma, P. (2022). *Lexicon vs ML sentiment analysis*. International Journal of Advanced Computer Science and Applications, 13(3).
155. Stieglitz, S., & Dang-Xuan, L. (2013). *Emotions and information diffusion in social media*. MIS Quarterly, 29(4), 217–248.
156. Stöckli, S., Schulte-Mecklenbeck, M., Borer, S., & Samson, A. C. (2018). *Facial expression analysis with AFFDEX and FACET*. Behavior Research Methods, 50, 1446–1460.
157. Sullivan, D. G., & Masters, R. D. (1988). *Happy warriors: Leaders’ facial displays*. American Journal of Political Science, 32(2), 345.
158. Tang, H., Tan, S., & Cheng, X. (2009). *Sentiment detection of reviews*. Expert Systems with Applications, 36(7), 10760–10773.
159. Teixeira, T., Picard, R., & El Kaliouby, R. (2014). *Facial tracking in advertising*. Marketing Science, 33(6), 809–827.
160. Tellis, G. J., MacInnis, D. J., Tirunillai, S., & Zhang, Y. (2019). *Drivers of virality in digital content*. Journal of Marketing Research, 83(4), 1–20.
161. Tian, W., Li, Y., & Li, L. (2021). *Impact of online picture contents on click behavior*. Journal of Contemporary Marketing Science, 4(2), 300–321. https://doi.org/10.1108/JCMARS-06-2021-0021  
162. van Harreveld, F., Rutjens, B. T., Rotteveel, M., Nordgren, L. F., & van der Pligt, J. (2009). *Ambivalence and decisional conflict*. Journal of Experimental Social Psychology, 45(1), 167–173. https://doi.org/10.1016/J.JESP.2008.08.015  
163. van Rompay, T. J. L., de Vries, P. W., & van Venrooij, X. G. (2010). *Picture-text congruence in online environments*. Journal of Interactive Marketing, 24(1), 22–30. https://doi.org/10.1016/J.INTMAR.2009.10.003  
164. Vitaglione, G. D., & Barnett, M. A. (2003). *Empathic anger and helping behavior*. Motivation and Emotion, 27(4), 301–325. https://doi.org/10.1023/A:1026231622102  
165. Wang, A. L., Shi, Z., Fairchild, V. P., Aronowitz, C. A., & Langleben, D. D. (2019). *Emotional salience and recall in cigarette warnings*. European Journal of Public Health, 29(1), 153–158. https://doi.org/10.1093/EURPUB/CKY05959  
166. White, H. (1980). *Heteroskedasticity-consistent covariance matrix estimator*. Econometrica, 817–838.  
167. Woodside, A. G., & Chebat, J. C. (2001). *Heider’s balance theory in consumer behavior*. Psychology and Marketing, 18(5), 475–495. https://doi.org/10.1002/MAR.1017  
168. Woodside, A. G., Sood, S., & Miller, K. E. (2008). *Storytelling theory in psychology and marketing*. Psychology & Marketing, 25(2), 97–145. https://doi.org/10.1002/MAR.20203  
169. Wu, F., Lin, S., Cao, X., Zhong, H., & Zhang, J. (2019). *Emotionally interactive robot design for autism treatment*. Proceedings of the 2019 4th International Conference on Automation, Control and Robotics Engineering, 1–10.  
170. Xiao, S., Tan, X., Dong, M., & Qi, J. (2014). *Designing crowdfunding projects: Evidence from Kickstarter*. International Conference on Interaction Sciences.  
171. Yang, J., Li, Y., Calic, G., & Shevchenko, A. (2020). *Multimedia and crowdfunding outcomes*. Journal of Business Research, 117, 6–18. https://doi.org/10.1016/J.JBUSRES.2020.05.008  
172. Yazdavar, A. H., et al. (2020). *Multimodal mental health analysis in social media*. PLOS ONE, 15(4), e0226248.  
173. Zemack-Rugar, Y., & Klucarova-Travani, S. (2018). *Happy victim images in donation ads*. Marketing Letters, 29(4), 421–434. https://doi.org/10.1007/S11002-018-9471-8  
174. Zhao, K., Zhou, L., & Zhao, X. (2022). *Multi-modal emotion expression and charity crowdfunding success*. Decision Support Systems, 163, 113842. https://doi.org/10.1016/J.DSS.2022.113842  
175. Zillmann, D. (1988). *Mood management through communication choices*. American Behavioral Scientist, 31(3), 327–340. https://doi.org/10.1177/000276488031003005
