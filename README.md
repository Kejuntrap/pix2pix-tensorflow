# pix2pix-tensorflow

Foked from [pix2pix-tensorflow](https://github.com/affinelayer/pix2pix-tensorflow)

Based on [pix2pix](https://phillipi.github.io/pix2pix/) by Isola et al.

## 変更点

tensorflow 1.15.3 , python3.6.9で動くようにした。

具体的には
`pix2pix.py`の一部加筆でtensorflowがメモリを大食いしてメモリエラーで落ちないようにした。

```python
gpu_options = tf.compat.v1.GPUOptions(per_process_gpu_memory_fraction=0.5)
sess = tf.compat.v1.Session(config=tf.compat.v1.ConfigProto(gpu_options=gpu_options))
```

### 環境構築

- python 3.6.9
- cuDNN v7.6.5
- CUDA v10.0
- tensorflow 1.15.3

その他必需品: Git

[参考サイト](https://www.kkaneko.jp/dblab/gan/pix2pix.html)

python3.6.9を入れてvenvで仮想環境を構築する。

概略
```
py -3.6 -m venv venv\tf115py36
venv\tf115py36\Scripts\activate.bat
python -m pip install -U pip setuptools
python -m pip install -U jupyterlab jupyter jupyter-console jupytext spyder
python -m pip install -U pip setuptools
python -m pip install -U tensorflow-gpu==1.15.3 tensorflow_datasets
```

でGPUが使えるtensorflow(v1)を構築する（上記の環境を入れてパスまで通す必要あり）

確認は
```
python -c "import tensorflow as tf; print( tf.__version__ )"
python -c "from tensorflow.python.client import device_lib; print(device_lib.list_local_devices())"
```
で行える。

参考: https://www.kkaneko.jp/dblab/gan/pix2pix.html

### pix2pixのインストール

`python tools\download-dataset.py facades`でデータセットを落とせる。


### その他

`act.bat`: 仮想環境に入るバッチスクリプト

`pix2pix.bat`: pix2pixのデモを行うスクリプト
