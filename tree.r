
loc <- "http://archive.ics.uci.edu/ml/machine-learning-databases/"
ds  <- "breast-cancer-wisconsin/breast-cancer-wisconsin.data"
url <- paste(loc, ds, sep="")

breast <- read.table(url, sep=",", header=FALSE, na.strings="?")
names(breast) <- c("ID", "clumpThickness", "sizeUniformity",
                   "shapeUniformity", "maginalAdhesion", 
                   "singleEpithelialCellSize", "bareNuclei", 
                   "blandChromatin", "normalNucleoli", "mitosis", "class")

head(breast)

table(breast$class)

df <- breast[-1]   ## ID 삭제

## class 범주형으로 변경 
df$class <- factor(df$class, levels=c(2,4), 
                   labels=c("benign", "malignant"))   
str(df)

set.seed(1234)
train <- sample(nrow(df), 0.7*nrow(df))
df.train <- df[train,]
df.validate <- df[-train,]
table(df.train$class)
table(df.validate$class)

fit.logit <- glm(class~., data=df.train, family=binomial())
summary(fit.logit)

prob <- predict(fit.logit, df.validate, type="response")  # 확률로 표시(0-1)
head(prob, 10)

pred <- factor(prob > .5, levels=c(FALSE, TRUE), 
                     labels=c("benign", "malignant"))
logit.perf <- table(df.validate$class, pred,
                    dnn=c("Actual", "Predicted"))
logit.perf

fit.logit <- glm(class~., data=df.train, family=binomial())
logit_step <- step(fit.logit)
logit_step
loc <- "http://archive.ics.uci.edu/ml/machine-learning-databases/"
ds  <- "breast-cancer-wisconsin/breast-cancer-wisconsin.data"
url <- paste(loc, ds, sep="")

breast <- read.table(url, sep=",", header=FALSE, na.strings="?")
names(breast) <- c("ID", "clumpThickness", "sizeUniformity",
                   "shapeUniformity", "maginalAdhesion", 
                   "singleEpithelialCellSize", "bareNuclei", 
                   "blandChromatin", "normalNucleoli", "mitosis", "class")

head(breast)

table(breast$class)

df <- breast[-1]   ## ID 삭제

## class 범주형으로 변경 
df$class <- factor(df$class, levels=c(2,4), 
                   labels=c("benign", "malignant"))   
str(df)

set.seed(1234)
train <- sample(nrow(df), 0.7*nrow(df))
df.train <- df[train,]
df.validate <- df[-train,]
table(df.train$class)
table(df.validate$class)

fit.logit <- glm(class~., data=df.train, family=binomial())
summary(fit.logit)

prob <- predict(fit.logit, df.validate, type="response")  # 확률로 표시(0-1)
head(prob, 10)

pred <- factor(prob > .5, levels=c(FALSE, TRUE), 
                     labels=c("benign", "malignant"))
logit.perf <- table(df.validate$class, pred,
                    dnn=c("Actual", "Predicted"))
logit.perf

fit.logit <- glm(class~., data=df.train, family=binomial())
logit_step <- step(fit.logit)
logit_step

library(rpart)

set.seed(1234)         ## 샘플 패턴 지정
dtree <- rpart(class ~ ., data=df.train, method="class",      
               parms=list(split="information"))   


dtree$cptable
plotcp(dtree)  # 복잡성 파리미터(Cp)에 대한 교차 검증 오류를 그린다.

dtree.pruned <- prune(dtree, cp=.0125)

install.packages("rpart.plot")

library(rpart.plot)

prp(dtree.pruned, type = 2, extra = 104,  
    fallen.leaves = TRUE, main="Decision Tree")

dtree.pred <- predict(dtree.pruned, df.validate, type="class")
dtree.perf <- table(df.validate$class, dtree.pred, 
                    dnn=c("Actual", "Predicted"))
dtree.perf

library(party)
fit.ctree <- ctree(class~., data=df.train)
plot(fit.ctree, main="Conditional Inference Tree")

ctree.pred <- predict(fit.ctree, df.validate, type="response")
ctree.perf <- table(df.validate$class, ctree.pred, 
                    dnn=c("Actual", "Predicted"))
ctree.perf
loc <- "http://archive.ics.uci.edu/ml/machine-learning-databases/"
ds  <- "breast-cancer-wisconsin/breast-cancer-wisconsin.data"
url <- paste(loc, ds, sep="")

breast <- read.table(url, sep=",", header=FALSE, na.strings="?")
names(breast) <- c("ID", "clumpThickness", "sizeUniformity",
                   "shapeUniformity", "maginalAdhesion", 
                   "singleEpithelialCellSize", "bareNuclei", 
                   "blandChromatin", "normalNucleoli", "mitosis", "class")

head(breast)

table(breast$class)

df <- breast[-1]   ## ID 삭제

## class 범주형으로 변경 
df$class <- factor(df$class, levels=c(2,4), 
                   labels=c("benign", "malignant"))   
str(df)

set.seed(1234)
train <- sample(nrow(df), 0.7*nrow(df))
df.train <- df[train,]
df.validate <- df[-train,]
table(df.train$class)
table(df.validate$class)

fit.logit <- glm(class~., data=df.train, family=binomial())
summary(fit.logit)

