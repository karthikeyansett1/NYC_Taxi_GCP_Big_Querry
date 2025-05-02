from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("TaxiParquet").getOrCreate()

df = spark.read.parquet("yellow_tripdata_2019-01.parquet")

df.printSchema()
df.show(5)
