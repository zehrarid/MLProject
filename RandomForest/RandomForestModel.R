library(h2o)
h2o.init()

guideset.hex <- as.h2o(guideset)
df <- guideset.hex
splits <- h2o.splitFrame(
  df,
  c(0.6,0.2),
  seed = 1234
  )
train <- h2o.assign(splits[[1]],"train.hex")
valid <- h2o.assign(splits[[2]],"valid.hex")
test <- h2o.assign(splits[[3]],"test.hex")

rf1<-h2o.randomForest(
  training_frame = train,
  validation_frame = valid,
  x=4:8,
  y=9,
  model_id = "rfmodel1",
  ntrees = 200,
  max_depth = 30,
  stopping_rounds = 2,
  stopping_tolerance = 1e-2,
  score_each_iteration = T,
  seed = 1234
 )

summary(rf1)
rf1@model$validation_metrics
h2o.hit_ratio_table(rf1,valid = T)[1,2]
prediction <- predict(rf1,test)
print(prediction)
