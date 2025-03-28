# Soveren Data-In-Motion (DIM) Sensor releases

There are the following components of the DIM Sensor:

| Component             | Kind       | Name               |
|-----------------------|------------|--------------------|
| **Digger**            | Deployment | `digger`           |
| **Interceptors**      | DaemonSet  | `interceptor`      |
| **Detection**         | Deployment | `detection-tool`   |
| **Kafka**             | Deployment | `kafka`            |           
|  **Prometheus agent** | Deployment | `prometheus-agent` |

Below you can find the release notes with changes in components and their versions. There is also the Helm chart version for each release.

If the component is not mentioned in the release notes, it means that there were no changes in it.

Versions of Digger and Interceptors are synchronized, but sometimes there are changes in one of them only. In this case, the component that has no changes is not mentioned in the release notes.

## DIM-25.3.2

Release date: Mar 28, 2025

### Versions

* **Digger**: 0.44.0
* **Interceptors**: 0.44.0
* **Detection**: 2.13.8
* **Helm chart**: 1.52.0

### Changes

Reduced memory usage and improved Kubernetes metadata handling in Digger; performance and observability enhancements in Detection.

#### Digger v0.44.0

1. Reduced memory footprint
2. Improvements in K8s metadata handling and caching

#### Detection v2.13.8

* Performance and observability improvements


## DIM-25.3.1

Release date: Mar 17, 2025

### Versions

* **Digger**: 0.43.0
* **Interceptors**: 0.43.0
* **Detection**: 2.13.6
* **Helm chart**: 1.51.0

### Changes

This release introduces traffic volume estimation for API Endpoints, along with enhanced observability and a refactored liveness probe in Detection. Additionally, all components now support custom `volumeMounts` and `volumes`, enhancing deployment flexibility.

#### Digger v0.43.0

1. Support for traffic volume estimations
2. Stability and observability improvements

#### Interceptors v0.43.0

1. Support for traffic volume estimations
2. Stability and observability improvements

#### Detection v2.13.6

1. Observability improvements
2. Refactored liveness probe

#### Helm v1.51.0

1. Support for custom `volumeMounts` and `volumes`
2. Simplified `httpsProxyNoProxy` settings


## DIM-25.1.1

Release date: Jan 14, 2025

### Versions

* **Digger**: 0.42.0
* **Interceptors**: 0.42.0
* **Detection**: 2.13.3
* **Helm chart**: 1.50.0

### Changes

This release adds support for namespace labels in filtering, on the data map, and in policies.

#### Digger v0.42.0

* Support for namespace labels


## DIM-24.12.2

Release date: Dec 27, 2024

### Versions

* **Digger**: 0.41.0
* **Interceptors**: 0.41.0
* **Detection**: 2.13.3
* **Helm chart**: 1.49.0

### Changes

The new release of Interceptors extends support for additional cloud infrastructures. Detection now no longer requires an OtA model update at startup, allowing it to function even if the update server is unavailable, and it includes overall improvements to observability.

#### Interceptors v0.41.0

* Extended support for various cloud infrastructures

#### Detection v2.13.3

1. OtA model update at startup is no longer mandatory: Detection will still run even if the update server is unavailable
2. Improved observability


## DIM-24.12.1

Release date: Dec 09, 2024

### Versions

* **Digger**: 0.40.0
* **Interceptors**: 0.40.0
* **Detection**: 2.13.0
* **Helm chart**: 1.48.0

### Changes

The new release introduces a beta feature for identifying data flows between Kubernetes clusters, offers improved memory consumption, and provides over-the-air (OtA) machine learning model updates for Detection through Digger. It also includes refined default settings to bypass proxies and various fixes and enhancements across Digger, Interceptors, Detection, and the Helm chart.

#### Digger v0.40.0

1. Beta version for identifying data flows between Kubernetes clusters
2. Improved memory consumption
3. Added support for over-the-air (OtA) ML model updates for Detection
4. Fixes and improvements

#### Interceptors v0.40.0

1. Beta version of identifying data flows between Kubernetes clusters
2. Fixes and improvements

#### Detection v2.13.0

* Over-the-air (OtA) ML model updates are now run via Digger

#### Helm chart v1.48.0

1. Default values for `httpsProxyNoProxy`, to bypass proxy for communications between Digger and Detection and between Digger and Kubernetes API
2. Added support for over-the-air (OtA) ML model updates for Detection via Digger


## DIM-24.10.2

Release date: Oct 30, 2024

### Versions

* **Digger**: 0.39.0
* **Interceptors**: 0.39.0
* **Detection**: 2.12.6
* **Helm chart**: 1.47.0

### Changes

This release includes improved detection model, stability fixes and introduces a beta version of TLS encrypted traffic interception.

#### Digger v0.39.0

* Stability fixes

#### Interceptors v0.39.0

* Beta version of TLS encrypted traffic interception 

