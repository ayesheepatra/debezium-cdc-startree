# Real-Time Analytics with StarTree Cloud for OLTP CDC Data

## Introduction

This repository demonstrates how to build real-time analytics applications by integrating MySQL (or other supported databases) with StarTree Cloud using Debezium and Amazon MSK. The goal is to enable subsecond queries on live operational data, making it easy to create dashboards and actionable insights.

## Architecture Overview



Source Database (MySQL, PostgreSQL, etc.): Change Data Capture (CDC) is enabled using binlogs, WAL, or equivalent mechanisms.

Debezium: Captures changes from the database and streams them to Kafka.

Amazon MSK: Acts as the message broker, managing the real-time data pipeline.

StarTree Cloud: Ingests CDC data for low-latency querying and visualization.

## Setup Guide

1. Configure the Source Database

Enable CDC by configuring binlogs/WAL.

Modify security groups to allow Debezium connectivity.

Optionally enable public access for testing (not recommended for production).

2. Prepare Debezium Connector

Download Debezium JAR files.

Package them into a ZIP file.

Upload the ZIP file to an Amazon S3 bucket.

3. Create an MSK Cluster

Configure MSK with:

3 brokers (1 per availability zone).

TLS encryption.

IAM authentication.

4. Deploy MSK Connect Connector

Use the Debezium custom plugin uploaded to S3.

Configure the connector properties for your database (examples in this repo).

5. Ingest Data into StarTree Cloud

Define a schema and table in StarTree Cloud:

Schema: Maps the structure of incoming data.

Table Config: Specifies ingestion settings and topics.

6. Validate the Setup

Verify MSK Connect is running.

Ensure data is flowing into StarTree Cloud.

Query the data to confirm ingestion.

7. Analyze Data in Real-Time

Use StarTree Cloud’s APIs or connect visualization tools like Grafana to create dashboards.
