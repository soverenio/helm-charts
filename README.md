## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

    helm repo add soveren https://soverenio.github.io/helm-charts

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
soveren` to see the charts.

To install the `soveren-agent` chart:

    helm install my-soveren-agent soveren/soveren-agent --set digger.token="<TOKEN>"

To uninstall the chart:

    helm delete my-soveren-agent