#### Detection v2.12.6

* Improved detection model


## DIM-24.10.1

Release date: Oct 10, 2024

### Versions

* **Digger**: 0.38.0
* **Interceptors**: 0.38.0
* **Detection**: 2.12.5
* **Helm chart**: 1.46.1

### Changes

This release includes improved detection model and a stability fix for Detection on RedHat-based systems.

#### Detection v2.12.5

* Improved detection model


## DIM-24.9.1

Release date: Oct 07, 2024

### Versions

* **Digger**: 0.38.0
* **Interceptors**: 0.38.0
* **Detection**: 2.12.4
* **Helm chart**: 1.46.0

### Changes

In this version, we have removed `rpcapd`, as it is no longer in use. Additionally, this release includes multiplexed gRPC support, stability fixes, and an improved detection model.

#### Interceptors v0.38.0

* Multiplexed gRPC support

#### Digger v0.38.0

1. Improved gRPC support
2. Stability fixes

#### Detection v2.12.4

* Improved detection model

#### Helm chart v1.46.0

* Removed obsolete `rpcapd`, we don't use it anymore


## DIM-24.8.1-hotfix

Release date: Aug 16, 2024

### Versions

* **Digger**: 0.37.2
* **Interceptors**: 0.37.2
* **Detection**: 2.11.8
* **Helm chart**: 1.45.1

### Changes

This is a hotfix release with improved metrics.

#### Interceptors v0.37.2

* Improved metrics

#### Digger v0.37.2

* Improved metrics


## DIM-24.8.1

Release date: Aug 15, 2024

### Versions

* **Digger**: 0.37.1
* **Interceptors**: 0.37.1
* **Detection**: 2.11.8
* **Helm chart**: 1.45.0

### Changes

In this release we are starting to support interception of gRPC traffic.

#### Interceptors v0.37.1

* Support of gRPC interception

#### Digger v0.37.1

* Bugfixes


## DIM-24.7.1-hotfix

Release date: Jul 18, 2024

### Versions

* **Digger**: 0.36.1
* **Interceptors**: 0.36.1
* **Detection**: 2.11.8
* **Helm chart**: 1.44.1

### Changes

This is a bugfix release.

#### Interceptors v0.36.1

* Fixed the TLS parsing issue that resulted in occasional restarts.


## DIM-24.7.1

Release date: Jul 08, 2024

### Versions

* **Digger**: 0.36.0
* **Interceptors**: 0.36.0
* **Detection**: 2.11.8
* **Helm chart**: 1.44.0

### Changes

This release contains bugfixes and improved detection component. The `useVault` variable in the Helm chart renamed to `useExternalSecrets` for consistency.

#### Interceptors v0.36.0

* Fixed memory leak

#### Detection v.2.11.8

1. Optimizations
2. Improved model

#### Helm chart v1.44.0

* `useVault` renamed to `useExternalSecrets`


## DIM-24.5.2

Release date: May 27, 2024

### Versions

* **Digger**: 0.35.0
* **Interceptors**: 0.35.0
* **Detection**: 2.11.4
* **Helm chart**: 1.43.0

### Changes

Connections between Kubernetes services and S3 buckets in AWS are now monitored by default. Both DIM and DAR sensors must be deployed for this to work. Everything should work out of the box, no configuration changes required.

#### Interceptors v0.35.0

* Bugfixes

#### Digger v0.35.0

* Reduced memory consumption when handling Kubernetes metadata

#### Detection v.2.11.4

1. Improved retrained model
2. Bugfixes

#### Helm chart v1.43.0

* S3 connections monitoring enabled by default.


## DIM-24.5.1

Release date: May 07, 2024

### Versions

* **Digger**: 0.34.0
* **Interceptors**: 0.34.0
* **Detection**: 2.11.2
* **Helm chart**: 1.42.0

### Changes

In this release, we've introduced the discovery of connections between services in your Kubernetes cluster and S3 buckets in AWS. Both DIM and DAR sensors must be deployed for this functionality to work. You do not need to update the configuration settings; everything should work out of the box.

Additionally, we've updated the Python version in Detection to 3.11 and introduced support for custom types (not yet available in the product UI).

#### Interceptors v0.34.0

1. TLS discovery
2. Extended TCP analysis

#### Digger v0.34.0

1. TLS discovery
2. Extended TCP analysis
3. S3 connectivity from services to buckets

#### Detection v.2.11.2

1. Upgrade to Python 3.11
2. Improved retrained model
3. Alpha release of customer data types support

## DIM-24.4.2

Release date: Apr 26, 2024

### Versions

* **Digger**: 0.33.0
* **Interceptors**: 0.33.0
* **Detection**: 2.10.5
* **Helm chart**: 1.41.2

### Changes

#### Detection v.2.10.5

1. Improved detection quality
2. Fix of the update procedure


## DIM-24.4.1

Release date: Apr 16, 2024

### Versions

