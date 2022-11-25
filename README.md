# s2i Rust

Sample source-to-image builder image for Rust apps on OpenShift Container Platform. Not intended for production use.

## Getting started  

Build the Dockerfile and push to Container Registry. Then create the ImageStream (see imagestream.yml - replace image with your .from.name with your image) on OpenShift. 

```sh
oc create -f imagestream.yml --as system:admin
```

Now you can select the new Rust Builder when creating new apps. You can use [this Rust app](https://github.com/nikolaus-lemberski/hello-rust) to test it.

## Helper scripts

You can use the helper scripts

* build_tag_push_create.sh
* build_tag_push_replace.sh

to speed up the building, tagging and applying to OpenShift.