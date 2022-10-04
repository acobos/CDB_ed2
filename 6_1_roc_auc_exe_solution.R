# Exercise on marker accuracy of subarachnoid hemorrhageprognosis
library(pROC)
data(aSAH)
head(aSAH)

# converting wfns (factor) to numeric
class(aSAH$wfns)
aSAH$wfns <- as.numeric(aSAH$wfns)
class(aSAH$wfns)

# just to see distribution of wfns by outcome: clearly non-normal !
gf_boxplot(wfns ~ outcome, data = aSAH) +
  stat_summary(fun=mean, geom="point", color="red") + 
  coord_flip()


# ROC analysis
roc1 <- roc(outcome ~ ndka, data = aSAH)
roc2 <- roc(outcome ~ s100b, data = aSAH)
roc3 <- roc(outcome ~ wfns, data = aSAH)

# plot all three ROC curves
plot(roc1, col="blue")
plot(roc2, col="darkgreen", add = TRUE)
plot(roc3, col="red", add = TRUE)
legend("bottomright", 
       legend = c("ndka", "s100b", "wfns"), 
       col = c("blue", "darkgreen", "red"),
       lwd = 2)

# compute AUC's and CI's using bootstrap (normal approximation not appropriate here)
auc(roc1);  set.seed(1);  ci(roc1, method = "bootstrap") 
auc(roc2);  set.seed(1);  ci(roc2, method = "bootstrap") 
auc(roc3);  set.seed(1);  ci(roc3, method = "bootstrap") 


# comparisons of wfns vs ndka and s100b
set.seed(1)
roc.test(roc3, roc1, method = "bootstrap")
set.seed(1)
roc.test(roc3, roc2, method = "bootstrap")

# ROC curve and optimal threshold
plot.roc(roc3, col="red", 
         print.auc=TRUE, 
         print.thres = "best")

# see optimal threshold
aSAH %>% gf_boxplot(wfns ~ outcome) %>% 
  gf_hline(yintercept = 3.5, lty=2, col = "red")