* **Digger**: 0.33.0
* **Interceptors**: 0.33.0
* **Detection**: 2.9.6
* **Helm chart**: 1.41.1

### Changes

#### Helm chart v1.41.1

1. Support for `updateStrategy` for Interceptors
2. Support for getting tokens from HashiCorp Vault


## DIM-24.3.1

Release date: Mar 15, 2024

### Versions

* **Digger**: 0.33.0
* **Interceptors**: 0.33.0
* **Detection**: 2.9.6
* **Helm chart**: 1.41.0

### Changes

#### Interceptors v0.33.0

1. Reduced memory consumption
2. Bugfixes

#### Digger v0.33.0

* Reduced memory consumption when collecting metadata on Kubernetes pods

#### Detection v.2.9.6

1. Improved model
2. Reduced memory consumption (Kubernetes settings stay the same for now)


## DIM-24.2.1

Release date: Feb 15, 2024

### Versions

* **Digger**: 0.32.0
* **Interceptors**: 0.32.0
* **Detection**: 2.9.0
* **Helm chart**: 1.40.0

### Changes

#### Interceptors v0.32.0

1. Reduced resource consumption (Kubernetes limits stay the same for now)
2. Bugfixes: memory leak, faulty metrics

#### Detection v2.9.0

1. Improved model
2. Kubernetes memory `requests` increased to `2252Mi`, `limits` to `2764Mi`  


## DIM-24.1.3

Release date: Jan 31, 2024

### Versions

* **Digger**: 0.31.5
* **Interceptors**: 0.31.5
* **Detection**: 2.8.3
* **Helm chart**: 1.39.0

### Changes

#### Interceptors v0.31.5

1. Completely refactored traffic sampling mechanism, codenamed `capster`. It is enabled by default but can be turned off if needed. The interceptor monitors traffic on each discovered virtual interface for a predefined period before proceeding to the next interface. `capster` was introduced to further reduce the resources required for representative traffic capturing.
    * When `capster` is enabled, the interceptor does not use `rpcapd`, but the container remains deployed for the time being. 
2. Bugfixes
3. Helm configuration:
    1. CPU and MEM `requests` reduced by half
    2. MEM `limits` reduced by 25%
    3. `capster` configuration:
        1. `useCapster: true` by default, can be set to `false` to turn `capster` off
        2. `listenIterationDuration` controls the duration for which `capster` listens on an interface, thereby effectively determining the frequency of interface switching. Default value is `5m0s`


## DIM-24.1.2

Release date: Jan 24, 2024

### Versions

* **Digger**: 0.30.1
* **Interceptors**: 0.30.1
* **Detection**: 2.8.3
* **Helm chart**: 1.38.0

### Changes

#### Digger v0.30.1

* Added new config parameter to disable / enable URL clustering


## DIM-24.1.1

Release date: Jan 22, 2024

### Versions

* **Digger**: 0.30.0
* **Interceptors**: 0.30.0
* **Detection**: 2.8.3
* **Helm chart**: 1.37.0

### Changes

#### Digger v0.30.0

* Refactoring

#### Detection v2.8.3

* Improved liveness probe for highly loaded clusters


## DIM-23.12.1

Release date: Dec 27, 2023

### Versions

* **Digger**: 0.29.0
* **Interceptors**: 0.29.0
* **Detection**: 2.7.1
* **Helm chart**: 1.36.1

### Changes

#### Digger v0.29.0

* Detection corrector:
    * Requester and responder assets metadata (including Kubernetes namespace) used in the API
    * Improved metrics

#### Interceptors v0.29.0

1. Default metrics port changed to `18954` to avoid collisions with other pods due to `HostNetwork` usage
2. Improved stopping mechanism to prevent breaking of rolling updates
3. Helm configuration:
    1. Stop timeout set to 55 sec
    2. Grace period set to 60 sec

#### Detection v2.7.1

* Added liveness probe


## DIM-23.11.1-hotfix

Release date: Nov 30, 2023

### Versions

* **Digger**: 0.28.1
* **Interceptors**: 0.28.1
* **Detection**: 2.7.1
* **Helm chart**: 1.35.0

### Changes

#### Digger v0.28.1

* Fixed panic in the pod controllers cache


## DIM-23.11.1

> DO NOT USE, critical Digger issue

Release date: Nov 28, 2023

### Versions

* **Digger**: 0.28.0
* **Interceptors**: 0.28.0
* **Detection**: 2.7.1
* **Helm chart**: 1.34.0

### Changes

#### Digger v0.28.0

1. K8s API improvements:
    1. Improved metadata caching
    2. Queued event processing (+metrics)
2. Increased initialization speed for clusters with huge number of entities
3. Events with unresolved K8s metadata are excluded from processing

#### Interceptors v0.28.0

* Refactoring

#### Detection v2.7.1

1. New retrained version of the ML model
2. Fixed version metrics

