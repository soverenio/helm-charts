# Soveren Data-At-Rest (DAR) Sensor releases

There are the following components of the DAR Sensor:

| Component            | Kind       | Name               |
|----------------------|------------|--------------------|
| **Crawler**          | Deployment | `crawler`          |
| **Detection**        | Deployment | `detection-tool`   |
| **Kafka**            | Deployment | `kafka`            |           
| **Prometheus agent** | Deployment | `prometheus-agent` |

Below you can find the release notes with changes in components and their versions. There is also the Helm chart version for each release.

If the component is not mentioned in the release notes, it means that there were no changes in it.

## DAR-24.7.2

Release date: Jul 16, 2024

### Versions

* **Crawler**: 0.8.0
* **Detection**: 2.11.5
* **Helm chart**: 0.16.1

### Changes

This is a bugfix release.

#### Crawler v0.8.0

* Resolved an issue with insufficient permissions for database access: instead of displaying no tables, the appropriate error message is now shown.


## DAR-24.7.1

Release date: Jul 04, 2024

### Versions

* **Crawler**: 0.7.0
* **Detection**: 2.11.5
* **Helm chart**: 0.15.1

### Changes

This release includes an enhanced detection component and the ability to pass metadata, allowing Kafka clusters and databases to be displayed on the data map and in the data sources UI. For the latter feature to work, you need to configure the autodetection of data sources in the product UI. Please note that this feature is still under development.

#### Crawler v0.7.0

* Improvements for showing discovered Kafka clusters and databases on the data map and in the data sources UI

#### Detection v2.11.5

1. Optimizations
2. Improved model


## DAR-24.5.1-hotfix

Release date: Jun 10, 2024

### Versions

* **Crawler**: 0.6.3
* **Detection**: 2.11.4
* **Helm chart**: 0.14.2

### Changes

#### Crawler v0.6.3

* Bugfixes


## DAR-24.5.1

Release date: May 21, 2024

### Versions

* **Crawler**: 0.6.2
* **Detection**: 2.11.4
* **Helm chart**: 0.14.1

### Changes

This is the first generally available release of the Soveren DAR Sensor.

The Soveren DAR Sensor is designed to uncover sensitive data in data sources such as S3 buckets, Kafka, and databases. It complements the [Soveren DIM Sensor](https://github.com/soverenio/helm-charts/blob/master/charts/soveren-agent/release-notes.md) by providing full visibility into your company's sensitive data landscape and control over how this sensitive data is used

* **S3 buckets**
  * Currently, only AWS is supported.
  * Upon startup, the sensor assumes the AWS Role configured by you in IAM to access the buckets.
  * The sensor automatically discovers available S3 buckets, scans them periodically for object listings, and performs sensitive data detection on selected samples.
  * Sensitive data detection is available for the following formats:
    * JSON
    * NDJSON
    * CSV
    * YAML
    * Text-based logs
  * GZipped JSON and logs are also supported.
  * If the DAR sensor is complemented by the DIM sensor of version [DIM-24.5.2](https://github.com/soverenio/helm-charts/blob/master/charts/soveren-agent/release-notes.md#dim-2452) and newer, connections between Kubernetes services and S3 buckets will be shown on the data map.

* **Kafka**
  * The sensor is configured to access specified Kafka brokers with supplied credentials.
  * It discovers available topics and performs sensitive data detection in sampled messages.
  * Currently, sensitive data detection is available for JSON messages only.
  * When sampling the messages, the sensor considers their schemas.

* **Databases**
  * Currently, only PostgreSQL is supported.
  * You need to supply the connection string, including access credentials.
  * The sensor discovers available schemas and tables and performs sensitive data detection on sampled rows.

For details on how to deploy and configure the DAR Sensor, see the following documentation:

* Quick start: https://docs.soveren.io/en/stable/getting-started/quick-start/#data-at-rest-dar
* Configuration: https://docs.soveren.io/en/stable/administration/configuring-sensor/#dar-configuration