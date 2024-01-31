# Soveren Data-In-Motion (DIM) Sensor releases

There are the following components of the DIM Sensor: Digger, Interceptors, Detection, Kafka, Prometheus agent. Below you can find the release notes with changes in components and their versions. There is also the Helm chart version for each release.

If the component is not mentioned in the release notes, it means that there were no changes in it.

Versions of Digger and Interceptors are synchronized, but sometimes there are changes in one of them only. In this case, the component that has no changes is not mentioned in the release notes.

## DIM-24.1.2

Release date: Jan 24, 2024

### Versions

* **Digger**: 0.30.1

* **Interceptors**: 0.30.1

* **Detection**: 2.8.3

* **Helm chart**: 1.38.0

### Changes

#### Digger v0.30.1

Added new config parameter to disable/enable URL clustering


## DIM-24.1.1

Release date: Jan 22, 2024

### Versions

* **Digger**: 0.30.0

* **Interceptors**: 0.30.0

* **Detection**: 2.8.3

* **Helm chart**: 1.37.0

### Changes

#### Digger v0.30.0

Refactoring

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

1. Default metrics port changed to `18954` avoid collisions with other pods due to the `HostNetwork`

2. Improved stopping mechanism to prevent breaking rolling updates

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

Fixed panic in the pod controllers cache


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

Refactoring

#### Detection v2.7.1

1. New retrained version of the ML model

2. Fixed version metrics
