# Amazon Linux 2 ImageMagick Binaries (From Source)

This repository builds standalone ImageMagick binaries for Amazon Linux 2 that can be copy-pasted to any AWS Lambda function or EC2 instance.

**Blog post:** https://www.bytescale.com/blog/installing-imagemagick-on-amazon-linux-2/

**AWS Lambda Full Example:** https://github.com/bytescale/aws-lambda-image-magick-resize-example

## Quick Start

1. Checkout the repository:
 
   ```bash
   git clone git@github.com:bytescale/aws-image-magick-example.git
   
   cd aws-image-magick-example
   ```
   
2. Build the docker image:

   ```shell
   podman build \
     --platform linux/amd64 \
     -t amazonlinuxmagick .
   ```

3. Extract the docker image's ImageMagick binaries:

   ```shell
   docker run \
     --rm -it \
     --platform linux/amd64 \
     -v $(pwd)/binaries:/root/output \
     amazonlinuxmagick \
     mv /root/result /root/output
   ```

4. `./binaries/result` on your host machine now contains a portable set of ImageMagick binaries!
