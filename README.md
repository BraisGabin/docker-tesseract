# Docker Tesseract

A docker image of Tesseract OCR and its training tools

## How to use

```sh
docker run --rm -it -v ~/training/:/training braisgabin/tesseract-ocr bash
cd /training
text2image ...
```

In this example you have your training data in `~/training/` and you mount that
in `/training`. Then you can run all the commands that you need to build your
`.traineddata`.
