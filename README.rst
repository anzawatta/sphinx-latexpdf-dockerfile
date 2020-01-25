What's this
===========

SphinxでLaTeX生成用のDockerfile。

Windowsでdocker buildする場合はtzdataを導入済のイメージを用意しておくと幸せになれる（anzawatta/ubuntu19.10）。

`docker run` の前に
--------------------

1. `src/requirements.txt` の確認をすること。ファイル内でSphinxのバージョン指定をしている。
2. フォントは `src/fonts/` 配下に用意すること。

Usage
=====

`docker run` すると自動で `pip install` が始まる。

Windows用。

.. code-block::

   $ docker build -t imagename .
   $ winpty docker run -it -v $(cygpath -w $(pwd))/src:/docs imagename

Mac用。

.. code-block::

   $ docker build -t imagename .
   $ docker run -it -v src:/docs imagename

