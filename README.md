## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

    helm repo add soveren https://soverenio.github.io/helm-charts

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
soveren` to see the charts.

### Soveren Agent
To install the `soveren-agent` chart:

    helm install -n soverenio soveren-agent soveren/soveren-agent --set digger.token="<TOKEN>"

To uninstall the chart:

    helm delete my-soveren-agent

### DAR Sensor
To install the `soveren-dar-sensor` chart:

Create a file named `values.yaml` with the following content:
```yaml 
crawler:
  token: "<TOKEN>"
  cfg:
    s3:
      enabled: true
      accessKeyId: "<YOUR S3 ACCESS KEY ID>"
      secretAccessKey: "<YOUR S3 ACCESS KEY>"
    kafka:
      enabled: true
      elements:
        - instancename: "<YOUR KAFKA INSTANCE NAME>"
          brokers: ["<YOUR KAFKA INSTANCE BROKER 1>", "<YOUR KAFKA INSTANCE BROKER 2>", ..., "<YOUR KAFKA INSTANCE BROKER N>"]
          user: "<YOUR KAFKA INSTANCE USER>"
          password: "<YOUR KAFKA INSTANCE PASSWORD>"
    database:
      postgres:
          enabled: true
          elements:
            - name: "<YOUR POSTGRES INSTANCE NAME>"
              connectionString: "<YOUR POSTGRES INSTANCE CONNECTION STRING>"
```

    helm install -n soverenio-dar-sensor soveren-dar-sensor soveren/soveren-dar-sensor -f values.yaml


For further details, please refer to the [soveren-agent](https://docs.soveren.io/en/stable/getting-started/quick-start/) documentation.
