
from pyspark.sql import SparkSession
from pyspark.sql.functions import avg, count

# Start Spark
spark = SparkSession.builder.appName("TaxiZoneSummary").getOrCreate()

# Read trips data
trips = spark.read.parquet("yellow_tripdata_2019-01.parquet")


# Read zone lookup
zones = spark.read.option("header", True).csv("taxi+_zone_lookup.csv")

# Join on PULocationID
trips = trips.join(zones, trips.PULocationID == zones.LocationID, "left")

# Group by pickup zone and summarize
summary = trips.groupBy("Zone").agg(
    count("*").alias("total_trips"),
    avg("trip_distance").alias("avg_distance"),
    avg("tip_amount").alias("avg_tip")
)

# Sort by tip and show top 10
summary.orderBy("avg_tip", ascending=False).show(10, truncate=False)
from pyspark.sql.functions import hour

trips_with_hour = trips.withColumn("hour", hour("tpep_pickup_datetime"))
hourly_tip = trips_with_hour.groupBy("hour").agg(
    count("*").alias("trips"),
    avg("tip_amount").alias("avg_tip")
).orderBy("hour")
hourly_tip.show()
result.write.csv("zone_tip_summary.csv", header=True, mode="overwrite")
