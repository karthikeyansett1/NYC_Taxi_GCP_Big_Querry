from pyspark.sql import SparkSession
spark = SparkSession.builder.appName("TaxiAnalysis").getOrCreate()

df = spark.read.csv("gs://nyc-taxi-data-ksetti/yellow_tripdata_2019-01_sample.csv", header=True, inferSchema=True)

df_clean = df.filter((df["trip_distance"] > 0) & (df["total_amount"] > 0))

summary = df_clean.groupBy("payment_type").agg(
    {"trip_distance": "avg", "total_amount": "avg", "*": "count"}
)

summary.show()

summary.write.mode("overwrite").csv("gs://nyc-taxi-data-ksetti/summary_results")

spark.stop()
