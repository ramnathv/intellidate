# ARE HAIR COLOR AND EYE COLOR ASSOCIATED?

# LOAD LIBRARIES ---
library(ggplot2)
library(plyr)


# PREPARE DATA ---
hair_eye <- as.data.frame(HairEyeColor)
hair_eye <- ddply(hair_eye, .(Hair, Eye), summarize, Freq = sum(Freq))

# PLOT DATA
ggplot(hair_eye, aes(Hair, Freq)) +
  geom_bar(aes(fill = Eye), position = 'fill') +
  scale_fill_manual(values = c('Brown', 'Blue', 'Burlywood3', 'Green')) +
  scale_x_discrete(expand = c(0, 0)) + scale_y_continuous(expand = c(0, 0))