prob <- predict(fit.logit, df.validate, type="response")  # 확률로 표시(0-1)
head(prob, 10)

pred <- factor(prob > .5, levels=c(FALSE, TRUE), 
                     labels=c("benign", "malignant"))
logit.perf <- table(df.validate$class, pred,
                    dnn=c("Actual", "Predicted"))
logit.perf

fit.logit <- glm(class~., data=df.train, family=binomial())
logit_step <- step(fit.logit)
logit_step

library(rpart)

set.seed(1234)         ## 샘플 패턴 지정
dtree <- rpart(class ~ ., data=df.train, method="class",      
               parms=list(split="information"))   


dtree$cptable
plotcp(dtree)  # 복잡성 파리미터(Cp)에 대한 교차 검증 오류를 그린다.

dtree.pruned <- prune(dtree, cp=.0125)

install.packages("rpart.plot")

library(rpart.plot)

prp(dtree.pruned, type = 2, extra = 104,  
    fallen.leaves = TRUE, main="Decision Tree")

dtree.pred <- predict(dtree.pruned, df.validate, type="class")
dtree.perf <- table(df.validate$class, dtree.pred, 
                    dnn=c("Actual", "Predicted"))
dtree.perf

library(party)
fit.ctree <- ctree(class~., data=df.train)
plot(fit.ctree, main="Conditional Inference Tree")

ctree.pred <- predict(fit.ctree, df.validate, type="response")
ctree.perf <- table(df.validate$class, ctree.pred, 
                    dnn=c("Actual", "Predicted"))
ctree.perf
loc <- "http://archive.ics.uci.edu/ml/machine-learning-databases/"
ds  <- "breast-cancer-wisconsin/breast-cancer-wisconsin.data"
url <- paste(loc, ds, sep="")

breast <- read.table(url, sep=",", header=FALSE, na.strings="?")
names(breast) <- c("ID", "clumpThickness", "sizeUniformity",
                   "shapeUniformity", "maginalAdhesion", 
                   "singleEpithelialCellSize", "bareNuclei", 
                   "blandChromatin", "normalNucleoli", "mitosis", "class")

head(breast)

table(breast$class)

df <- breast[-1]   ## ID 삭제

## class 범주형으로 변경 
df$class <- factor(df$class, levels=c(2,4), 
                   labels=c("benign", "malignant"))   
str(df)

set.seed(1234)
train <- sample(nrow(df), 0.7*nrow(df))
df.train <- df[train,]
df.validate <- df[-train,]
table(df.train$class)
table(df.validate$class)

fit.logit <- glm(class~., data=df.train, family=binomial())
summary(fit.logit)

prob <- predict(fit.logit, df.validate, type="response")  # 확률로 표시(0-1)
head(prob, 10)

pred <- factor(prob > .5, levels=c(FALSE, TRUE), 
                     labels=c("benign", "malignant"))
logit.perf <- table(df.validate$class, pred,
                    dnn=c("Actual", "Predicted"))
logit.perf

fit.logit <- glm(class~., data=df.train, family=binomial())
logit_step <- step(fit.logit)
logit_step

library(rpart)

set.seed(1234)         ## 샘플 패턴 지정
dtree <- rpart(class ~ ., data=df.train, method="class",      
               parms=list(split="information"))   


dtree$cptable
plotcp(dtree)  # 복잡성 파리미터(Cp)에 대한 교차 검증 오류를 그린다.

dtree.pruned <- prune(dtree, cp=.0125)

install.packages("rpart.plot")

library(rpart.plot)

prp(dtree.pruned, type = 2, extra = 104,  
    fallen.leaves = TRUE, main="Decision Tree")

dtree.pred <- predict(dtree.pruned, df.validate, type="class")
dtree.perf <- table(df.validate$class, dtree.pred, 
                    dnn=c("Actual", "Predicted"))
dtree.perf

library(party)
fit.ctree <- ctree(class~., data=df.train)
plot(fit.ctree, main="Conditional Inference Tree")

ctree.pred <- predict(fit.ctree, df.validate, type="response")
ctree.perf <- table(df.validate$class, ctree.pred, 
                    dnn=c("Actual", "Predicted"))
ctree.perf

library(rpart)

set.seed(1234)         ## 샘플 패턴 지정
dtree <- rpart(class ~ ., data=df.train, method="class",      
               parms=list(split="information"))   


dtree$cptable
plotcp(dtree)  # 복잡성 파리미터(Cp)에 대한 교차 검증 오류를 그린다.

dtree.pruned <- prune(dtree, cp=.0125)

install.packages("rpart.plot")

library(rpart.plot)

prp(dtree.pruned, type = 2, extra = 104,  
    fallen.leaves = TRUE, main="Decision Tree")

dtree.pred <- predict(dtree.pruned, df.validate, type="class")
dtree.perf <- table(df.validate$class, dtree.pred, 
                    dnn=c("Actual", "Predicted"))
dtree.perf

library(party)
fit.ctree <- ctree(class~., data=df.train)
plot(fit.ctree, main="Conditional Inference Tree")

ctree.pred <- predict(fit.ctree, df.validate, type="response")
ctree.perf <- table(df.validate$class, ctree.pred, 
                    dnn=c("Actual", "Predicted"))
ctree.perf