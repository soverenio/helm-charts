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

## DIM-24.4.1

Release date: Apr 11, 2024

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

